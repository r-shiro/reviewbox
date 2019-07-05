class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.new(user_id: @current_user.id, post_id: params[:post_id],comment: params[:comment],rating: params[:rating])
    @comment.save
    flash[:notice]="コメントを追加しました"
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @comment = Comment.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @comment.destroy
    flash[:notice]="コメントを削除しました"
    redirect_to("/users/#{@current_user.id}")
  end
  
  def edit
     @comment = Comment.find_by(user_id: @current_user.id,post_id: params[:post_id])
     @post=Post.find_by(id: params[:post_id])
  end
  
  def update
    @comment = Comment.find_by(user_id: @current_user.id,post_id: params[:post_id])
    @comment.comment=params[:comment]
    @comment.rating=params[:rating]
    
    if @comment.save
      flash[:notice]="コメントを変更しました"
    redirect_to("/users/#{@current_user.id}")
     
    else 
      render("/users/#{@current_user.id}")
    end
  end
  
  
end
