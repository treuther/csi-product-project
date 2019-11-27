class ProductsController < ApplicationController

    def new
        @product = Product.new
        1.times {@product.build_chem_group} #for the nested form. Builds the chem_group attributes
    end

    def create
        @product = Product.new(product_params)
        @product.user_id = session[:user_id] #bc product belongs_to user. user_id required from model
        if @product.save #validation
            # @product.image.purge
            # @product.image.attach(params[:product][:image]) # allows image to be replaced if user changes image
            redirect_to product_path(@product)
        else
            @product.build_chem_group
            render :new
        end
    end

    def edit
        @product = Product.find_by(id: params[:id])
        1.times {@product.build_chem_group}
        if @product.user != current_user
            flash[:error] = "Sorry, you can only edit your own products"
            redirect_to products_path
        end
    end

    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    def index
        @products = Product.order_by_rating.includes(:chem_group)
    end

    def show
        @product = Product.find_by(id: params[:id])
        @user = User.find_by(id: params[:user])
    end

    private

    def product_params
        params.require(:product).permit(:description, :active_ingredient, :image, :chem_group_id, chem_group_attributes: [:id, :name])
        #chem_group_id and chem_group_attributes [:name] is permitting elements from new product form
    end

end
