class Employee < ApplicationRecord
    has_many :pictures, as: :imageable
    has_many :subordinates, class_name: "Employee", foreign_key: "engineer_id"
    has_many :managers, class_name: "Employee", foreign_key: "human_resource_id"

    belongs_to :engineer, class_name: "Employee", optional: true
    belongs_to :human_resource, class_name: "Employee", optional: true
end
