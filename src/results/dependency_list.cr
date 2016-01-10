require "json"

require "../resolver/dependency_list"
require "./dependency"

module Sharock::Results
  class DependencyList
    getter dependencies
    getter developmentDependencies

    def initialize(@dependency_list : Resolver::DependencyList)
      @dependencies = to_results(@dependency_list.dependencies)
      @development_dependencies = to_results(@dependency_list.development_dependencies)
    end

    def to_json(io : IO)
      io.json_object do |object|
        object.field "dependencies", @dependencies
        object.field "developmentDependencies", @development_dependencies
      end
    end

    protected def to_results(dependencies)
      dependencies.map do |dependency|
        Dependency.new(dependency)
      end
    end
  end
end
