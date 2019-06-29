require 'rails_helper'

describe "Invoice Items API" do
  it "sends a list of invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.count).to eq(3)
  end

  it "can get one invoice item by its id" do
    object = create(:invoice_item, unit_price: 1000)

    get "/api/v1/invoice_items/#{object.id}"

    invoice_item = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice_item["type"]).to eq("invoice_item")
    expect(invoice_item["attributes"]["id"]).to eq(object.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(object.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(object.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(object.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq(('%.2f' % object.unit_price.fdiv(100)).to_s)
  end
end
