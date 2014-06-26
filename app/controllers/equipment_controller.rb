class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.all
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  # POST /equipment.json
  def create
    #@equipment = Equipment.new(equipment_params)
    session[:url_to_return] = ""
    @equipment = Equipment.new(equipment_params)
    puts "-------------------Equipo---------------------------"
      puts @equipment.inspect
    puts "----------------------------------------------"
      @pic = params[:equipment][:image_id]
    puts "-------------------Pic---------------------------"
      puts @pic.inspect
    puts "----------------------------------------------"

    unless @pic.nil?
      @pics = DataFile.save(@pic)
    else
      @pics = "/data/dommy.jpg"  
    end
    puts "-------------------Pics---------------------------"
      puts @pics.inspect
    puts "--------------------------------------------------" 
    respond_to do |format|
      if secure_save(@equipment)

        format.html { 
          #saco la id del proyecto
          @equipments = Equipment.find(@equipment)
          puts "-------------------Equipo---------------------------"
          puts @equipments.inspect
          puts "------------------------------------------------------"
          unless @pic.nil?
          #creo la galleria
            @gallery=Gallery.new("equipment_id"=>@equipments.id, "title" =>"principal")
            puts "--------------------Galleria--------------------------"
            puts @gallery.inspect
            puts "------------------------------------------------------"
            respond_to do |format|
              if secure_save(@gallery)
                format.html {
                  @galleries = Gallery.find(@gallery)
                  
                    puts "pase la validacion de pic"
                      @image = Image.new("gallery_id" => @galleries.id, "image_url" => @pics)
                      puts "--------------------Imagen--------------------------"
                      puts @image.inspect
                      puts "----------------------------------------------------"
                      
                      respond_to do |format|
                        if secure_save(@image)
                          puts "entre a imagen"
                          format.html { 
                            respond_to do |format|
                              if @equipments.update("image_id" => @image.id)
                                format.html { 
                                 #me voy al show del equipo
                                  redirect_to @equipment, notice: 'Equipment was successfully created.'
                                }
                                format.json { }
                              else
                                format.html { redirect_to root_path, alert: "fallo el update de proyecto" }
                                format.json {  }
                              end
                            end                      
                          }
                          format.json { }
                        else
                          puts "entre a imagen"
                          format.html { redirect_to root_path, alert: "fallo el salvado de la imagen" }
                          format.json {  }
                        end
                      end    
                 }
                format.json {  }
              else
                format.html { redirect_to root_path, alert: "fallo el salvado de la Galeria" }
                format.json {  }
              end
            end
          else
            redirect_to @equipment, notice: 'Equipment was successfully created.'
          end    
        }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end

    
=begin
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
=end    
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    #####################
    #metodos a revizar antes de borrar:
    #-imagenes
    #-videos
    #-galerias

    #######################

    #antes hay que limpiar todo
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:name, :year, :color, :brand_id, :package_id, :description, :publication_type, :category_id)
    end
end
