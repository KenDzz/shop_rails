class Product < ApplicationRecord
	has_many :line_items
    before_destroy :check_if_has_line_item
    #include ImageUploader::Attachment(:image_url)
    #include ImageUploader::Attachment(:image_url1)
    #include ImageUploader::Attachment(:image_url2)


	private
	    def check_if_has_line_item
	        if line_items.empty?
	            return true
	        else
	            errors.add(:base, 'This product has a LineItem')
	            return false
	        end
	  	end
	def self.search(params)
	  products = all # for not existing params args
	  products = products.where("title like ?", "%#{params[:search]}%") if params[:search]
	  products
	end
end
