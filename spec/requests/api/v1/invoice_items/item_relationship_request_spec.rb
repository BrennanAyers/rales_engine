require 'rails_helper'

describe 'Invoice Item Item Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @item = create(:item, name: "Fake Taxes", description: "They look legit!", merchant: @merchant, unit_price: 199999)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @invoice_item = create(:invoice_item, item: @item, invoice: @invoice, quantity: 1, unit_price: 199999)
  end

  it 'sends the item of an invoice item' do
    get "/api/v1/invoice_items/#{@invoice_item.id}/item"
    expect(response).to be_successful

    item = JSON.parse(response.body)['data']

    expect(item["type"]).to eq("item")
    expect(item["attributes"]["id"]).to eq(@item[index].id)
    expect(item["attributes"]["name"]).to eq(@item[index].name)
    expect(item["attributes"]["description"]).to eq(@item[index].description)
    expect(item["attributes"]["merchant_id"]).to eq(@item[index].merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item[index].unit_price.fdiv(100))
  end
end
