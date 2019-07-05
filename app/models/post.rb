class Post < ApplicationRecord
    
    has_many :likes
    has_many :comments
    
    validates:genre,{presence: true}
    validates:name,{presence: true}
    
    
    def self.search(search)
        
        Post.where(['name LIKE ? or subname LIKE ? or genre LIKE ? or creator LIKE ? or company LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
        
    end
    
    def self.average
        @posts_all=Post.all
        @posts_all.each do |post|
            @comments_all=Comment.where(post_id: post.id)
            rating_sum=0
            @comments_all.each do |comment|
                if !comment.rating.nil?
                    rating_sum+=comment.rating
                end
            end
              
            if @comments_all.count!=0
                post.average = (rating_sum/@comments_all.count).round(1)
                post.save
            end
        end
    end
end
