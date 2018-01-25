require "rails_helper"

RSpec.describe Api::V1::FloofsController, type: :controller do
  let!(:first_floof) { Floof.create(name: "Bob", job_title: "Accountant", current_employer: "Enron", category: "Business", species: "Parrot") }

  describe "GET#index" do
    it "should return a list of all the floofs" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 1

      expect(returned_json[0][0]["name"]).to eq first_floof.name
      expect(returned_json[0][0]["job_title"]).to eq first_floof.job_title
      expect(returned_json[0][0]["current_employer"]).to eq first_floof.current_employer
      expect(returned_json[0][0]["category"]).to eq first_floof.category
      expect(returned_json[0][0]["species"]).to eq first_floof.species

    end
  end

  describe "GET#show" do
    it "should return the specified floof" do

      get :show, params: { id: first_floof.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 8

      expect(returned_json["name"]).to eq first_floof.name
      expect(returned_json["job_title"]).to eq first_floof.job_title
      expect(returned_json["current_employer"]).to eq first_floof.current_employer
      expect(returned_json["category"]).to eq first_floof.category
      expect(returned_json["species"]).to eq first_floof.species
    end
  end


end