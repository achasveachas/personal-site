class Ahoy::Store < Ahoy::DatabaseStore
    def track_visit(data)
        data[:ip] = request.env['HTTP_CF_CONNECTING_IP'] || request.remote_ip
        super(data)
    end
end

Ahoy.geocode = true

# set to true for JavaScript tracking
Ahoy.api = true
Ahoy.server_side_visits = :when_needed
Ahoy.user_agent_parser = :device_detector