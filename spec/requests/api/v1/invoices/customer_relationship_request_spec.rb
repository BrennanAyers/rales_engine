require 'rails_helper'

describe 'Invoice Customer Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer, first_name: "Nunya", last_name: "Bizzniss")
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
  end

  it 'sends the customer of an invoice' do
    get "/api/v1/invoices/#{@invoice.id}/customer"
    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']

    expect(customer["type"]).to eq("customer")
    expect(customer["attributes"]["id"]).to eq(@customer.id)
    expect(customer["attributes"]["first_name"]).to eq(@customer.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@customer.last_name)
  end
end
