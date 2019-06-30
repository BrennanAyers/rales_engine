require 'rails_helper'

describe 'Transactions Find API' do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_2)
    @invoice_3 = create(:invoice, customer: @customer_3, merchant: @merchant_3)
    @transaction_1 = create(:transaction, invoice: @invoice_1, credit_card_number: "1987654321012345", result: "success", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @transaction_2 = create(:transaction, invoice: @invoice_2, credit_card_number: "2987654321012345", result: "failed", created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @transaction_3 = create(:transaction, invoice: @invoice_3, credit_card_number: "3987654321012345", result: "refunded", created_at: "2012-03-29T14:54:05.000Z", updated_at: "2012-03-29T14:54:05.000Z")
  end

  it 'finds a transaction by id' do

    get "/api/v1/transactions/find?id=#{@transaction_1.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find?id=#{@transaction_2.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find?id=#{@transaction_3.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds a transaction by invoice_id' do

    get "/api/v1/transactions/find?invoice_id=#{@transaction_1.invoice_id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find?invoice_id=#{@transaction_2.invoice_id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find?invoice_id=#{@transaction_3.invoice_id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds a transaction by credit_card_number' do

    get "/api/v1/transactions/find?credit_card_number=#{@transaction_1.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find?credit_card_number=#{@transaction_2.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find?credit_card_number=#{@transaction_3.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds a transaction by result' do

    get "/api/v1/transactions/find?result=#{@transaction_1.result}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find?result=#{@transaction_2.result}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find?result=#{@transaction_3.result}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds a transaction by created_at' do

    get "/api/v1/transactions/find?created_at=#{@transaction_1.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find?created_at=#{@transaction_2.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find?created_at=#{@transaction_3.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds a transaction by updated_at' do

    get "/api/v1/transactions/find?updated_at=#{@transaction_1.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find?updated_at=#{@transaction_2.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find?updated_at=#{@transaction_3.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)['data']
    expect(transaction["type"]).to eq("transaction")

    expect(transaction["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transaction["attributes"]["result"]).to eq(@transaction_3.result)
  end
end
