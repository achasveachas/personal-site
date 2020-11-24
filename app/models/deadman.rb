clast Deadman < ApplicationRecord

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
        last&.triggered?
    end
end
