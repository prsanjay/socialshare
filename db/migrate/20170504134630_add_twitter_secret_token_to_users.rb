class AddTwitterSecretTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_secret_token, :text
  end
end
