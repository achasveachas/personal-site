class SessionLog < ApplicationRecord

    WHITELISTED_IPS = [
        "99.203.55.172",
        "162.158.62.209",
        "162.158.62.212"
    ]

    def self.whitelist
        WHITELISTED_IPS
    end
end
