class BlogsController < ApplicationController

    before_action :set_blog ,only: [:edit,:update,:show,:like,:unlike]
    impressionist :actions=>[:show,:index],unique: [:impressionable_type,:impressionable_id,:session_hash]

    def index
        @blogs  = Blog.all.order("created_at DESC")
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        if @blog.save
            redirect_to blog_path(@blog)
        else 
            flash[:error] = "There was some error in your information"
            render 'new'
        end
    end

    def show
        
    end


    def edit
        
    end

    def update
        @blog = Blog.update(blog_params)
        if @blog
            redirect_to blog_path(@blog)
        else 
            flash[:error] = "There was something wrong with your information"
            render 'new'
        end
    end


    def like
        @blog.liked_by current_user
        respond_to do |format|
            format.html {redirect_back fallback_location: root_path}
            format.js {render layout:false}
        end
    end

    def unlike
        @blog.unliked_by current_user
        respond_to do |format|
            format.html {redirect_back fallback_location: root_path}
            format.js {render layout:false}
        end
    end




    private

    def blog_params
        params.require(:blog).permit(:heading,:description,:user_id,category_ids: [])
    end

    def set_blog
        @blog = Blog.find(params[:id])
    end

end
