require 'rails_helper'

describe 'Invoice Items Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @item_1 = create(:item, name: "Fake Taxes", description: "They look legit!", merchant: @merchant, unit_price: 199999)
    @item_2 = create(:item, name: "Small Cat", description: "You can barely see it!", merchant: @merchant, unit_price: 1500)
    @item_3 = create(:item, name: "That One Card Game", description: "You know, the one with the boring jokes.", merchant: @merchant, unit_price: 2049)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice, quantity: 1, unit_price: 199999)
    @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice, quantity: 27, unit_price: 1500)
    @invoice_item_3 = create(:invoice_item, item: @item_2, invoice: @invoice, quantity: 10000, unit_price: 2049)
    @item_list = [@item_1, @item_2, @item_3]
  end

  it 'sends a list of an invoices items' do
    get "/api/v1/invoices/#{@invoice.id}/items"
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
