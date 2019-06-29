require 'rails_helper'

describe 'Items Most Revenue API' do
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
    @transaction_1 = create(:transaction, invoice: @invoice_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2)
    @invoice_item_2 = create(:invoice_item, quantity: 2, unit_price: 1000, invoice: @invoice_2, item: @item_2)
    @transaction_2 = create(:transaction, invoice: @invoice_2)
    @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_2)
    @invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: @invoice_3, item: @item_3)
    @transaction_3 = create(:transaction, invoice: @invoice_3)
  end

  it 'sends the top items by most revenue' do
    item_list = [@item_2, @item_1, @item_3]
    get '/api/v1/items/most_revenue'

    expect(response).to be_successful

    items = JSON.parse(response.body)["data"]

    expect(items.count).to eq(3)

    items.each_with_index do |item, index|
      expect(item["type"]).to eq("item")
      expect(item["attributes"]["id"]).to eq(item_list[index].id)
      expect(item["attributes"]["name"]).to eq(item_list[index].name)
    end
  end

  it 'sends the top item by most revenue' do
    get '/api/v1/items/most_revenue?quantity=1'

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]

    expect(item.count).to eq(1)
    expect(item[0]["type"]).to eq("item")
    expect(item[0]["attributes"]["id"]).to eq(@item_2.id)
    expect(item[0]["attributes"]["name"]).to eq(@item_2.name)
  end
end
