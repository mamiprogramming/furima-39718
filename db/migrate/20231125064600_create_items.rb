class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,                   null: false
      t.text :explain,                       null: false
      t.integer :category_id,                null: false
      t.integer :situation_id,               null: false
      t.integer :postage_id,                 null: false
      t.integer :prefecture_id,              null: false
      t.integer :amountday_id,               null: false
      t.integer :price,                      null: false
      t.references :user,                    null: false, foreign_key: true
      t.timestamps
    end
  end
end
