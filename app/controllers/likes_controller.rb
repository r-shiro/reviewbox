class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
    @like.save
    flash[:notice]="いいね！しました"
    redirect_to :back
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
    flash[:notice]="いいね！を取り消しました"
    redirect_to :back
  end
  
end
