class AddGreetingAndWebsiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :greeting, :string
    add_column :users, :website, :string
  end
end
