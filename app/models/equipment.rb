class Equipment < ActiveRecord::Base
	has_many :galleries, dependent: :destroy
	has_many :images
	has_many :coments, dependent: :destroy
	validates :name, presence: true
	validates :precio, numericality: {greater_than_or_equal_to: 0.01}



	def self.query(quotation,date_from,date_to)

	    @aux= " 1 = 1 "
	    @aux2= Array.new
	    @cont=1

	    if !quotation[:kind].blank?

	    	@aux= @aux + 'and kind = ? '
	    	@aux2[@cont]=  quotation[:kind]
	    	@cont=@cont+1
	    	 
	    
	    end

	    if !quotation[:unit_id].blank?
	    	@aux= @aux + 'and unit_id = ? '
	    	@aux2[@cont]=  quotation[:unit_id]
	    	@cont=@cont+1
	    end

	    if !quotation[:client_id].blank?
	    	@aux= @aux + 'and client_id = ? '
	    	@aux2[@cont]= quotation[:client_id]
	    	@cont=@cont+1
	    
	    end

	    if date_from || date_to
	    	
	    	if date_to
	    		@dt=Date.parse(date_to.to_a.sort.collect{|c| c[1]}.join("-"))
	    	else
	    		@dt="date('now')"
	    	end
	    	if date_from
	    		@df=Date.parse(date_from.to_a.sort.collect{|c| c[1]}.join("-"))
	    	else
	    		@df= "date(' #{date_to} ','start of month')"; 
	    	end
	    	
	    	@aux= @aux + 'and date between  ? and ? '
	    	@aux2[@cont]=@df
	    	@aux2[@cont+1]=@dt
	    else
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
