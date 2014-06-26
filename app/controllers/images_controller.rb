class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  include Porta

  # GET galleries/images/:id
  def index
    #if params[:id].nil?
    #  redirect_to root_path
    #end
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  #GET images/new/:id 
  #POST images/new/:id
  def new
    @gallery =Gallery.find(params[:id])
    #@equipment = Equipment.find(@gallery.equipment_id)
    #add_breadcrumb @equipment.name.to_s, '/equipments/' + @equipment.id.to_s
    #    add_breadcrumb I18n.t("breadcrumbs.galleries"), '/equipments/galleries/' + @equipment.id.to_s 
    #add_breadcrumb I18n.t("breadcrumbs.nimage"), '/images/new/' + @gallery.id.to_s 
    @image = Image.new("gallery_id" => params[:id])
    #@permiso = check_propiety(@equipment)
    #unless @permiso 
    #  redirect_to root_path
    #end


    #@image = Image.new
  end

  #get images/:id/edit/:equip
  #post images/:id/edit/:equip
  def edit
  end

  # POST /images
  # POST /images.json
  def create
=begin    
    @gallery = Gallery.find(params[:image][:gallery_id])
    @project2 = Project.find(@gallery.project_id)
    @gallery2 = Gallery.find(@gallery)

    unless @pic.blank?
      @pics = DataFile.save(@pic,@project2.name,@gallery2.title)
    end
=end



    #@image = Image.new(image_params)
    @pic = params[:image][:image_url]
    puts "---------------------------------datos-imagen------------------------------------------------------"
    puts @pic.inspect
    puts "---------------------------------------------------------------------------------------------------"
    unless @pic.blank?
      @pics = DataFile.save(@pic)
    else
      @pics = "/data/dommy.jpg"  
    end


    @image = Image.new("image_url" => @pics, "gallery_id" => params[:image][:gallery_id], "title" => params[:image][:title])


    respond_to do |format|
      if @image.save
        format.html { redirect_to '/galleries/' + params[:image][:gallery_id].to_s, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to  '/galleries/' + params[:gallery_id].to_s, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:gallery_id, :image_url, :title)
    end
end
