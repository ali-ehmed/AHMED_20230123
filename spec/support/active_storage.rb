RSpec.configure do |config|
  config.before(:suite) do
    ActiveStorage::Current.url_options = { host: 'www.example.com' }
  end
end
