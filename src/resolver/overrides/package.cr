module Shards
  class Package
    def sorted_versions
      resolver.available_releases
    end

    #private def available_versions
    #  available_versions = resolver.available_versions
    #end
  end
end
