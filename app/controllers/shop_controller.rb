class ShopController < ApplicationController
  include SessionsHelper
  
  def index
    @title = "All title"
	@cart = get_cart
    # @titles = Title.find_titles_for_sale
	@titles = Title.paginate(:page => params[:titles_page], :per_page => 5)
  end

  def add_to_cart
    @cart = get_cart
    @cart.add_to_cart(Title.find(params[:id]))
	@titles = Title.paginate(:page => params[:titles_page], :per_page => 5)
	respond_to do |format|
	  format.html { render :action => "index" }
	  format.js
      format.xml  { render :xml => @title, :status => :created, :location => @title }
	end
  end
  
	def watch_video
		puts '*********************************'
		@title = Title.find(params[:id])
		respond_to do |format|
			# format.html { render :action => "watch_video" }
			# format.html { redirect_to watch_video.html.erb }
			format.html
      format.xml  { render :xml => @title }
		end
  end
	
  # Uses model to perform search
  def titles_search
    @query = params[:query]
    @titles = Title.search(@query)
	@titles = @titles.paginate(:page => params[:titles_page], :per_page => 5)
	@cart = get_cart

	respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @titles }
    end
  end
  
  # Uses the model to search through authors
  def authors_search
    @query = params[:query]
    @authors = Author.search(@query)
	@titles = []
	if !@authors.empty?  
	  @authors.each do |author|
	    puts author.last_name
	    author.titles.each do |title|
		  puts title.title
	      @titles << title unless @titles.include?(title)
	    end
	  end
	end
	@titles = @titles.paginate(:page => params[:titles_page], :per_page => 5)
	@cart = get_cart
	
	respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @authors }
    end
  end
  
end