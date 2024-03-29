class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :price, null: false
      t.text :item_detail, null:false
      t.integer :region_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :shipping_fee_id, null: false
      t.timestamps
    end
  end
end
