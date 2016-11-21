require 'timeout'

# Set a 2-second timeout to avoid infinite loops
RSpec.configure do |c|
  c.around(:each) do |example|
    Timeout::timeout(2) {
      example.run
    }
  end

  c.register_ordering(:global) do |items|
    items.reverse
  end

end
