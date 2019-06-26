require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)["data"]

    expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    object = create(:invoice)

    get "/api/v1/invoices/#{object.id}"

    invoice = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice["type"]).to eq("invoice")
    expect(invoice["attributes"]["id"]).to eq(object.id)
    expect(invoice["attributes"]["customer_id"]).to eq(object.customer_id)
    expect(invoice["attributes"]["merchant_id"]).to eq(object.merchant_id)
    expect(invoice["attributes"]["status"]).to eq(object.status)
  end
end
