require 'rails_helper'

describe 'Invoice Item Invoice Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @item = create(:item, name: "Fake Taxes", description: "They look legit!", merchant: @merchant, unit_price: 199999)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @invoice_item = create(:invoice_item, item: @item, invoice: @invoice, quantity: 1, unit_price: 199999)
  end

  it 'sends the invoice of an invoice item' do
    get "/api/v1/invoice_items/#{@invoice_item.id}/invoice"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']

    expect(invoice["type"]).to eq("invoice")
    expect(invoice["attributes"]["id"]).to eq(@invoice.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice.status)
  end
end
