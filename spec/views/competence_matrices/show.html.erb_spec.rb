require 'rails_helper'

RSpec.describe "competence_matrices/show", :type => :view do
  before(:each) do
    @competence_matrix = assign(:competence_matrix, CompetenceMatrix.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
