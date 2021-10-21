Sentry.init do |config|
  config.dsn = 'https://2a1bf2c652b0482098657a46989cfb69@o1046990.ingest.sentry.io/6024010'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
