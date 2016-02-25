class AddUserIdColumnToTweets < ActiveRecord::Migration
  def change
    add_columns :tweets, :user_id, :integer
  end
end
