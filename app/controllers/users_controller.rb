class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    return unless @user.nil?

    flash[:danger] = t "noti.user_not_found"
    redirect_to root_path
  end
end
