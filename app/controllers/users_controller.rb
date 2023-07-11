class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy]

  def index
    users = Users::IndexService.call()
    render json: { data: users }
  end

  def show
    user = Users::FinderService.call(params[:id])
    render json: { data: user }
  end

  def create
    user = Users::CreatorService.call(user_params)
    render json: { data: user }, status: :created
  end

  def update
    user = Users::UpdaterService.call(user_params, @user)
    render json: { data: user }
  end

  def destroy
    Users::DestroyService.call(@user)
    render body: nil, status: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def set_user
    raise CustomError.new(nil, 'Order not found', 404, nil) unless @user = User.find_by(id: params[:id])
  end
end
