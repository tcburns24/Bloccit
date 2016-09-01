require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_post) { create(:post) }

  #--------------- I. UPDATE ---------------

  context "authenticated and authorized users" do
    before do
      my_user.admin!
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
      @new_post = build(:post)
    end

    describe "PUT update" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "updates a post with the correct attributes" do
        updated_post = Post.find(my_post.id)
        expect(response.body).to eq(updated_post.to_json)
      end
    end


  #--------------END I. UPDATE -----------------
 #===============================================
  #------------- II. CREATE ------------------

    describe "POST create" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["name"]).to eq(@new_post.name)
      end
    end

  # ------------- END II. CREATE ----------------
#===============================================
  # ------------- III. DESTROY -----------------

    describe "DELETE destroy" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "returns the correct json success message" do
        expect(response.body).to eq({ message: "Post destroyed", status: 200 }.to_json)
      end

      it "deletes my_post" do
        expect{ Topic.find(my_topic.id) }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end

  # -------------- END III. DESTROY ---------------
