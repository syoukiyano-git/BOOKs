class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: :new
    
    def new
        @product = Product.find(params[:product_id])
        @review = Review.new
    end 
    
    def create
        Review.create(create_params)
        redirect_to controller: :products, action: :index
    end
    
    def destroy
        review = Review.find(params[:id])
        review.destroy if review.user_id == current_user.id
        redirect_to controller: :users, action: :show
    end 
    
    def edit
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
    end 
    
    def update
        review = Review.find(params[:id])
        review.update(review_params) if review.user_id == current_user.id
        redirect_to controller: :users, action: :show
    end 
    
    private
    def review_params
         params.permit(:rate,:review)
    end 
    
    def create_params
        params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
    end 
end
