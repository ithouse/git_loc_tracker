require 'spec_helper'

describe GitLocTracker::CommandExecutor do
  let(:spec_root) { File.expand_path(File.join(File.dirname(__FILE__), '..', '../../')) }

  it "should initialize object with command attribute" do
    GitLocTracker::CommandExecutor.new("git command").command.should == "git command"
  end

  it "should execute git command and return line array" do
    executor = GitLocTracker::CommandExecutor.new("cd #{spec_root}/test_repo/ && git st")
    executor.git_lines.should_not be_empty
  end

  it "should raise GitCommandError if invalid git command is provided" do
    executor = GitLocTracker::CommandExecutor.new("cd #{spec_root}/test_repo/ && git non_existing_command")
    lambda { executor.git_lines }.should raise_error(GitLocTracker::CommandExecutor::GitCommandError)
  end

end