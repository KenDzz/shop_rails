class LineItem < ApplicationRecord
	has_one  :order #Fix Order
	belongs_to  :product
    belongs_to :cart
    def total_price
        product.price * quantity
    end
end
