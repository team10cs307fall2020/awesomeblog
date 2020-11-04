class RenameDescToDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :topics, :desc, :description
  end
end
