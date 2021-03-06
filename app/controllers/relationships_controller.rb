class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user =User.find(params[:relationship][:follow_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
    end
  end

  def destroy
    @user = User.find(params[:relationship][:follow_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
    end
  end

end
