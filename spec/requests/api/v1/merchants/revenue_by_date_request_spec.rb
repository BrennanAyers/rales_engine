require 'rails_helper'

describe 'Merchants Revenue by Date API' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @item_1 = create(:item, unit_price: 100, merchant: @merchant_1)
    @item_2 = create(:item, unit_price: 1000, merchant: @merchant_2)
    @item_3 = create(:item, unit_price: 200, merchant: @merchant_3)
    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_1 = create(:invoice_item, quantity: 3, unit_price: 100, invoice: @invoice_1, item: @item_1)
    @transaction_1 = create(:transaction, invoice: @invoice_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_2 = create(:invoice_item, quantity: 2, unit_price: 1000, invoice: @invoice_2, item: @item_2)
    @transaction_2 = create(:transaction, invoice: @invoice_2)
    @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_2, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: @invoice_3, item: @item_3)
    @transaction_3 = create(:transaction, invoice: @invoice_3)
    @merchant_4 = create(:merchant)
    @merchant_5 = create(:merchant)
    @merchant_6 = create(:merchant)
    @customer_3 = create(:customer)
    @customer_4 = create(:customer)
    @item_4 = create(:item, unit_price: 100, merchant: @merchant_4)
    @item_5 = create(:item, unit_price: 1000, merchant: @merchant_5)
    @item_6 = create(:item, unit_price: 200, merchant: @merchant_6)
    @invoice_4 = create(:invoice, merchant: @merchant_4, customer: @customer_3, updated_at: "2012-03-26 09:54:09 UTC")
    @invoice_item_4 = create(:invoice_item, quantity: 4, unit_price: 100, invoice: @invoice_4, item: @item_4)
    @transaction_4 = create(:transaction, invoice: @invoice_4)
    @invoice_5 = create(:invoice, merchant: @merchant_5, customer: @customer_4, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: 1000, invoice: @invoice_5, item: @item_5)
    @transaction_2 = create(:transaction, invoice: @invoice_5)
    @invoice_6 = create(:invoice, merchant: @merchant_6, customer: @customer_4, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_6, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_6)
  end

  it 'sends value of revenue for 2012-03-25' do
    get "/api/v1/merchants/revenue?date='2012-03-25'"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"][0]

    expect(merchants["attributes"]["total_revenue"]).to eq("33.00")
  end

  it 'sends value of revenue for 2012-03-12' do
    get "/api/v1/merchants/revenue?date='2012-03-12'"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"][0]

    expect(merchants["attributes"]["total_revenue"]).to eq("14.00")
  end

  it 'sends value of revenue for 2012-03-26' do
    get "/api/v1/merchants/revenue?date='2012-03-26'"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"][0]

    expect(merchant["attributes"]["total_revenue"]).to eq("4.00")
  end

  it 'sends value of no revenue for 2012-04-01' do
    get "/api/v1/merchants/revenue?date='2012-04-01'"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"][0]

    expect(merchants["attributes"]["total_revenue"]).to eq("0.00")
  end
end
