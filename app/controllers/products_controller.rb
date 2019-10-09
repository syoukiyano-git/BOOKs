class ProductsController < ApplicationController
  before_action :authenticate_user!
    def index
        @products = Product.all.order('id ASC').page(params[:page]).per(10)
    end 
    
    def show
        @product = Product.find(params[:id])
    end 
    
    def search
        @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(10)
    end 
end
