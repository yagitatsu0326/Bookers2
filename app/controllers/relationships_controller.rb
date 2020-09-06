class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
  	following = current_user.follow(user_params)
  	following.save
    redirect_to request.referer
  end

  def destroy
  	following = current_user.unfollow(user_params)
    following.destroy
  	redirect_to request.referer
  end

  def follow
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.followers
  end


  private

  def user_params
    @user =User.find(params[:follow_id])
  end



end
