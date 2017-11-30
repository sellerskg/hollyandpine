class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :contact_method
      t.text :message

      t.timestamps null: false
    end
  end
end
