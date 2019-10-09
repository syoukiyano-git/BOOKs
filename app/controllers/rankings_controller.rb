class RankingsController < ApplicationController
    
    def index
        reviews = Review.group(:product_id).order('count_product_id DESC').limit(3).count(:product_id).keys
        @ranking = reviews.map { |id| Product.find(id) }
    end
end
