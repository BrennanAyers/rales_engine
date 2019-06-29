require 'rails_helper'

describe 'Items Best Day API' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @item = create(:item, unit_price: 100, merchant: @merchant_1)
    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1, updated_at: "2012-04-01 05:54:09 UTC")
    @invoice_item_1 = create(:invoice_item, quantity: 10, unit_price: 100, invoice: @invoice_1, item: @item)
    @transaction_1 = create(:transaction, invoice: @invoice_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2, updated_at: "2012-04-02 05:54:09 UTC")
    @invoice_item_2 = create(:invoice_item, quantity: 4, unit_price: 1000, invoice: @invoice_2, item: @item)
    @transaction_2 = create(:transaction, invoice: @invoice_2)
    @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_2, updated_at: "2012-04-03 05:54:09 UTC")
    @invoice_item_3 = create(:invoice_item, quantity: 2, unit_price: 200, invoice: @invoice_3, item: @item)
    @transaction_3 = create(:transaction, invoice: @invoice_3)
  end

  it 'sends the date by most sold' do
    get "/api/v1/items/#{@item.id}/best_day"

    expect(response).to be_successful

    date = JSON.parse(response.body)["data"]

    expect(date["type"]).to eq("date")

    expect(date["attributes"]["id"]).to eq("2012-04-02")
  end
end
