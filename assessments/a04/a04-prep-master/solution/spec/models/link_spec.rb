# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
begin
  Link
rescue
  Link = nil
end

RSpec.describe Link, :type => :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:user) }
  it { should have_many(:comments) }
end
