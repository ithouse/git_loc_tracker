module GitLocTracker
  POOP = "poop"
  #class CommandConstructor
  #
  #  attr_accessor :options
  #
  #  NEW_CODE_REGEXP = /\{\+.*\+\}/
  #  DELETED_CODE_REGEXP = /\[\-.*\-\]/
  #
  #  def initialize options
  #    @options = options
  #  end
  #
  #  def git_command
  #    command_parts = []
  #    options.each do |name, argument|
  #      command_parts << get_command_part(name, argument)
  #    end
  #    "cd #{options[:path]} && git log -p --word-diff #{command_parts.join(" ")} #{options[:search_scope]} | egrep '#{modified_line_parser_regexp}'"
  #  end
  #
  #  private
  #
  #  def get_command_part name, argument
  #    case name
  #      when :from
  #        "--since='#{options[:from]}'"
  #      when :till
  #        "--until='#{options[:till]}'"
  #      else
  #        ""
  #    end
  #  end
  #
  #  def modified_line_parser_regexp
  #    "#{GitCommandConstructor::DELETED_CODE_REGEXP.source}|#{GitCommandConstructor::NEW_CODE_REGEXP.source}"
  #  end
  #
  #end
end