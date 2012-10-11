require "git_loc_tracker/version"
require "git_loc_tracker/command_constructor"
require 'systemu'

module GitLocTracker

  class Statistics
    class GitCommandError < StandardError
    end

    attr_accessor :git_lines, :git_command

    def initialize options
      debugger
      @git_command = GitLocTracker::CommandConstructor.new(options).git_command
    end

    def print_statistics
      set_raw_git_lines
      puts "********************************"
      puts "New      lines: #{new_line_count}"
      puts "Deleted  lines: #{deleted_line_count}"
      puts "Modified lines: #{modified_line_count}"
      puts "********************************"
    end

    def new_line_count
      git_lines.count do |line|
        is_new? line
      end
    end

    def deleted_line_count
      git_lines.count do |line|
        is_deleted? line
      end
    end

    def modified_line_count
      git_lines.count do |line|
        is_modified? line
      end
    end

    def is_new?(line)
      line.strip.gsub(GitCommandConstructor::NEW_CODE_REGEXP, "").size == 0
    end

    def is_deleted?(line)
      line.strip.gsub(GitCommandConstructor::DELETED_CODE_REGEXP, "").size == 0
    end

    def is_modified? line
      line.strip.gsub(GitCommandConstructor::DELETED_CODE_REGEXP, "").size > 0 ||
          line.strip.gsub(GitCommandConstructor::NEW_CODE_REGEXP, "").size > 0
    end

    def set_raw_git_lines
      stdin, stdout, stderr = systemu git_command
      raise_if_error(stderr)
      self.git_lines = stdout.split("\n")
    end

    def raise_if_error(stderr)
      unless stderr.empty?
        raise GitCommandError, stderr
      end
    end
  end

end