class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, index:true, foreign_key:true
      t.string :name
      t.string :category

      #add_index :followings, :user_id
      t.timestamps
    end
  end
end
