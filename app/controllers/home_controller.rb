class HomeController < ApplicationController
  def index
    @posts = Post.all
    unless params[:search].blank?
        @posts = @posts.search(params[:search])
    end
  end
end
