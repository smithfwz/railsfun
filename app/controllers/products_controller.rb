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
end