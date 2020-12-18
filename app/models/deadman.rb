class Deadman < ApplicationRecord

    def self.reset
        create
    end

    def self.last_reset
        last&.created_at || Time.now
    end

    def self.triggered
        create(triggered: true)
    end

    def self.triggered?
        where(triggered: true).size > 0
    end
end
