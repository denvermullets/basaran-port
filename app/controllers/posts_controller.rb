class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy, :remove_image ]

  # GET /posts
  def index
    @posts = Post.all.order(display_order: :asc)
  end

  # GET /posts/1
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
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def remove_image
    # binding.pry
    image = @post.images.find(params[:image_id])
    image.purge


    redirect_to edit_post_path(@post), notice: "Image deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :client, :release_year, :status, :private_post, :display_order, images: [])
    end
end
