module Sharock
  module Resolver
    class DependencyList
      getter dependencies
      getter development_dependencies

      def initialize(
                     @dependencies : Array(Sharock::Resolver::Dependency),
                     @development_dependencies : Array(Sharock::Resolver::Dependency))
      end
    end
  end
end
