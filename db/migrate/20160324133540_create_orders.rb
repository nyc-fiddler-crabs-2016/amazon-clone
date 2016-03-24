class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :shopped_now, default: true
      t.references :user, index: true, foreign_key: true
      t.references :cart
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
