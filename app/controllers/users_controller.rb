class UsersController < ApplicationController
  http_basic_authenticate_with name: "mh", password: "secret", except: [:index, :show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_path)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @user = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to user_path
  end
  
  private
    def user_params
      params.require(:user).permit(:title, :text)
    end
end
