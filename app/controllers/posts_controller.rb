class PostsController < ApplicationController
    before_action :set_post_item, only: [:show, :edit, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '질문이 등록되었습니다.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '질문이 수정되었습니다' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: '질문이 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
        @post = Post.find(params[:id]) if params[:id].present?
    end
    def set_post_item
        @post_item = PostItem.find(params[:post_id]) if params[:post_id].present?
    end

    def post_params
        params.require(:post).permit(:title, :description, :image)
    end

    def post_item_params
        params.require(:post_item).permit(:title, :description, :image, :post_id)
    end
end
