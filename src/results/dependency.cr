require "json"

require "../resolver/dependency_list"

module Sharock::Results
  class Dependency
    def initialize(dependency : Sharock::Resolver::Dependency)
      @dependency = dependency
    end

    def to_json(json : JSON::Builder)
      #JSON.build do |json|
        json.object do
          json.field "name", name
          json.field "description", description
          json.field "requiredVersion", requiredVersion
          json.field "matchedVersion", matchedVersion
          json.field "latestVersion", latestVersion
          json.field "status", status
        end
      #end
    end

    def name
      @dependency.dependency.as_package?.not_nil!.spec.name
    end

    def description
      @dependency.dependency.as_package?.not_nil!.spec.description
    end

    def requiredVersion
      @dependency.dependency.as_package?.not_nil!.version.to_s
    end

    def matchedVersion
      @dependency.dependency.as_package?.not_nil!.version.to_s
    end

    def latestVersion
      @dependency.dependency.as_package?.not_nil!.sorted_versions.last?.to_s
    end

    def status
      if matchedVersion == latestVersion
        "up_to_date"
      elsif requiredVersion == matchedVersion
        "pinned_out_of_date"
      else
        "out_of_date"
      end
    end
  end
end
