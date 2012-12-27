module ProductsHelper

	def display_cover(product)
		cover = product.images.first
		if cover
			image_tag cover.file.thumb.url
		else
			image_tag 'no-image.jpg'
		end
	end

end