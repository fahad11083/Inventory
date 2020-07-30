class AddSelfRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :engineer, foreign_key: { to_table: :employees }
    add_reference :employees, :human_resource, foreign_key: { to_table: :employees }
  end
end
