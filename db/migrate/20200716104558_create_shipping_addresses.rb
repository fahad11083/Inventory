class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :city
      t.string :country
      t.references :user, null: false, foreign_key: true
    
      t.timestamps
    end
  end
end
