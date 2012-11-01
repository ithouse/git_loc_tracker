require 'spec_helper'

describe GitLocTracker::CommandConstructor do
  it "should receive options" do
    options = {option_1: "a", option_2: "b"}
    command_constructor = GitLocTracker::CommandConstructor.new options
    command_constructor.options.should == options
  end

  it "should construct git command containing --since option" do
    command_constructor = GitLocTracker::CommandConstructor.new({from: "1 day ago"})
    command_constructor.git_command.should include("--since='1 day ago'")
  end

  it "should construct git command containing --until option" do
    command_constructor = GitLocTracker::CommandConstructor.new({till: "1 day from now"})
    command_constructor.git_command.should include("--until='1 day from now'")
  end

  it "should construct git command containing --author option" do
    command_constructor = GitLocTracker::CommandConstructor.new({author: "Janis"})
    command_constructor.git_command.should include("--author='Janis'")
  end

  it "should construct git command containing path" do
    command_constructor = GitLocTracker::CommandConstructor.new({path: "/home/user/app_root"})
    command_constructor.git_command.should include("cd /home/user/app_root")
  end

  it "should construct git command containing search scope" do
    command_constructor = GitLocTracker::CommandConstructor.new({search_scope: "lib bin"})
    command_constructor.git_command.should include("lib bin")
  end

  it "should not construct git command containing non-existing search scope directories" do
    command_constructor = GitLocTracker::CommandConstructor.new({search_scope: "non_existing_1 non_existing_1"})
    command_constructor.git_command.should_not include("non_existing")
  end

  it "should constrict git command containing modified line matching regexp" do
    command_constructor = GitLocTracker::CommandConstructor.new({})
    command_constructor.git_command.should include(GitLocTracker::CommandConstructor::NEW_CODE_REGEXP.source)
    command_constructor.git_command.should include(GitLocTracker::CommandConstructor::DELETED_CODE_REGEXP.source)
  end


end