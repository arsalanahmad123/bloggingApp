class CommentsController < ApplicationController

 
   def create
        @blog = Blog.find(params[:blog_id])
        @comment = @blog.comments.create(comment_params)
        if @comment.save
            redirect_to blog_path(@blog)
        else
            flash[:error] = "THere was some error in your comment!!!!"
            redirect_to blog_path(@blog)
        end
    end



    private

        def comment_params
            params.require(:comment).permit(:body,:commentor,:blog_id,:user_id)
        end

end
