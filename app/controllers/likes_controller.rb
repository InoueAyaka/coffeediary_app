class LikesController < ApplicationController
    def create
      @bean=Bean.find(params[:bean_id])
      like = current_user.likes.create(bean_id: params[:bean_id])
      like.save
    end
    
    def destroy
      @bean=Bean.find(params[:bean_id])
      like = Like.find_by(bean_id: params[:bean_id], user_id: current_user.id)
      like.destroy
    end
end
