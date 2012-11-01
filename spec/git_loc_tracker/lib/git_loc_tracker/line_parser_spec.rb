require 'spec_helper'

describe GitLocTracker::LineParser do
  it "should initialize object with command attribute" do
    GitLocTracker::LineParser.new("line string").line.should == "line string"
  end

  it "should detect new line" do
    source_line = "{+Some new line+}"
    GitLocTracker::LineParser.new(source_line).is_new?.should be_true
  end

  it "should detect deleted line" do
    source_line = "[-Some deleted line-]"
    GitLocTracker::LineParser.new(source_line).is_deleted?.should be_true
  end

  it "should detect modified line" do
    source_line = "[-old deleted part-]{+replaced with new part+}"
    GitLocTracker::LineParser.new(source_line).is_modified?.should be_true
  end

  it "should detect modified line which also contains unmodified parts" do
    source_line = "Some unmodified part [-old deleted part-]{+replaced with new part+}"
    GitLocTracker::LineParser.new(source_line).is_modified?.should be_true
  end

  it "should not count modified line as deleted or new line" do
    source_line = "[-old deleted part-]{+replaced with new part+}"
    GitLocTracker::LineParser.new(source_line).is_new?.should be_false
    GitLocTracker::LineParser.new(source_line).is_deleted?.should be_false
  end

end