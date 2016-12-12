# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'password encryption' do
    it 'does not save passwords to database' do
      User.create!(username: 'kobe_bryant', password: 'black_mamba')
      user = User.find_by_username('kobe_bryant')
      expect(user.password).not_to be('black_mamba')
    end

    it 'encrypts password with BCrypt' do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: 'kobe_bryant', password: 'black_mamba')
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end
end
