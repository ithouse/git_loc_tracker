module GitLocTracker
  class LineParser
    attr_accessor :line

    def initialize line
      @line = line
    end

    def line_size_without_deleted_code
      line.strip.gsub(GitLocTracker::CommandConstructor::DELETED_CODE_REGEXP, "").size
    end

    def line_size_without_new_code
      line.strip.gsub(GitLocTracker::CommandConstructor::NEW_CODE_REGEXP, "").size
    end

    def is_new?
      line_size_without_new_code == 0
    end

    def is_deleted?
      line_size_without_deleted_code == 0
    end

    def is_modified?
      !is_new? && !is_deleted?
    end
  end
end