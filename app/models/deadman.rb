class Deadman < ApplicationRecord

    def self.reset
        create
    end

    def self.last_reset
        last.created_at
    end
end
