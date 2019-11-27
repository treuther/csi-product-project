module ProductsHelper

    def upload_product_image
        if @product.image.attached?
    end
end
