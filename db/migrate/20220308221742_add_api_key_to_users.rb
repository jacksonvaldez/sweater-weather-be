class AddApiKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :api_key_digest, :string
  end
end
