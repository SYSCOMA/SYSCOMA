require "rails_helper"

RSpec.describe CompetenceMatricesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/competence_matrices").to route_to("competence_matrices#index")
    end

    it "routes to #new" do
      expect(:get => "/competence_matrices/new").to route_to("competence_matrices#new")
    end

    it "routes to #show" do
      expect(:get => "/competence_matrices/1").to route_to("competence_matrices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/competence_matrices/1/edit").to route_to("competence_matrices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/competence_matrices").to route_to("competence_matrices#create")
    end

    it "routes to #update" do
      expect(:put => "/competence_matrices/1").to route_to("competence_matrices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/competence_matrices/1").to route_to("competence_matrices#destroy", :id => "1")
    end

  end
end
