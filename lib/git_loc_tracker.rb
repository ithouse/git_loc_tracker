require "git_loc_tracker/version"
require "git_loc_tracker/command_constructor"
require "git_loc_tracker/command_executor"
require "git_loc_tracker/line_parser"

module GitLocTracker

  class Statistics

    attr_accessor :git_command_options, :git_lines, :git_command, :line_parser

    def initialize options
      @git_command_options = options
    end

    def new_line_count
      git_lines.count do |line|
        line_parser(line).is_new?
      end
    end

    def deleted_line_count
      git_lines.count do |line|
        line_parser(line).is_deleted?
      end
    end

    def modified_line_count
      git_lines.count do |line|
        line_parser(line).is_modified?
      end
    end

    def print_statistics
      puts "********************************"
      puts "New      lines: #{new_line_count}"
      puts "Deleted  lines: #{deleted_line_count}"
      puts "Modified lines: #{modified_line_count}"
      puts "********************************"
    end

    private

    def git_command
      @git_command ||= GitLocTracker::CommandConstructor.new(git_command_options).git_command
    end

    def git_lines
      @git_lines ||= GitLocTracker::CommandExecutor.new(git_command).git_lines
    end

    def line_parser line
      GitLocTracker::LineParser.new(line)
    end

  end

end