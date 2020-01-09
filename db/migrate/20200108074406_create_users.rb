class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name,            null: false
      t.string :name_kana,       null: false
      t.string :mail_address,    null: false, unique: true
      t.string :password,        null: false
      t.integer :tel,            null: false
      t.date :birthday,          null: false
      t.text :self_introduction
      t.integer :point,          default: 0
      t.integer :proceed,        default: 0

      t.timestamps
    end
  end
end
