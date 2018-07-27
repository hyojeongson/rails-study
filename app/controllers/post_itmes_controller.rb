class PostItmesController < ApplicationController

    def destroy
        @post = Post.find(params[:post_id])
        @postItem = @post.post_items.find(params[:id])
        @postItem.destroy
        redirect_to edit_post_path(params[:post_id])
    end
end
