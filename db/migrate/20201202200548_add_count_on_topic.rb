class AddCountOnTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :count, :integer
  end
end
