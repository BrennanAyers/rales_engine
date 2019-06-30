require 'rails_helper'

describe 'Invoices Find API' do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1, status: "shipped", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_2, status: "packaged", created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @invoice_3 = create(:invoice, customer: @customer_3, merchant: @merchant_3, status: "returned", created_at: "2012-03-29T14:54:05.000Z", updated_at: "2012-03-29T14:54:05.000Z")
  end

  it 'finds a invoice by id' do

    get "/api/v1/invoices/find?id=#{@invoice_1.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find?id=#{@invoice_2.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find?id=#{@invoice_3.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds a invoice by customer_id' do

    get "/api/v1/invoices/find?customer_id=#{@invoice_1.customer_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find?customer_id=#{@invoice_2.customer_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find?customer_id=#{@invoice_3.customer_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds a invoice by merchant_id' do

    get "/api/v1/invoices/find?merchant_id=#{@invoice_1.merchant_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find?merchant_id=#{@invoice_2.merchant_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find?merchant_id=#{@invoice_3.merchant_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds a invoice by status' do

    get "/api/v1/invoices/find?status=#{@invoice_1.status}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find?status=#{@invoice_2.status}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find?status=#{@invoice_3.status}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds a invoice by created_at' do

    get "/api/v1/invoices/find?created_at=#{@invoice_1.created_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find?created_at=#{@invoice_2.created_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find?created_at=#{@invoice_3.created_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_3.status)
  end

  it 'finds a invoice by updated_at' do

    get "/api/v1/invoices/find?updated_at=#{@invoice_1.updated_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_1.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_1.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_1.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_1.status)

    get "/api/v1/invoices/find?updated_at=#{@invoice_2.updated_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_2.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_2.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_2.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_2.status)

    get "/api/v1/invoices/find?updated_at=#{@invoice_3.updated_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)['data']
    expect(invoice["type"]).to eq("invoice")

    expect(invoice["attributes"]["id"]).to eq(@invoice_3.id)
    expect(invoice["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(@invoice_3.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(@invoice_3.status)
  end
end
