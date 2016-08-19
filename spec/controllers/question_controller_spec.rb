require 'rails_helper'
include RandomData

RSpec.describe QuestionController, type: :controller do
  let(:my_question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true)}

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
