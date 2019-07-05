class PostsController < ApplicationController
  before_action :only_master, {only: [:new,:create,:edit,:update,:destroy]}
  
  def index
    @posts=Post.all.order(created_at: :desc)
  end
  
  def show 
    @post=Post.find_by(id: params[:id])
  end
  
  def new
    @post=Post.new(id: params[:id])
  end
  
  def create
     @post=Post.find_by(name: params[:name],genre: params[:genre])
     if @post
       flash[:notice]="すでに作品は存在します"
       render("/posts/new")
       
     else
      @post=Post.new(name: params[:name],subname: params[:subname],genre: params[:genre],creator: params[:creator],company: params[:company],content: params[:content])
      @post.save
      flash[:notice]="作品を追加しました"
      redirect_to("/")
      
     end
  end
  
  def edit
    @post=Post.find_by(id: params[:id])
  end
  
  def update
    @post=Post.find_by(id: params[:id])
    @post.creator=params[:creator]
    @post.company=params[:company]
    @post.content=params[:content]
    
    if @post.save
      flash[:notice]="追加または変更しました"
    redirect_to("/posts/index")
     
    else 
      render("/posts/edit")
    end
  end
  
  def destroy
     @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
    if @posts.present?
      @posts
    else
      @posts=Post.all.order(created_at: :desc)
      flash[:notice]="検索結果に一致する作品はありませんでした"
    end
    render("/posts/index")
  end
  
  def comments
    @post = Post.find_by(id: params[:id])
  end
  
  def movie
    @posts=Post.where(genre: "映画").order(created_at: :desc)
    render("/posts/index")
  end
  
  def drama
     @posts=Post.where(genre: "ドラマ").order(created_at: :desc)
    render("/posts/index")
  end
  
  def anime
     @posts=Post.where(genre: "アニメ").order(created_at: :desc)
    render("/posts/index")
  end
  
  def anime_movie
     @posts=Post.where(genre: "アニメ映画").order(created_at: :desc)
    render("/posts/index")
  end
  
  def book
     @posts=Post.where(genre: "本").order(created_at: :desc)
    render("/posts/index")
  end
  
  def manga
     @posts=Post.where(genre: "マンガ").order(created_at: :desc)
    render("/posts/index")
  end
  
  def ranking
    @posts=Post.all.order(average: :desc)
  end
  
  def ranking_movie
    @posts=Post.where(genre: "映画").order(average: :desc)
    render("/posts/ranking")
  end
  
  def ranking_drama
    @posts=Post.where(genre: "ドラマ").order(average: :desc)
    render("/posts/ranking")
  end
  
  def ranking_anime
    @posts=Post.where(genre: "アニメ").order(average: :desc)
    render("/posts/ranking")
  end
  
  def ranking_anime_movie
     @posts=Post.where(genre: "アニメ映画").order(average: :desc)
    render("/posts/ranking")
  end
  
  def ranking_book
     @posts=Post.where(genre: "本").order(average: :desc)
    render("/posts/ranking")
  end
  
  def ranking_manga
     @posts=Post.where(genre: "マンガ").order(average: :desc)
    render("/posts/ranking")
  end
end
