class Equipment < ActiveRecord::Base
	extend FriendlyId
	before_save :default_values
  	friendly_id :name, :use => :slugged
	#######################################
	has_many :galleries, dependent: :destroy
	has_many :images
	belongs_to :currency 
	belongs_to :country
	belongs_to :state
	belongs_to :brand
	belongs_to :package
	belongs_to :category
	

	#validates :equipment_id, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :currency_id, presence: true
	validates :modelo ,presence: true
	validates :state_id, presence: true
	validates :brand_id, presence: true
	validates :country_id, presence: true
	validates :publication_type, presence: true
	validates :category_id, presence: true
	validates :ciudad, presence: true
	#validates :package_id, presence: true

	has_many :comments
	#has_many :coments, dependent: :destroy
	


	validates :precio, numericality: {greater_than_or_equal_to: 0.01}
	#validates :currency_id, :description, presence: true


  	def default_values
   	 self.status ||= '0'
  	end


	def should_generate_new_friendly_id?
    	new_record?
  	end

  	def self.s_charge(zona)
  		aux =Equipment.where("package_id = ? and status <> 0", zona).count()
  		

  		if aux > 4
	  		count = 0
	  		#content_aux = ""
	  		array_aux = Array.new
	  		equip = Equipment.select("id").where("package_id = ? and status <> 0", zona)
  			array_conteiner = Array.new

	  		 equip.each do |e|
	  		 	array_conteiner.push(e.id)
	  		 end	

	  		if aux >= 20
	  			
		  		while count < 20 do

		  			#esta = false
		  			i_aux = array_conteiner.sample.to_i
		  			puts "-----------------------------------------"
		  			puts i_aux
		  			puts "-----------------------------------------"
	  				array_aux.push(i_aux)
	  				array_conteiner.delete(i_aux)
	  				count += 1	
		  		end
		  	elsif aux < 20

		  		while count < aux.to_i do

		  			i_aux = array_conteiner.sample.to_i
	  				array_aux.push(i_aux)
	  				array_conteiner.delete(i_aux)
	  				count += 1
		  		end		
	  		end
	  		where(id: array_aux)
	  	else
	  		where("package_id = ? and status <> 0", zona)
	  	end	
	  	
  	end	

  	def self.find_custom(equip)
  		aux = Equipment.find(equip)
  		if aux.status == 2
  			find(equip)
  		else
  			nil
  		end	
  	end

  	def self.find_by_custom(arg)
  		aux = Equipment.find_by(arg)
  		if aux.status == 2
  			find_by(arg)
  		else
  			nil
  		end	
  	end

  	def self.where_custom
  		where("status = 2")
  	end	

	def self.search(search)
	  if search
	  	aux = '%' + search + '%'
	  	#aux = search 
	    where('name LIKE ? or description LIKE ? or etiquetas LIKE ?', aux,aux,aux)
	    #.order('package DESC,rank ASC, priority ASC')
	  else
	    all
	  end
	end


	def self.query(equipment)
	    @aux= " 1 = 1 "
	    @aux2= Array.new
	    @cont=1
	    if equipment
		    if !equipment[:year].blank?
		    	@aux= @aux + 'and year = ? '
		    	@aux2[@cont]=  equipment[:year]
		    	@cont=@cont+1
		    end
		    if !equipment[:color].blank?
		    	@aux= @aux + 'and color = ? '
		    	@aux2[@cont]=  equipment[:color]
		    	@cont=@cont+1
		    end
		    if !equipment[:brand_id].blank?
		    	@aux= @aux + 'and brand_id = ? '
		    	@aux2[@cont]= equipment[:brand_id]
		    	@cont=@cont+1
		    end

		    if !equipment[:package_id].blank?
		    	@aux= @aux + 'and package_id = ? '
		    	@aux2[@cont]=  equipment[:package_id]
		    	@cont=@cont+1
		    end
		    if !equipment[:modelo].blank?
		    	@aux= @aux + 'and modelo = ? '
		    	@aux2[@cont]=  equipment[:modelo]
		    	@cont=@cont+1
		    end
		    if !equipment[:currency_id].blank?
		    	@aux= @aux + 'and currency_id = ? '
		    	@aux2[@cont]= equipment[:currency_id]
		    	@cont=@cont+1
		    end

		    if !equipment[:country_id].blank?
		    	@aux= @aux + 'and country_id = ? '
		    	@aux2[@cont]=  equipment[:country_id]
		    	@cont=@cont+1
		    end
		    if !equipment[:state_id].blank?
		    	@aux= @aux + 'and state_id = ? '
		    	@aux2[@cont]=  equipment[:state_id]
		    	@cont=@cont+1
		    end
		    if !equipment[:ciudad].blank?
		    	@aux= @aux + 'and ciudad = ? '
		    	@aux2[@cont]= equipment[:ciudad]
		    	@cont=@cont+1
		    end
		    if !equipment[:category_id].blank?
		    	@aux= @aux + 'and category_id = ? '
		    	@aux2[@cont]= equipment[:category_id]
		    	@cont=@cont+1
		    end
		    if !equipment[:subcategory_id].blank?
		    	@aux= @aux + 'and subcategory_id = ? '
		    	@aux2[@cont]= equipment[:subcategory_id]
		    	@cont=@cont+1
		    end

		    if !equipment[:preciod].blank? || !equipment[:precioh].blank?
		    	puts "-----------hola ---------------"
		    	if !equipment[:preciod].blank? && !equipment[:precioh].blank?
		    		if equipment[:preciod] != equipment[:precioh]
			    		@aux= @aux + 'and precio between  ? and ? '
			    		@aux2[@cont]= equipment[:preciod]
			    		@aux2[@cont+1]= equipment[:precioh]
			    	else
			    		@aux= @aux + 'and precio = ? '
			    		@aux2[@cont]= equipment[:preciod]
			    		
			    	end	
		    	elsif equipment[:preciod] && equipment[:precioh].blank?
		    		@aux= @aux + 'and precio <= ? '
		    		@aux2[@cont]= equipment[:preciod]
		    	elsif equipment[:preciod].blank? && equipment[:precioh]
		    		@aux= @aux + 'and precio >= ? '
		    		@aux2[@cont]= equipment[:precioh]			
		    	end
		    end
		end
	    if @aux
	    #puts @cont	
		      @aux2[0]=@aux
	      where @aux2 
	    else
	      scoped
	    end

	end


end
