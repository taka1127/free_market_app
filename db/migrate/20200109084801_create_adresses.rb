class CreateAdresses < ActiveRecord::Migration[5.0]
  def change
    create_table :adresses do |t|
      t.integer    :postal_code,  null: false
      t.integer    :prefecture,   null: false
      t.string     :city,         null: false
      t.string     :house_number, null: false
      t.string     :building
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
