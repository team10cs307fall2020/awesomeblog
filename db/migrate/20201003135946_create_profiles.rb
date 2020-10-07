class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    unless table_exists?(:profiles)
      create_table :profiles do |t|
        t.references :user, index:true, foreign_key:true
        t.string :Name
        t.string :Email
        t.string :Phone
        t.text :Bio
        add_index :profiles, :user_id

        t.timestamps
      end
    end

  end
end
