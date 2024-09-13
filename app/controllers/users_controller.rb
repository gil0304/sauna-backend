class UsersController < ApplicationController
  # ユーザー登録（SignUp）
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 201, message: "User created successfully", user: user }, status: :created
    else
      render json: { status: 400, errors: user.errors.full_messages }, status: :bad_request
    end
  end

  # ログイン（SignIn）
  def sign_in
    user = User.find_by(name: params[:user][:name])
    if user&.authenticate(params[:user][:password])
      render json: { status: 200, message: "Login successful", user: user }, status: :ok
    else
      render json: { status: 401, message: "Invalid username or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
end
