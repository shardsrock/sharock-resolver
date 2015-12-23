require "json"

require "../resolver/dependency_list"

module Sharock::Results
  class Dependency
    def initialize(dependency : Resolver::Dependency)
      @dependency = dependency
    end

    def to_json(io : IO)
      package = @dependency.package
      repository = @dependency.dependency
      spec = package.spec

      io.json_object do |object|
        object.field "name", spec.name
        object.field "description", spec.description
        object.field "license", spec.license
        object.field "licenseUrl", spec.license_url
        object.field "requirements", package.requirements
        object.field "version", package.version
        object.field "matchingVersions", package.matching_versions
        object.field "sortedVersions", package.sorted_versions
        object.field "repository", repository
      end
    end
  end
end
