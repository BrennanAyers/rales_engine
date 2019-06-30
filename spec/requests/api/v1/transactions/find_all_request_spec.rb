require 'rails_helper'

describe 'Transactions Find All API' do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_2)
    @transaction_1 = create(:transaction, invoice: @invoice_1, credit_card_number: "1987654321012345", result: "success", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @transaction_2 = create(:transaction, invoice: @invoice_2, credit_card_number: "1987654321012345", result: "failed", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @transaction_3 = create(:transaction, invoice: @invoice_1, credit_card_number: "3987654321012345", result: "failed", created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
  end

  it 'finds a transaction by id' do

    get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find_all?id=#{@transaction_2.id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find_all?id=#{@transaction_3.id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds transactions by invoice_id' do

    get "/api/v1/transactions/find_all?invoice_id=#{@transaction_1.invoice_id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find_all?invoice_id=#{@transaction_2.invoice_id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find_all?invoice_id=#{@transaction_3.invoice_id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.last["type"]).to eq("transaction")

    expect(transactions.last["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transactions.last["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transactions.last["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transactions.last["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds transactions by credit_card_number' do

    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_1.credit_card_number}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_2.credit_card_number}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.last["type"]).to eq("transaction")

    expect(transactions.last["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transactions.last["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transactions.last["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transactions.last["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_3.credit_card_number}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds transactions by result' do

    get "/api/v1/transactions/find_all?result=#{@transaction_1.result}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find_all?result=#{@transaction_2.result}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find_all?result=#{@transaction_3.result}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.last["type"]).to eq("transaction")

    expect(transactions.last["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transactions.last["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transactions.last["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transactions.last["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds transactions by created_at' do

    get "/api/v1/transactions/find_all?created_at=#{@transaction_1.created_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find_all?created_at=#{@transaction_2.created_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.last["type"]).to eq("transaction")

    expect(transactions.last["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transactions.last["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transactions.last["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transactions.last["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find_all?created_at=#{@transaction_3.created_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_3.result)
  end

  it 'finds transactions by updated_at' do

    get "/api/v1/transactions/find_all?updated_at=#{@transaction_1.updated_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(1)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_1.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_1.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_1.result)

    get "/api/v1/transactions/find_all?updated_at=#{@transaction_2.updated_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.first["type"]).to eq("transaction")

    expect(transactions.first["attributes"]["id"]).to eq(@transaction_2.id)
    expect(transactions.first["attributes"]["invoice_id"]).to eq(@transaction_2.invoice_id)
    expect(transactions.first["attributes"]["credit_card_number"]).to eq(@transaction_2.credit_card_number)
    expect(transactions.first["attributes"]["result"]).to eq(@transaction_2.result)

    get "/api/v1/transactions/find_all?updated_at=#{@transaction_3.updated_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)['data']
    expect(transactions.count).to eq(2)
    expect(transactions.last["type"]).to eq("transaction")

    expect(transactions.last["attributes"]["id"]).to eq(@transaction_3.id)
    expect(transactions.last["attributes"]["invoice_id"]).to eq(@transaction_3.invoice_id)
    expect(transactions.last["attributes"]["credit_card_number"]).to eq(@transaction_3.credit_card_number)
    expect(transactions.last["attributes"]["result"]).to eq(@transaction_3.result)
  end
end
