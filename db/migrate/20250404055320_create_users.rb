class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :phone
      t.boolean :admin
      t.boolean :activated

      t.timestamps
    end
  end
end
