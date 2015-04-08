def initialize_session
  client_id = "CLIENT_ID"
  client_secret = "CLIENT_SECRET"
  Sendvia::Session.new(client_id, client_secret, true)
end
