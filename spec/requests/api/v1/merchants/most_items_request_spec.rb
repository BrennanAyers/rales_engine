require 'rails_helper'

describe 'Merchants Most Items API' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @item_1 = create(:item, unit_price: 100, merchant: @merchant_1)
    @item_2 = create(:item, unit_price: 1000, merchant: @merchant_2)
    @item_3 = create(:item, unit_price: 200, merchant: @merchant_3)
    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1)
    @invoice_item_1 = create(:invoice_item, quantity: 3, unit_price: 100, invoice: @invoice_1, item: @item_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2)
    @invoice_item_2 = create(:invoice_item, quantity: 2, unit_price: 1000, invoice: @invoice_2, item: @item_2)
    @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_2)
    @invoice_item_3 = create(:invoice_item, quantity: 10, unit_price: 200, invoice: @invoice_3, item: @item_3)
  end

  it 'sends a list of merchants by most items sold' do
    merchant_list = [@merchant_3, @merchant_1, @merchant_2]
    get '/api/v1/merchants/most_items'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']

    expect(merchants.count).to eq(3)

    merchants.each_with_index do |merchant, index|
      expect(merchant["type"]).to eq("merchant")
      expect(merchant["attributes"]["id"]).to eq(merchant_list[index].id)
      expect(merchant["attributes"]["name"]).to eq(merchant_list[index].name)
    end
  end

  it 'sends the top merchant by most items' do
    get '/api/v1/merchants/most_items?quantity=1'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant.count).to eq(1)
    expect(merchant[0]["type"]).to eq("merchant")
    expect(merchant[0]["attributes"]["id"]).to eq(@merchant_3.id)
    expect(merchant[0]["attributes"]["name"]).to eq(@merchant_3.name)
  end
end
