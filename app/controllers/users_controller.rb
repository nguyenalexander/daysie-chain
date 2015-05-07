class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create

    unless User.find_by_email(params[:user][:email])
      @user = User.create :firstname => params[:user][:firstname], :lastname => params[:user][:lastname], :email => params[:user][:email], :tel => params[:user][:tel], :password => params[:user][:password]
    else
      render :plain => 'ERROR DICKHEAD'
    end
    render :json => @user
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :tel, :password)
  end


end