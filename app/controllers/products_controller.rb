class ProductsController < ApplicationController
	def index
		@products = Product.includes(:category).published
	end

	def show
		#@product = Product.find(params[:id])
		@product = Product.find(params.require(:id))
	end
end