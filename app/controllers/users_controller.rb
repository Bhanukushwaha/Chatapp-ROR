class UsersController < ApplicationController
  def reset_password
    @user = User.find_by_id(params[:id])
  end

  def password_update
    @user = User.find_by_id(params[:user])
    if (params[:password] == params[:password_confirmation])
      @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      
      redirect_to "/" 
    else
      @error = "password not match"
    end
  end
ends