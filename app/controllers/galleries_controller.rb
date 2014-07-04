class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    if params[:id]
      @equipment = Equipment.friendly.find(params[:id])
      add_breadcrumb @equipment.name.to_s, equipment_path(@equipment)    
      add_breadcrumb I18n.t("breadcrumbs.gallery"), galeria_index_path(@equipment.name)
      
      @galleries = Gallery.where('equipment_id' => @equipment)
      @e_id = params[:id]
    else
      redirect_to root_path
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @equip = Equipment.find(@gallery.equipment_id)
    add_breadcrumb @equip.name.to_s, equipment_path(@equip)    
    add_breadcrumb I18n.t("breadcrumbs.gallery"), galeria_index_path(@equip.name)    
    @images = Image.where("gallery_id = ?", @gallery.id).group(:image_url)
    @videos = Video.where("gallery_id = ?", @gallery.id).group(:video_url)
  end

  # GET :equip/galeria_nueva/
  def new
    if params[:equip]
      @equip = Equipment.friendly.find(params[:equip])
      add_breadcrumb @equip.name.to_s, equipment_path(@equip)    
      add_breadcrumb I18n.t("breadcrumbs.gallery"), galeria_index_path(@equip.name) 
      @gallery = Gallery.new('equipment_id' => @equip.id)
      @e_id = params[:equip]
    else
      redirect_to root_path
    end
  end

  # GET :equip/galeria/:id/editar
  def edit
    if params[:id] && params[:equip]
      @equip = Equipment.friendly.find(params[:equip])
      add_breadcrumb @equip.name.to_s, equipment_path(@equip)    
      add_breadcrumb I18n.t("breadcrumbs.gallery"), galeria_index_path(@equip.name) 
      @e_id = params[:equip]
    else
      redirect_to root_path
    end
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    #borramos archivos
    @image = Image.where('gallery_id = ?', @gallery.id)
    @image.each do |image|
      pic = image.image_url
      unless pic.equal?("/data/dummy.jpg")
        pics = DataFile.destroy(pic)
        
      end
    end  

    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, :equipment_id, :user_id)
    end
end
