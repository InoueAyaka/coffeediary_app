class BeansController < ApplicationController
    def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @beans = Bean.where("shop LIKE ? OR area LIKE ? OR free LIKE ? OR brand LIKE ? OR food LIKE ? OR brew LIKE ?" , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").page(params[:page]).per(10)
      else
        @beans = Bean.all.page(params[:page]).per(10)
      end
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
          params[:bean][:bean_images].each  do |image|
            BeanImage.create!(image: image, bean_id: bean.id)
          end
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

      def image_show
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
        params.require(:bean).permit(:name,:shop,:area,:food,:brew,:free,:tasting,:body,:roast,:privacy,:brand)
      end
end
