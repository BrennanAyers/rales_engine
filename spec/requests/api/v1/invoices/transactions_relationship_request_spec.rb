require 'rails_helper'

describe 'Invoice Transactions Relationship API' do
  before :each do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant, status: "fraudulent")
    @transaction_1 = create(:transaction, invoice: @invoice , credit_card_number: "666", result: "oof")
    @transaction_2 = create(:transaction, invoice: @invoice , credit_card_number: "1738", result: "naptime")
    @transaction_3 = create(:transaction, invoice: @invoice , credit_card_number: "80085", result: "boring")
    @transaction_list = [@transaction_1, @transaction_2, @transaction_3]
  end

  it 'sends a list of an invoices transactions' do
    get "/api/v1/invoices/#{@invoice.id}/transactions"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(3)

    transactions.each_with_index do |transaction, index|
      expect(transaction["type"]).to eq("transaction")
      expect(transaction["attributes"]["id"]).to eq(@transaction_list[index].id)
      expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_list[index].invoice_id)
      expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_list[index].credit_card_number)
      expect(transaction["attributes"]["result"]).to eq(@transaction_list[index].result)
    end
  end
end
