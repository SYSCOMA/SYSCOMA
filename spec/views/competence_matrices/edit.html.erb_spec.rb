require 'rails_helper'

RSpec.describe "competence_matrices/edit", :type => :view do
  before(:each) do
    @competence_matrix = assign(:competence_matrix, CompetenceMatrix.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit competence_matrix form" do
    render

    assert_select "form[action=?][method=?]", competence_matrix_path(@competence_matrix), "post" do

      assert_select "input#competence_matrix_name[name=?]", "competence_matrix[name]"
    end
  end
end
