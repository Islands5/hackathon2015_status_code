class UsersController < ApplicationController
  def comments
    @user = User.where(:id => params[:id]).first
    @user.comment
  end
end
