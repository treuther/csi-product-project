class ReviewsController < ApplicationController

    def new #this is a nested route, a review belongs_to a product
        @product = Product.find_by_id(params[:product_id]) #bc review belongs_to product and nested
        @review = @product.reviews.build #used when we have a nested route
    end

    def create
        @review = Review.new(review_params)
        if @review.save #is the review is valid with a product_id (review model)?
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def index #good to nest to show all reviews for 1 product
    end

    def show
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :title, :content, :product_id)
    end
end
