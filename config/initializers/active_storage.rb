Rails.application.config.active_storage.url_options = {
  host: 'localhost',
  port: 3000, # or the port your Rails server is running on
  protocol: 'https' # or 'http' depending on your setup
}

Rails.application.config.active_storage.variant_processor = :vips
