require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]

    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    object = create(:merchant)

    get "/api/v1/merchants/#{object.id}"

    merchant = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(merchant["type"]).to eq("merchant")
    expect(merchant["attributes"]["id"]).to eq(object.id)
    expect(merchant["attributes"]["name"]).to eq(object.name)
  end
end
