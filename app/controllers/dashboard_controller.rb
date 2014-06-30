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
    
  end

  def gallerias
  end

  def imagenes
  end

  def videos
  end

  private
    def charge_all
      @equips = Equipment.where("user_id = ?" => session[:user_id])
      @equip_id = @equips.id
      @galleries = Gallery.where("equipment_id = ?" => @equip_id)
      @images = Image.where("gallery_id = ?" => @galleries.id)
      @videos = Video.where("gallery_id = ?" => @galleries.id)
    end  
end
