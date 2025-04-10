class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      remember_or_forget(@user)
      flash[:success] = t "noti.login_success"
      redirect_to user_path(id: @user.id)
    else
      flash.now[:danger] = t "noti.ivalid_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in
    flash[:success] = t "noti.logout_success"
    redirect_to root_path, status: :see_other
  end

  private

  def load_user
    @user = User.find_by(email: params[:session][:email]&.downcase)
  end

  def remember_or_forget user
    if params[:session][:remember_me] == "1"
      remember(user)
    else
      forget(user)
    end
  end
end
