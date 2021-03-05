class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    if following = current_user.follow(@user.id)
      flash[:success] = "ユーザーをフォローしました"
      redirect_to request.referer
    else
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user.id)
    if following.destroy
      flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to request.referer
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_to @user
    end
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end

end
