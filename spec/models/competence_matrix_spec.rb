require 'rails_helper'

RSpec.describe CompetenceMatrix, :type => :model do

  let(:competence_matrix) { FactoryGirl.create :competence_matrix }
  
  describe "Ability Name and abilities" do
    it { should respond_to(:name) }
    it { should respond_to(:abilities) }
  end

  describe "Ability contage" do
    it "should have no ability" do
      expect(competence_matrix.abilities).to eq([])
    end

    it "should have an ability" do
      ability = FactoryGirl.build :ability
      ability.competence_matrix = competence_matrix
      ability.save
      competence_matrix.reload
      expect(competence_matrix.abilities).to eq([ability])
    end
  end

end
