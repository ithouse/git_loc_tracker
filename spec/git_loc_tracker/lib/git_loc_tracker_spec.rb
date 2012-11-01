require 'spec_helper'

#spec/test_repo is a git repo containing file test_file which was initialized and commited 3 times:
#1) with 10 new lines
#2) with 5 modified lines
#3) with 5 deleted lines

describe GitLocTracker::Statistics do

  TOTAL_LINES_AFFECTED_IN_TEST_REPO = 20
  NEW_LINES_IN_TEST_REPO = 10
  MODIFIED_LINES_IN_TEST_REPO = 5
  DELETED_LINES_IN_TEST_REPO = 5

  let(:default_git_options) do
    {path: "#{File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))}/test_repo/",
     from: "2012-10-31",
     till: "2012-11-01",
     author: "Janis",
     search_scope: "test_file"}
  end

  it "should receive git options in initializer" do
    options = {option_1: 1, option_2: 2}
    GitLocTracker::Statistics.new(options).git_command_options.should == options
  end

  it "should return correct git command" do
    git_command = "cd /home/janis/code/git_loc_tracker/spec/test_repo/ && git log -p --word-diff  --since='2012-10-31' --until='2012-11-01' --author='Janis'  test_file | egrep '\\[\\-.*\\-\\]|\\{\\+.*\\+\\}'"
    GitLocTracker::Statistics.new(default_git_options).send(:git_command).should == git_command
  end

  it "should return correct amount of changed line count in test_file" do
    GitLocTracker::Statistics.new(default_git_options).send(:git_lines).count == TOTAL_LINES_AFFECTED_IN_TEST_REPO
  end

  it "should return correct amount of new lines in test_file" do
    GitLocTracker::Statistics.new(default_git_options).new_line_count.should == NEW_LINES_IN_TEST_REPO
  end

  it "should return correct amount of deleted lines in test_file" do
    GitLocTracker::Statistics.new(default_git_options).deleted_line_count.should == DELETED_LINES_IN_TEST_REPO
  end

  it "should return correct amount of modified lines in test_file" do
    GitLocTracker::Statistics.new(default_git_options).modified_line_count.should == MODIFIED_LINES_IN_TEST_REPO
  end

end