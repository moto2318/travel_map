class MapsController < ApplicationController
  before_action :set_map, only: %i[ show edit update destroy ]
  
  def show_tagged_posts
    @tag = params[:tag]
    @tagged_posts = Map.where(tag: @tag)

    # タグに関連する投稿の情報を収集
    @tagged_posts_info = @tagged_posts.map do |post|
      {
        lat: post.lat,
        lng: post.lng,
        text: post.text,
      }
    end
  end
  
  def map
    @maps = Map.all
  end
  # GET /maps or /maps.json
  def index
    @tags = Map.pluck(:tag).uniq # データベース内の全てのタグを取得
    @map = Map.new
    @maps = current_customer.maps.select(:id, :address, :title, :lat, :lng, :text)
  end

  # GET /maps/1 or /maps/1.json
  def show
     @map = Map.find(params[:id])
    # render json: @post
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
  end

    # POST /maps or /maps.json
  def create
    @map = Map.new(map_params)
    @map.customer_id = current_customer.id
    unless params[:map][:name] == ""
      tag_list = params[:map][:name].split(',')
      if @map.save
        @map.save_tags(tag_list, current_customer.id)
        redirect_to maps_path, notice: '投稿が成功しました'
      else
        redirect_back(fallback_location: root_path)
      end
    else
      if @map.save
        redirect_to maps_path
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end


  #タグの作成
  # def create_tag
  #   @post = Post.new(post_params)
  #   @post.end_user_id = current_end_user.id
  #   tag_list = params[:post][:name].split(',')
  #   if @post.save
  #     @post.save_tags(tag_list)
  #     redirect_to maps_path, notice:'投稿が成功しました'
  #   elsif
  #     redirect_back(fallback_location: root_path)
  #   end
  # end



  # PATCH/PUT /maps/1 or /maps/1.json
  def update
      if @map.update(map_update_params)
        redirect_to @map
      else
        render :edit
      end

  end

  # DELETE /maps/1 or /maps/1.json
  def destroy
    @map.destroy

    respond_to do |format|
      format.html { redirect_to maps_url, notice: "Map was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

    def map_params
      params.require(:map).permit(:lat, :lng, :text, :title, :address)
    end

    def map_update_params
      params.require(:map).permit(:text, :title)
    end
end
