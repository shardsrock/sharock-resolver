#require "shards"

module Shards
  class Dependency
    def to_package
      self.as_package?
    end
  end
end
