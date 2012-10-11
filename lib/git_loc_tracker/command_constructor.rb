module GitLocTracker
  class CommandConstructor

    attr_accessor :options

    NEW_CODE_REGEXP = /\{\+.*\+\}/
    DELETED_CODE_REGEXP = /\[\-.*\-\]/

    def initialize options
      @options = options
    end

    def git_command
      command_parts = []
      options.each do |name, argument|
        command_parts << get_command_part(name, argument)
      end
      "cd #{options[:path]} && git log -p --word-diff #{command_parts.join(" ")} #{existing_search_scope} | egrep '#{modified_line_parser_regexp}'"
    end

    private

    def get_command_part name, argument
      case name
        when :from
          "--since='#{options[:from]}'"
        when :till
          "--until='#{options[:till]}'"
        when :author
          "--author='#{options[:author]}'"
        else
          ""
      end
    end

    def existing_search_scope
      scope_parts = options[:search_scope].split(" ")
      existing_scope_dirs = scope_parts.select { |dir| File.exist?("#{options[:path]}/#{dir}") }
      existing_scope_dirs.join(" ")
    end


    def modified_line_parser_regexp
      "#{GitLocTracker::CommandConstructor::DELETED_CODE_REGEXP.source}|#{GitLocTracker::CommandConstructor::NEW_CODE_REGEXP.source}"
    end

  end
end