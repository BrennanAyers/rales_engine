require 'rails_helper'

describe 'Merchants Favorite Customer API' do
  before :each do
    @merchant = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @customer_4 = create(:customer)
    @customer_5 = create(:customer)
    @customer_6 = create(:customer)
    @item_1 = create(:item, unit_price: 100, merchant: @merchant)
    @item_2 = create(:item, unit_price: 1000, merchant: @merchant)
    @item_3 = create(:item, unit_price: 200, merchant: @merchant)
    @item_4 = create(:item, unit_price: 500, merchant: @merchant)
    @item_5 = create(:item, unit_price: 2000, merchant: @merchant)
    @item_6 = create(:item, unit_price: 20, merchant: @merchant)

    @invoice_1 = create(:invoice, merchant: @merchant, customer: @customer_1, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_1 = create(:invoice_item, quantity: 3, unit_price: 100, invoice: @invoice_1, item: @item_1)
    @transaction_1 = create(:transaction, invoice: @invoice_1)

    @invoice_2 = create(:invoice, merchant: @merchant, customer: @customer_2, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_2 = create(:invoice_item, quantity: 2, unit_price: 1000, invoice: @invoice_2, item: @item_2)
    @transaction_2 = create(:transaction, invoice: @invoice_2)

    @invoice_3 = create(:invoice, merchant: @merchant, customer: @customer_3, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: @invoice_3, item: @item_3)
    @transaction_3 = create(:transaction, invoice: @invoice_3)

    @invoice_4 = create(:invoice, merchant: @merchant, customer: @customer_4, updated_at: "2012-03-26 09:54:09 UTC")
    @invoice_item_4 = create(:invoice_item, quantity: 4, unit_price: 100, invoice: @invoice_4, item: @item_4)
    @transaction_4 = create(:transaction, invoice: @invoice_4)

    @invoice_5 = create(:invoice, merchant: @merchant, customer: @customer_5, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: 1000, invoice: @invoice_5, item: @item_5)
    @transaction_2 = create(:transaction, invoice: @invoice_5)

    @invoice_6 = create(:invoice, merchant: @merchant, customer: @customer_6, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_6, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_6)

    @invoice_7 = create(:invoice, merchant: @merchant, customer: @customer_6, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_7, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_7)

    @invoice_8 = create(:invoice, merchant: @merchant, customer: @customer_6, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_8, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_8)

    @invoice_9 = create(:invoice, merchant: @merchant, customer: @customer_5, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_9, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_9)
  end

  it 'sends the top customer based on number of successful transactions' do

    get "/api/v1/merchants/#{@merchant.id}/favorite_customer"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']

    expect(customer["type"]).to eq("customer")

    expect(customer["attributes"]["id"]).to eq(@customer_6.id)
  end
end
