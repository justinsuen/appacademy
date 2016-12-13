# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

begin
  Tweet
rescue
  Tweet = nil
end

RSpec.describe Tweet, :type => :model do
  it { should validate_length_of(:body) }
  it { should have_many(:replies) }
end
