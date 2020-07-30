class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.belongs_to :physician
      t.belongs_to :patient

      t.timestamps
    end
  end
end
