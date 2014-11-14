require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show_matrix" do
    it "returns http success" do
      get :show_matrix
      expect(response).to have_http_status(:success)
    end
  end

end
