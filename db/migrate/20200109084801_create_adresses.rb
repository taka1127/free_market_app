class CreateAdresses < ActiveRecord::Migration[5.0]
  def change
    create_table :adresses do |t|

      t.timestamps
    end
  end
end
