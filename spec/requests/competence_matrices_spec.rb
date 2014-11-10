require 'rails_helper'

RSpec.describe "CompetenceMatrices", :type => :request do
  describe "GET /competence_matrices" do
    it "Fails to access without login" do
      get competence_matrices_path
      expect(response).to have_http_status(302)
    end
  end
end
