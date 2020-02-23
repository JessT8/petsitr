class Sitter < ApplicationRecord
    belongs_to :user

    has_many :timeslots

    has_many :bookings

    has_and_belongs_to_many :pets
    validate :phone_logic, on: [:create, :update]
    def phone_logic
      if self.phone =~ /^(?:\d{8,})|(?=\d{4}+ \d{4})/
        if !Sitter.where(self.id.to_s)
          if Sitter.where(phone: phone).exists?
            errors.add(:phone_no, "Phone number taken")
          end
        end
      else
        errors.add(:phone_no, "Invalid input.")
      end
    end
end