class DashboardController < ApplicationController
  before_action :charge_all
  skip_before_action :authorize, only: [:login]


  def index
    @user = User.find(session[:user_id])
  end

  def login
    add_breadcrumb I18n.t("breadcrumbs.equipment"), dashboard_equipos_path()
     @user = User.find(session[:user_id])  
     puts "---------------------------------"
     puts @user.inspect
     puts "---------------------------------"     
  end

  #mis equipos
  #GET /dashboard/Mis_equipos
  def equipos
    add_breadcrumb I18n.t("breadcrumbs.equipment"), dashboard_equipos_path()
    @equipment = @equipsWhere
  end

  def gallerias
    add_breadcrumb I18n.t("breadcrumbs.equipment"), dashboard_equipos_path()    
    @equips = Equipment.friendly.find(params[:equip])
    @galleries = Gallery.where("equipment_id = ?", @equips)
    #if params[:gal]
    #  @galleries = Gallery.friendly.find(params[:gal])
    #end  
    puts "----------Gallery-----------------------"
    puts @galleries.inspect
    puts "----------------------------------------"

    puts "---------------- equipment -----------------"
    puts @equips.inspect
    puts "---------------------------------"
      @e_id = @equips.slug
  end

  def imagenes
    @equips = Equipment.friendly.find(params[:equip])
    if params[:gal]
      puts "----------Gallery-----------------------"
      puts  params[:gal]
      puts "----------------------------------------"
      @galleries = Gallery.friendly.find(params[:gal])
      @images = Image.where("gallery_id = ?" , @galleries.id)
    else
      redirect_to root_path  
    end  
  end

  def videos
    @equips = Equipment.friendly.find(params[:equip])
    @galleries = Gallery.friendly.find(params[:gal])
    @videos = Video.where("gallery_id = ?" , @galleries.id)
  end

  def cuenta       
  end  

  private
    def charge_all
    #puts "---------------------------------"
    #puts session[:user_id]   
    #puts "---------------------------------"  
    @equips = Equipment.find_by("user_id = ?" , session[:user_id])  
    unless  @equips.blank?
        @equipsWhere = Equipment.where("user_id = ?" , session[:user_id])      
      # puts "---------------------------------"
      # puts @equips.inspect
      # puts "---------------------------------"  
        #@galleries = Gallery.find_by("equipment_id = ?" , @equips.id)                 
        @galleriesWhere = Gallery.where("equipment_id = ?" , @equips.id)
        unless @galleries.blank?
      # puts "----------Gallery-----------------------"
      # puts @galleries.inspect
      # puts "---------------------------------"                 
          @images = Image.where("gallery_id = ?" , @galleries.id)
      # puts "---------------------------------"
      # puts @images.inspect
      # puts "---------------------------------"                
          @videos = Video.where("gallery_id = ?" , @galleries.id)
      # puts "---------------------------------"
      # puts @videos.inspect
      # puts "---------------------------------"           
        end
        @verificado = true
      else
        @verificado = false
      end
      @verificado
      
    end  

    

end
