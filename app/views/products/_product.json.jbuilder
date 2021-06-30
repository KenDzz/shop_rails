json.extract! product, :id, :title, :description, :image_url, :price, :image_url1, :image_url2, :discount, :idDM, :created_at, :updated_at
json.url product_url(product, format: :json)
