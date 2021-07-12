class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user= User.find_by email: params[:session][:email].downcase
    if 
      user && user.authenticate(params[:session][:password])
          flash[:success]="Đăng nhập thành công"
          check_login=true;
          log_in user
          redirect_to user
    else
      flash[:danger] = "Email/Mật khẩu không hợp lệ"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "Bạn đã đăng xuất"
    redirect_to homes_path
  end
end
