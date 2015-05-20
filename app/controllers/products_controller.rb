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
end