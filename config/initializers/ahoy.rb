class Ahoy::Store < Ahoy::DatabaseStore
    def track_visit(data)
        data[:ip] = request.env['HTTP_CF_CONNECTING_IP'] || request.remote_ip
        super(data)
    end
end

# set to true for JavaScript tracking
Ahoy.api = false
Ahoy.visit_duration = 30.minutes
Ahoy.exclude_method = lambda do |controller, request|
    request.referer&.include?(".ru") && !request.referer&.include?("yandex")
end