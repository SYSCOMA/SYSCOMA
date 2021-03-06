require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CompetenceMatricesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # CompetenceMatrix. As you add validations to CompetenceMatrix, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "AName of Matrix" }
  }

  let(:invalid_attributes) {
    { name: "" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompetenceMatricesController. Be sure to keep this updated too.
  let(:valid_session) { sign_in ( FactoryGirl.create(:admin)) }

  describe "GET index" do
    it "assigns all competence_matrices as @competence_matrices" do
      competence_matrix = CompetenceMatrix.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:competence_matrices)).to eq([competence_matrix])
    end
  end

  describe "GET show" do
    it "assigns the requested competence_matrix as @competence_matrix" do
      competence_matrix = CompetenceMatrix.create! valid_attributes
      get :show, {:id => competence_matrix.to_param}, valid_session
      expect(assigns(:competence_matrix)).to eq(competence_matrix)
    end
  end

  describe "GET new" do
    it "assigns a new competence_matrix as @competence_matrix" do
      get :new, {}, valid_session
      expect(assigns(:competence_matrix)).to be_a_new(CompetenceMatrix)
    end
  end

  describe "GET edit" do
    it "assigns the requested competence_matrix as @competence_matrix" do
      competence_matrix = CompetenceMatrix.create! valid_attributes
      get :edit, {:id => competence_matrix.to_param}, valid_session
      expect(assigns(:competence_matrix)).to eq(competence_matrix)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CompetenceMatrix" do
        expect {
          post :create, {:competence_matrix => valid_attributes}, valid_session
        }.to change(CompetenceMatrix, :count).by(1)
      end

      it "assigns a newly created competence_matrix as @competence_matrix" do
        post :create, {:competence_matrix => valid_attributes}, valid_session
        expect(assigns(:competence_matrix)).to be_a(CompetenceMatrix)
        expect(assigns(:competence_matrix)).to be_persisted
      end

      it "redirects to the created competence_matrix" do
        post :create, {:competence_matrix => valid_attributes}, valid_session
        expect(response).to redirect_to(CompetenceMatrix.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved competence_matrix as @competence_matrix" do
        post :create, {:competence_matrix => invalid_attributes}, valid_session
        expect(assigns(:competence_matrix)).to be_a_new(CompetenceMatrix)
      end

      it "re-renders the 'new' template" do
        post :create, {:competence_matrix => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { name: 'A New Matrix' }
      }

      it "assigns the requested competence_matrix as @competence_matrix" do
        competence_matrix = CompetenceMatrix.create! valid_attributes
        put :update, {:id => competence_matrix.to_param, :competence_matrix => valid_attributes}, valid_session
        expect(assigns(:competence_matrix)).to eq(competence_matrix)
      end

      it "redirects to the competence_matrix" do
        competence_matrix = CompetenceMatrix.create! valid_attributes
        put :update, {:id => competence_matrix.to_param, :competence_matrix => valid_attributes}, valid_session
        expect(response).to redirect_to(competence_matrix)
      end
    end

    describe "with invalid params" do
      it "assigns the competence_matrix as @competence_matrix" do
        competence_matrix = CompetenceMatrix.create! valid_attributes
        put :update, {:id => competence_matrix.to_param, :competence_matrix => invalid_attributes}, valid_session
        expect(assigns(:competence_matrix)).to eq(competence_matrix)
      end

      it "re-renders the 'edit' template" do
        competence_matrix = CompetenceMatrix.create! valid_attributes
        put :update, {:id => competence_matrix.to_param, :competence_matrix => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested competence_matrix" do
      competence_matrix = CompetenceMatrix.create! valid_attributes
      expect {
        delete :destroy, {:id => competence_matrix.to_param}, valid_session
      }.to change(CompetenceMatrix, :count).by(-1)
    end

    it "redirects to the competence_matrices list" do
      competence_matrix = CompetenceMatrix.create! valid_attributes
      delete :destroy, {:id => competence_matrix.to_param}, valid_session
      expect(response).to redirect_to(competence_matrices_url)
    end
  end

end
