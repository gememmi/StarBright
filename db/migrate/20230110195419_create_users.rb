class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :avatar
      t.string :password_digest
      t.string :phone_num

      t.timestamps
    end
  end
end
