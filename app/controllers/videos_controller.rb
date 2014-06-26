class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @a_video = params[:video][:video_url].split(/\.?\s+/)
    @url_suprema =""
    @a_video.each do |vid|
      unless vid.match("width=") || vid.match("height=")
        @url_suprema += vid  
      end
      
    end  

    @video = Video.new("video_url"=> @url_suprema, "gallery_id"=> params[:video][:gallery_id], "title"=>[:video][:title])


    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    @a_video = params[:video][:video_url].split(/\.?\s+/)
    @url_suprema =""
    @a_video.each do |vid|
      unless vid.match("width=") || vid.match("height=")
        @url_suprema = @url_suprema +" " + vid  
      end
      
    end
    puts @url_suprema
    params[:video][:video_url] = @url_suprema
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:gallery_id, :video_url, :title)
    end
end
