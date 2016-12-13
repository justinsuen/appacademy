require 'rails_helper'

begin
  Comment
rescue
  Comment = nil
end

RSpec.describe Comment, :type => :model do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:link) }
  it { should belong_to(:user) }
  it { should belong_to(:link) }
end
