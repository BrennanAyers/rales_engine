require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)["data"]

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    object = create(:item)

    get "/api/v1/items/#{object.id}"

    item = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(item["type"]).to eq("item")
    expect(item["attributes"]["id"]).to eq(object.id)
    expect(item["attributes"]["name"]).to eq(object.name)
    expect(item["attributes"]["description"]).to eq(object.description)
    expect(item["attributes"]["unit_price"]).to eq(object.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(object.merchant_id)
  end
end
