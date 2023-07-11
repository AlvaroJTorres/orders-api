module Users
  class IndexService < ApplicationService
    def initialize()
      super()
    end

    def call
      UserRepresenter.for_collection.new(User.all)
    end
  end
end
