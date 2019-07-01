require 'rails_helper'

describe 'Transaction Invoice Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @transaction = create(:transaction, invoice: @invoice)
  end

  it 'sends the invoice of a transaction' do
    get "/api/v1/transactions/#{@transaction.id}/invoice"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']

    expect(invoice["type"]).to eq("invoice")
    expect(invoice["attributes"]["id"]).to eq(@invoice.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice.status)
  end
end
