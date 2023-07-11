module Users
  class FinderService < ApplicationService
    def initialize(id)
      super()
      @id = id
    end

    def call
      raise CustomError.new(nil, 'User not found', 404, nil) unless user = User.find_by(id: @id)

      UserRepresenter.new(user)
    end
  end
end