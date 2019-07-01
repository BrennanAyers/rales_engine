require 'rails_helper'

describe 'Item Merchant Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @item = create(:item, name: "Fake Taxes", description: "They look legit!", merchant: @merchant, unit_price: 199999)
  end

  it 'sends the merchant of as item' do
    get "/api/v1/items/#{@item.id}/merchant"
    expect(response).to be_successful

    merchant = JSON.parse(response.body)['data']

    expect(merchant["type"]).to eq("merchant")
    expect(merchant["attributes"]["id"]).to eq(@merchant.id)
    expect(merchant["attributes"]["name"]).to eq(@merchant.name)
  end
end
