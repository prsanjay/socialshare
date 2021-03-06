class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.text :oauth_token
      t.datetime :oauth_expires_at
      t.text :long_term_token

      t.timestamps null: false
    end
  end
end
