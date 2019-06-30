require 'rails_helper'

describe 'Merchant Items Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @item_1 = create(:item, name: "Fake Taxes", description: "They look legit!", merchant: @merchant, unit_price: 199999)
    @item_2 = create(:item, name: "Small Cat", description: "You can barely see it!", merchant: @merchant, unit_price: 1500)
    @item_3 = create(:item, name: "That One Card Game", description: "You know, the one with the boring jokes.", merchant: @merchant, unit_price: 2049)
    @item_list = [@item_1, @item_2, @item_3]
  end

  it 'sends a list of a merchants items' do
    get "/api/v1/merchants/#{@merchant.id}/items"
    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(3)

    items.each_with_index do |item, index|
      expect(item["type"]).to eq("item")
      expect(item["attributes"]["id"]).to eq(@item_list[index].id)
      expect(item["attributes"]["name"]).to eq(@item_list[index].name)
      expect(item["attributes"]["description"]).to eq(@item_list[index].description)
      expect(item["attributes"]["merchant_id"]).to eq(@item_list[index].merchant_id)
      expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_list[index].unit_price.fdiv(100))
    end
  end
end
