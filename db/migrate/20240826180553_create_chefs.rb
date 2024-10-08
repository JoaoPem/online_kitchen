class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :admin, default: false
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
