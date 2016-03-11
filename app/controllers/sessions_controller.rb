class SessionsController < ApplicationController
  before_action :authenticate, only: [:edit, :update]

  def new
  end

  def edit
    @author = Author.find(session[:user_id])
  end

  def create
    author = Author.find_by(email: params[:email])
    if author && author.authenticate(params[:password])
      session[:user_id] = author.id
      redirect_to root_path, notice: "Login Great Success"
    else
      flash.now[:alert] = "Incorrect login information.  Please try again"
      render :new
    end
  end

  def update
    author = Author.find_by(email: user_params[:email])
    if author && author.authenticate(user_params[:password])
      author.update(password: session_params[:new_password])
      redirect_to root_path, notice: "Password has been changed"
    else
      flash.now[:alert] = "Old Password Does Not Match!"
      render :edit
    end
  end

  def destroy
    session[:user_id] = nil
    session[:role_name] = nil
    redirect_to login_path, notice: "Logged out"
  end

  private def session_params
    params.require(:form_fields).permit(:email, :password, :new_password)
  end
end
