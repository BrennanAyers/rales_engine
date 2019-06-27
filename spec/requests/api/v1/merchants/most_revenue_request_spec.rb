require 'rails_helper'

describe 'Merchants Most Revenue API' do
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
    @invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: @invoice_3, item: @item_3)
  end

  it 'sends the top merchant by most revenue' do

    get '/api/v1/merchants/most_revenue?quantity=1'

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant.count).to eq(1)
    expect(merchant[0]["type"]).to eq("merchant")
    expect(merchant[0]["attributes"]["id"]).to eq(@merchant_2.id)
    expect(merchant[0]["attributes"]["name"]).to eq(@merchant_2.name)
  end
end
