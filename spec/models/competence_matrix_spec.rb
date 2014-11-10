require 'rails_helper'

RSpec.describe CompetenceMatrix, :type => :model do
    let(:competence_matrix) { create :competence_matrix }

    it { should respond_to(:name) }
end
