require 'rails_helper'

describe 'Invoice Merchant Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
  end

  it 'sends the merchant of an invoice' do
    get "/api/v1/invoices/#{@invoice.id}/merchant"
    expect(response).to be_successful

    merchant = JSON.parse(response.body)['data']

    expect(merchant["type"]).to eq("merchant")
    expect(merchant["attributes"]["id"]).to eq(@merchant.id)
    expect(merchant["attributes"]["name"]).to eq(@merchant.name)
  end
end
