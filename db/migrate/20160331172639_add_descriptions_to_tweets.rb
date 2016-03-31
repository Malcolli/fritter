class AddDescriptionsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :description, :text
    add_column :tweets, :created_at, :datetime
    add_column :tweets, :updated_at, :datetime
  end
end
