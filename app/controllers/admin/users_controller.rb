class Admin::UsersController < Admin::BaseController
  def show
    @user = current_user
    @orders = Order.where(user_id: @user.id).count
  end
end
