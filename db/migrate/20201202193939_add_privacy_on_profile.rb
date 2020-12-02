class AddPrivacyOnProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :privacy, :string
  end
end
