require 'rails_helper'

describe 'Invoice Invoice Items Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @item = create(:item, name: "Fake Taxes", description: "They look legit!", merchant: @merchant, unit_price: 199999)
    @invoice_1 = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @invoice_item_1 = create(:invoice_item, item: @item, invoice: @invoice, quantity: 1, unit_price: 199999)
    @invoice_item_2 = create(:invoice_item, item: @item, invoice: @invoice, quantity: 27, unit_price: 1500)
    @invoice_item_3 = create(:invoice_item, item: @item, invoice: @invoice, quantity: 10000, unit_price: 2049)
    @invoice_item_list = [@invoice_item_1, @invoice_item_2, @invoice_item_3]
  end

  it 'sends a list of an invoices invoice items' do
    get "/api/v1/invoices/#{@invoice.id}/invoice_items"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_items.count).to eq(3)

    invoice_items.each_with_index do |invoice_item, index|
      expect(invoice_item["type"]).to eq("invoice_item")
      expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_list[index].id)
      expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_list[index].item_id)
      expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_list[index].invoice_id)
      expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_list[index].quantity)
      expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_list[index].unit_price.fdiv(100))
    end
  end
end
