class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      add_index :comments, :post_id
      t.timestamps
      # t.references :post, foreign_key:true

      # t.references :comments, index:true, foreign_key:true
      # add_index :comments, :user_id
      # t.timestamps
    end
  end
end
