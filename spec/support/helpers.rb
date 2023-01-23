RSpec::Matchers.define :be_url do
  match do |actual|
    actual =~ URI::regexp
  end
end
