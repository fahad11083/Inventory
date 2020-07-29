class ShippingAddress < ApplicationRecord
    belongs_to :user, touch: true
    
    validate :city_and_country_shall_not_same
    validates_with ActiveValidator, fields: [:city, :country]
    after_destroy :log_destroy_action

    def city_and_country_shall_not_same
        errors.add(:city, "could not be of same city and country") if city == country
    end

    after_touch do
        puts 'A Shipping Address is being touched'
    end

    def log_destroy_action
        puts 'Shipping is destroyed'
    end
end
