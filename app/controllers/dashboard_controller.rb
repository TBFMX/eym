class DashboardController < ApplicationController
  before_action :charge_all
  skip_before_action :authorize, only: [:login]


  def index
    @user = User.find(session[:user_id])
  end

  def login
  end

  #mis equipos
  #GET /dashboard/Mis_equipos
  def equipos
    add_breadcrumb I18n.t("breadcrumbs.equipment"), dashboard_equipos_path()
    @equipment = @equipsWhere
  end

  def gallerias
    if params[:gal]
      @galleries = Gallery.friendly.find(params[:gal])
    end  
      puts "---------------- equipment -----------------"
      puts @equips.inspect
      puts "---------------------------------"
      @e_id = @equips.name
  end

  def imagenes
    @images = Image.where("gallery_id = ?" , @galleries.id)
  end

  def videos
  end

  def cuenta
  end  

  private
    def charge_all
    #puts "---------------------------------"
    #puts session[:user_id]   
    #puts "---------------------------------"    

      @equips = Equipment.find_by("user_id = ?" , session[:user_id])
      @equipsWhere = Equipment.where("user_id = ?" , session[:user_id])      
    # puts "---------------------------------"
    # puts @equips.inspect
    # puts "---------------------------------"  
      @galleries = Gallery.find_by("equipment_id = ?" , @equips.id)                 
      @galleriesWhere = Gallery.where("equipment_id = ?" , @equips.id)
      unless @galleries.blank?
     puts "----------Gallery-----------------------"
     puts @galleries.inspect
     puts "---------------------------------"                 
        @images = Image.where("gallery_id = ?" , @galleries.id)
    # puts "---------------------------------"
    # puts @images.inspect
    # puts "---------------------------------"                
        @videos = Video.where("gallery_id = ?" , @galleries.id)
    # puts "---------------------------------"
    # puts @videos.inspect
    # puts "---------------------------------"           
      end
    end  
end
