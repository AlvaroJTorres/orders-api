module Users
  class CreatorService < ApplicationService
    def initialize(params)
      super()
      @params = params
    end

    def call
      form = UserForm.new(User.new)
      raise CustomError.new(nil, nil, nil, form.errors.messages) unless form.validate(@params)
      new_user = User.create(@params)

      UserRepresenter.new(new_user)
    end
  end
end