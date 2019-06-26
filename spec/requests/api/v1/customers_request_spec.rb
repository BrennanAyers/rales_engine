require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)["data"]

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    object = create(:customer)

    get "/api/v1/customers/#{object.id}"

    customer = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(customer["type"]).to eq("customer")
    expect(customer["attributes"]["id"]).to eq(object.id)
    expect(customer["attributes"]["first_name"]).to eq(object.first_name)
    expect(customer["attributes"]["last_name"]).to eq(object.last_name)
  end
end
