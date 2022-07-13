class Weapon < ApplicationRecord
    validates :level, numericality:{greater_than_or_equal_to: 0}
    validates :power_base, numericality:{greater_than_or_equal_to: 100, less_than_or_equal_to: 350}
    validates :power_step, numericality:{greater_than_or_equal_to: 400, less_than_or_equal_to: 1000}

    def current_power
        (self.power_base + ((self.level -1)) * self.power_step)
    end

    def title
        "#{self.name} ##{self.level}"
    end
end
