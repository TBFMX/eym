class Equipment < ActiveRecord::Base
	has_many :galleries, dependent: :destroy
	has_many :images

	has_many :coments
	has_many :brands
	#has_many :coments, dependent: :destroy

	validates :precio, numericality: {greater_than_or_equal_to: 0.01}



=begin
	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
=end	
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
		    if !equipment[:moneda].blank?
		    	@aux= @aux + 'and moneda = ? '
		    	@aux2[@cont]= equipment[:moneda]
		    	@cont=@cont+1
		    end

		    if !equipment[:pais].blank?
		    	@aux= @aux + 'and pais = ? '
		    	@aux2[@cont]=  equipment[:pais]
		    	@cont=@cont+1
		    end
		    if !equipment[:estado].blank?
		    	@aux= @aux + 'and estado = ? '
		    	@aux2[@cont]=  equipment[:estado]
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
