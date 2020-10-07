
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, index:true, foreign_key:true
      t.string :topic
      t.string :title
      t.text :text
      t.boolean :anonymous

      t.timestamps
    end
  end
end
