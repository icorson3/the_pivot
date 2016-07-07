class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:welcome] = "Thanks for creating an account!"
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages[0]
      render :new
    end
  end

  def show
    return redirect_to login_path if current_user.nil?

    @user = current_user
    @users = User.all
    @users = User.search(params[:search]).order("username DESC")

    if current_user.super_admin?
      redirect_to admin_dashboard_path
    else
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "#{@user.username}'s information has been updated."
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages[0]
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation,
                                 :email, :email_confirmation, :name, :address,
                                 :city, :state, :zip, :vendor_id, :role)
  end
end
