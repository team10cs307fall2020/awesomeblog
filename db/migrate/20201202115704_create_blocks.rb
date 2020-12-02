class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.references :user, index:true, foreign_key:true
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
