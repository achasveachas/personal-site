class Ahoy::Store < Ahoy::DatabaseStore
    def track_visit(data)
        binding.pry
        data[:ip] = request.env['HTTP_CF_CONNECTING_IP'] || request.remote_ip
        super(data)
    end
end

# set to true for JavaScript tracking
Ahoy.api = false
Ahoy.visit_duration = 30.minutes
Ahoy.quiet = false