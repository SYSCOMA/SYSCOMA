require 'rails_helper'

RSpec.describe "CompetenceMatrices", :type => :request do
  describe "GET /competence_matrices" do
    it "works! (now write some real specs)" do
      get competence_matrices_path
      expect(response).to have_http_status(200)
    end
  end
end
