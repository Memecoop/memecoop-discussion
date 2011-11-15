class CreateUserAuthenticators < ActiveRecord::Migration
  def change
    create_table :user_authenticators do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps
    end
  end
end
