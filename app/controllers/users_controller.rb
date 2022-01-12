class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
    end

    def destroy
        bean = Bean.find(params[:id])
        bean.destroy
        redirect_to action: :index
    end
end
