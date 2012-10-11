require 'systemu'

module GitLocTracker
  class CommandExecutor
    class GitCommandError < StandardError
    end
    attr_accessor :command

    def initialize command
      @command = command
    end

    def git_lines
      stdin, stdout, stderr = systemu command
      raise_if_error(stderr)
      stdout.split("\n")
    end

    def raise_if_error(stderr)
      unless stderr.empty?
        raise GitCommandError, stderr
      end
    end
  end
end