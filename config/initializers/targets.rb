if Rails.env.production?
  TARGETS_EMAILS = ['servic@metro.sp.gov.br', 'ouvidoria@metrosp.com.br']
else
  raise "TEST_EMAIL is missing" if ENV["TEST_EMAIL"].nil?
  TARGETS_EMAILS = ENV["TEST_EMAIL"]
end
