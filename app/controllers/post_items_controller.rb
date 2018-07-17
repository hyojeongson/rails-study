class PostsItemsController < ApplicationController
    before_action :set_post
    before_action :set_post_item, only: [:show, :edit, :update, :destroy]

    def index
        @post_item = @post.present? ? @post.post_items.all :post_item.all
    end

    def show
    end

    def new
        @post_item = @post.present? ? @post.post_items.new : post_item.new
    end

    private
    def set_post
        @post = Post.find(params[:post_id]) if params[:post_id].present?
    end

    def set_post_item
        if @post.present?
            @post_item = @post.post_items.find(params[:id])
        else
            @post_item = Post_item.find(params[:id])
        end
    end

    def post_item_params
        params.require(:post_item).permit(:image, :description)
    end
end
