require 'rails_helper'

RSpec.describe User, :type => :model do
    let(:user) { FactoryGirl.create :user }

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:name) }
    it { should respond_to(:username) }
end
