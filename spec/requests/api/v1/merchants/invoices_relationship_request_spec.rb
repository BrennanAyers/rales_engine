require 'rails_helper'

describe 'Merchant Invoices Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @invoice_1 = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @invoice_2 = create(:invoice, customer: @customer, merchant: @merchant, status: "meow")
    @invoice_3 = create(:invoice, customer: @customer, merchant: @merchant, status: "snoozed")
    @invoice_list = [@invoice_1, @invoice_2, @invoice_3]
  end

  it 'sends a list of a merchants invoices' do
    get "/api/v1/merchants/#{@merchant.id}/invoices"
    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(3)

    invoices.each_with_index do |invoice, index|
      expect(invoice["type"]).to eq("invoice")
      expect(invoice["attributes"]["id"]).to eq(@invoice_list[index].id)
      expect(invoice["attributes"]["customer_id"]).to eq(@invoice_list[index].customer_id)
      expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_list[index].merchant_id)
      expect(invoice["attributes"]["status"]).to eq(@invoice_list[index].status)
    end
  end
end
