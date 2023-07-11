module Users
  class DestroyService < ApplicationService
    def initialize(user)
      super()
      @user = user
    end

    def call
      @user.destroy
    end
  end
end