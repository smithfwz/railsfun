class ProductsController < ApplicationController
	def index
		@products = Product.includes(:category).published
	end

	def show
		#@product = Product.find(params[:id])	//type 1
		@product = Product.find(params.require(:id)) #type 2
	end

	def new
		@product = Product.new
	end

	def create
		product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "You have successfully created your product!"
			redirect_to products_url
		else
			flash.now[:error] = "There is an error with your input."
			render :new
		end
	end

	def edit
		@product = Product.find(params.require(:id))
		render :new
	end

	def update
		product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
		@product = Product.find(params.require(:id))
		if @product.update(product_params)
			flash[:notice] = "You have successfully update your product!"
			redirect_to products_url
		else
			flash.now[:notice] = "There is an error with your input."
			render :new
		end
	end

	def destroy
		
		if Product.destroy(params.require(:id))
			flash[:notice] = "You have successfully delete you product!"
			redirect_to products_url
		else
			flash[:notice] = "Theere is an error"
			redirect_to products_url
		end
	end
end