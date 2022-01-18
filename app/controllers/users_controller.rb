class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @users = User.page(params[:page]).per(3)
    end

    def destroy
        bean = Bean.find(params[:id])
        bean.destroy
        redirect_to action: :index
    end

    def create
        @user=User.find(params[:id]) 
        like = current_user.likes.create(bean_id: params[:bean_id])
        like.save
    end
end
