class AddPrivacyOnPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :privacy, :string
  end
end
