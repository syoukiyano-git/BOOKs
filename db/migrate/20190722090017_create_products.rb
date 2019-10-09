class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string   :title
      t.text     :image_url
      t.text     :detail
      
      t.timestamps
    end
  end
end
