class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, foreign_key:true
      add_index :comments, :post_id
      t.timestamps
    end
  end
end
