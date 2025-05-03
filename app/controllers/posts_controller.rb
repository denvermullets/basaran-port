class PostsController < ApplicationController
  before_action :require_authentication
  before_action :set_post, only: %i[show edit update destroy remove_image]

  # GET /posts
  def index
    @posts = Post.all.order(display_order: :asc)
  end

  def portfolio
    @posts = Post.order(:display_order).where(private_post: false, status: 'published')
    @post = params[:id].present? ? Post.find(params[:id].to_s.split('-').first) : @posts.first
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_table_view_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # images upload on submission only if new
    # images delete from the form
    new_images = params[:post][:images]

    if @post.update(post_params.except(:images))
      @post.images.attach(new_images) if new_images.present?
      redirect_to posts_table_view_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def remove_image
    image = @post.images.find(params[:image_id])
    image.purge

    redirect_to edit_post_path(@post), notice: 'Image deleted.'
  end

  private

  def require_authentication
    redirect_to root_path, alert: 'Please enter the password' unless session[:authenticated]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title, :description, :client, :release_year,
      :status, :private_post, :display_order
    )
  end
end
