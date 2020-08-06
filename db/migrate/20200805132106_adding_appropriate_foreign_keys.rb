class AddingAppropriateForeignKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :clients_roles, id: false do |t|
      t.belongs_to :client
      t.belongs_to :role
    end
    add_reference :addresses, :client, index: true
    add_reference :orders, :client, index: true
  end
end
