module Users
  class UpdaterService < ApplicationService
    def initialize(params, user)
      super()
      @params = params
      @user = user
    end

    def call
      form = UserForm.new(@user)
      raise CustomError.new(nil, nil, nil, form.errors.messages) unless form.validate(@params)
      @user.update(@params)

      UserRepresenter.new(@user)
    end
  end
end