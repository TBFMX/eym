class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.all 
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show

    add_breadcrumb @equipment.name.to_s, '/equipment/' + @equipment.id.to_s   

    @image = Image.find(@equipment.image_id)
     @gallery = Gallery.where('equipment_id' => @equipment.id)

     @user = User.find(@equipment.user_id)
  end

  # GET /equipment/new
  def new
    add_breadcrumb 'newequipment', '/equipment/new' 
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
    add_breadcrumb @equipment.name.to_s, '/equipment/' + @equipment.id.to_s + '/edit'
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
          ########################
          

          unless @pic.nil?
            @pics = DataFile.save(@pic,@equipments.id.to_s, @equipments.name.to_s)
          else
            @pics = "/data/dommy.jpg"  
          end
          ########################

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
    #antes hay que limpiar todo
    @gallery = Gallery.where('equipment_id = ?', @equipment.id)
    @gallery.each do |gallery|
      @image = Image.where('gallery_id', gallery.id)
      @image.each do |image|
        pic = image.image_url
        unless pic.equal?("/data/dummy.jpg")
          pics = DataFile.destroy(pic)
          puts '-------Destrui la pic ' + pic + 'y ya no debe estar'
        end
      end
    end  



    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def grid
    #@equipments = Equipment.all
    puts "-------parametros---------"
    puts params.inspect
    puts "--------------------------"
    @equipments = Equipment.query(params[:equipment]).order(sort_column + ' ' + sort_direction)
    #@equipments = Equipment.query(params[:equipment]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    puts "-------equipments---------"
    puts @equipments.inspect
    puts "--------------------------"
    #@equipments = Equipment.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    #respond_to do |format|
    #  format.html
    #  format.json { render json: EquipmentsDatatable.new(view_context) }
    #end
  end

  def contact
    if params[:equipment]
      @equipment = Equipment.find(params[:equipment]) 
      @user = User.find(@equipment.user_id)
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:name, :year, :color, :brand_id, :package_id, :description, :publication_type, :precio, :modelo, :moneda , :pais, :estado, :ciudad, :category_id)
    end

    def manejador
      #logger.error "hubo un problema xxyy"
      #redirect_to "/equipment/reporter_grid"
      render action: 'grid'
      @equipment = Equipment.all
      puts "entre al manejador"
    end

    def sort_column
      params[:sort] || "name"
    end

    def sort_direction
        params[:direction] || "asc"
    end


end
