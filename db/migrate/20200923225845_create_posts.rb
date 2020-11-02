class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, index:true, foreign_key:true
      t.string :topic
      t.string :title
      t.text :text
      t.string :anonymous

      add_index :posts, :user_id

      t.timestamps
    end
  end
end
