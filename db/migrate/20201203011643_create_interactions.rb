class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.references :user, index:true, foreign_key:true
      t.integer :postID
      t.string :category

      add_index :interactions, :user_id

      t.timestamps
    end
  end
end
