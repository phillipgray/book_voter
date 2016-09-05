class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.remove :password, :password_confirmation
      t.string :encrypted_password, null: false, default: ""
    end

    change_column_default :users, :email, from: nil, to: ""
    change_column_null :users, :email, false
    add_index :users, :email,                unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
