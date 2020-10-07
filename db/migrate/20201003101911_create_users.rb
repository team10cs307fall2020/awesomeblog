class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :userid
      t.string :username
      t.string :password
      t.string :email
      t.string :phone
      t.text :bio

      t.timestamps
    end
  end
end
