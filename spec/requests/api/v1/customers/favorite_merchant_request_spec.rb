require 'rails_helper'

describe 'Customers Favorite Merchant API' do
  before :each do
    @customer = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @merchant_4 = create(:merchant)
    @merchant_5 = create(:merchant)
    @merchant_6 = create(:merchant)
    @item_1 = create(:item, unit_price: 100, merchant: @merchant_1)
    @item_2 = create(:item, unit_price: 1000, merchant: @merchant_2)
    @item_3 = create(:item, unit_price: 200, merchant: @merchant_3)
    @item_4 = create(:item, unit_price: 500, merchant: @merchant_4)
    @item_5 = create(:item, unit_price: 2000, merchant: @merchant_5)
    @item_6 = create(:item, unit_price: 20, merchant: @merchant_6)

    @invoice_1 = create(:invoice, customer: @customer, merchant: @merchant_1, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_1 = create(:invoice_item, quantity: 3, unit_price: 100, invoice: @invoice_1, item: @item_1)
    @transaction_1 = create(:transaction, invoice: @invoice_1)

    @invoice_2 = create(:invoice, customer: @customer, merchant: @merchant_2, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_2 = create(:invoice_item, quantity: 2, unit_price: 1000, invoice: @invoice_2, item: @item_2)
    @transaction_2 = create(:transaction, invoice: @invoice_2)

    @invoice_3 = create(:invoice, customer: @customer, merchant: @merchant_3, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: @invoice_3, item: @item_3)
    @transaction_3 = create(:transaction, invoice: @invoice_3)

    @invoice_4 = create(:invoice, customer: @customer, merchant: @merchant_4, updated_at: "2012-03-26 09:54:09 UTC")
    @invoice_item_4 = create(:invoice_item, quantity: 4, unit_price: 100, invoice: @invoice_4, item: @item_4)
    @transaction_4 = create(:transaction, invoice: @invoice_4)

    @invoice_5 = create(:invoice, customer: @customer, merchant: @merchant_5, updated_at: "2012-03-25 09:54:09 UTC")
    @invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: 1000, invoice: @invoice_5, item: @item_5)
    @transaction_2 = create(:transaction, invoice: @invoice_5)

    @invoice_6 = create(:invoice, customer: @customer, merchant: @merchant_6, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_6, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_6)

    @invoice_7 = create(:invoice, customer: @customer, merchant: @merchant_6, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_7, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_7)

    @invoice_8 = create(:invoice, customer: @customer, merchant: @merchant_6, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_8, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_8)

    @invoice_9 = create(:invoice, customer: @customer, merchant: @merchant_5, updated_at: "2012-03-12 05:54:09 UTC")
    @invoice_item_6 = create(:invoice_item, quantity: 6, unit_price: 200, invoice: @invoice_9, item: @item_6)
    @transaction_6 = create(:transaction, invoice: @invoice_9)
  end

  it "sends the merchant with the most number of completed invoices with this customer" do
    get "/api/v1/customers/#{@customer.id}/favorite_merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)['data']

    expect(merchant["type"]).to eq("merchant")

    expect(customer["attributes"]["id"]).to eq(@customer_6.id)
  end
end
