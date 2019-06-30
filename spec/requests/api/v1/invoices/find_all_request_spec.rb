require 'rails_helper'

describe 'Invoices Find All API' do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1, status: "shipped", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_1, status: "shipped", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @invoice_3 = create(:invoice, customer: @customer_1, merchant: @merchant_2, status: "returned", created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
  end

  it 'finds an invoice by id' do

    get "/api/v1/invoices/find_all?id=#{@invoice_1.id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find_all?id=#{@invoice_2.id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find_all?id=#{@invoice_3.id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds invoices by customer_id' do

    get "/api/v1/invoices/find_all?customer_id=#{@invoice_1.customer_id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find_all?customer_id=#{@invoice_2.customer_id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find_all?customer_id=#{@invoice_3.customer_id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.last["type"]).to eq("invoice")

    expect(invoices.last["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoices.last["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoices.last["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoices.last["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds invoices by merchant_id' do

    get "/api/v1/invoices/find_all?merchant_id=#{@invoice_1.merchant_id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find_all?merchant_id=#{@invoice_2.merchant_id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.last["type"]).to eq("invoice")

    expect(invoices.last["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoices.last["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoices.last["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoices.last["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find_all?merchant_id=#{@invoice_3.merchant_id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds invoices by status' do

    get "/api/v1/invoices/find_all?status=#{@invoice_1.status}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find_all?status=#{@invoice_2.status}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.last["type"]).to eq("invoice")

    expect(invoices.last["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoices.last["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoices.last["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoices.last["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find_all?status=#{@invoice_3.status}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.last["type"]).to eq("invoice")

    expect(invoices.last["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoices.last["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoices.last["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoices.last["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds invoices by created_at' do

    get "/api/v1/invoices/find_all?created_at=#{@invoice_1.created_at}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find_all?created_at=#{@invoice_2.created_at}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.last["type"]).to eq("invoice")

    expect(invoices.last["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoices.last["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoices.last["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoices.last["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find_all?created_at=#{@invoice_3.created_at}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds invoices by updated_at' do

    get "/api/v1/invoices/find_all?updated_at=#{@invoice_1.updated_at}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(1)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find_all?updated_at=#{@invoice_2.updated_at}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.first["type"]).to eq("invoice")

    expect(invoices.first["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoices.first["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoices.first["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoices.first["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find_all?updated_at=#{@invoice_3.updated_at}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)['data']
    expect(invoices.count).to eq(2)
    expect(invoices.last["type"]).to eq("invoice")

    expect(invoices.last["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoices.last["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoices.last["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoices.last["attributes"]["status"]).to eq(@invoice_3.status)
  end
end
