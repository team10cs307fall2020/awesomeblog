class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :Name
      t.string :Email
      t.string :Phone
      t.text :Bio

      t.timestamps
    end
  end
end
