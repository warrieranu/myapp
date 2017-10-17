class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :clearance_level, :default => 0
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :response_id
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
