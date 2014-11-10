require 'rails_helper'

RSpec.describe Ability, :type => :model do
  let(:ability) { create :ability }

  it { should respond_to(:name) }
end
