class BeansController < ApplicationController
    def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @beans = Bean.joins(:user).where("shop LIKE ? OR area LIKE ? OR free LIKE ? OR brand LIKE ? OR food LIKE ? OR brew LIKE ?" , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @beans = Bean.all
      end

      # if params[:search] == nil
      #   @beans= Bean.all.order(created_at: :desc)
      # elsif params[:search] == ''
      #   @beans= Bean.all.order(created_at: :desc)
      # else
      #   #部分検索
      #   @beans = Bean.where("name LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
      # end

      # @beans = Bean.all
      # @beans = Bean.all.order(created_at: :desc)

    end
    
    def link
    end

    def new
        @bean = Bean.new
      end

      def create
        bean = Bean.new(bean_params)
        bean.user_id = current_user.id
        if bean.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @bean = Bean.find(params[:id])
        @comments = @bean.comments
        @comment = Comment.new
      end

      def edit
        @bean = Bean.find(params[:id])
        
      end

      def update
        bean = Bean.find(params[:id])
        if bean.update(bean_params)
          redirect_to :action => "show", :id => bean.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        bean = Bean.find(params[:id])
        bean.destroy
        redirect_to action: :index
      end


      
      private
      def bean_params
        params.require(:bean).permit(:name,:shop,:area,:food,:brew,:free,:image,:tasting,:body,:roast,:privacy,:brand)
      end

end
