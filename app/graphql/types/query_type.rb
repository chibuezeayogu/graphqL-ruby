module Types
  class QueryType < Types::BaseObject
    field :all_links, function: Resolvers::LinksSearch
  end
end
