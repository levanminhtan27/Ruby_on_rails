class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # người dùng chỉ được create user  khi không đăng nhập
  skip_before_action :require_login, only: [:new, :create]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find_by id: params[:id]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Đăng ký thành công"
      redirect_to users_path
    else  
      flash[:success] = "Đăng kí thất bại"
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @user.update(user_params)
        redirect_to @user, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Đã xóa người dùng thành công." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name,:email, :password, :password_confirmation,:address)
    end
end
