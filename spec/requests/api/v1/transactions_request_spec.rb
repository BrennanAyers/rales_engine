require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)["data"]

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    object = create(:transaction)

    get "/api/v1/transactions/#{object.id}"

    transaction = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(transaction["type"]).to eq("transaction")
    expect(transaction["attributes"]["id"]).to eq(object.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(object.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(object.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(object.result)
  end
end
