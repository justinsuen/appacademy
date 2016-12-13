# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  body       :string
#  tweet_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

begin
  Reply
rescue
  Reply = nil
end

RSpec.describe Reply, :type => :model do
  it { should validate_length_of(:body) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:tweet) }
  it { should validate_presence_of(:tweet) }
end
