class AddProviderColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :oauth_provider, :string
    rename_column :users, :uid, :oauth_uid
  end
end
