class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :login
      t.references :gender, index: true, foreign_key: true
      t.string :email
      t.boolean :active

      t.timestamps null: false
    end
  end
end
