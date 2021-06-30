class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :image_url
      t.decimal :price
      t.text :image_url1
      t.text :image_url2
      t.integer :discount
      t.integer :idDM

      t.timestamps
    end
  end
end
