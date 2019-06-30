require 'rails_helper'

describe 'Customers Find All API' do
  before :each do
    @customer_1 = create(:customer, first_name: "Chuck", last_name: "Norris", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @customer_2 = create(:customer, first_name: "Mr.", last_name: "Governator", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @customer_3 = create(:customer, first_name: "Chuck", last_name: "Governator", created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
  end

  it 'finds a customer by id' do

    get "/api/v1/customers/find_all?id=#{@customer_1.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_1.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_1.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_1.last_name)

    get "/api/v1/customers/find_all?id=#{@customer_2.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_2.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_2.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_2.last_name)

    get "/api/v1/customers/find_all?id=#{@customer_3.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_3.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_3.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_3.last_name)
  end

  it 'finds a customer by first_name' do

    get "/api/v1/customers/find_all?first_name=#{@customer_1.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_1.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_1.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_1.last_name)

    get "/api/v1/customers/find_all?first_name=#{@customer_2.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_2.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_2.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_2.last_name)

    get "/api/v1/customers/find_all?first_name=#{@customer_3.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.last["type"]).to eq("customer")

    expect(customer.last["attributes"]["id"]).to eq(@customer_3.id)
    expect(customer.last["attributes"]["first_name"]).to eq(@customer_3.first_name)
    expect(customer.last["attributes"]["last_name"]).to eq(@customer_3.last_name)
  end

  it 'finds a customer by last_name' do

    get "/api/v1/customers/find_all?last_name=#{@customer_1.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_1.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_1.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_1.last_name)

    get "/api/v1/customers/find_all?last_name=#{@customer_2.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_2.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_2.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_2.last_name)

    get "/api/v1/customers/find_all?last_name=#{@customer_3.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.last["type"]).to eq("customer")

    expect(customer.last["attributes"]["id"]).to eq(@customer_3.id)
    expect(customer.last["attributes"]["first_name"]).to eq(@customer_3.first_name)
    expect(customer.last["attributes"]["last_name"]).to eq(@customer_3.last_name)
  end

  it 'finds a customer by created_at' do

    get "/api/v1/customers/find_all?created_at=#{@customer_1.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_1.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_1.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_1.last_name)

    get "/api/v1/customers/find_all?created_at=#{@customer_2.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.last["type"]).to eq("customer")

    expect(customer.last["attributes"]["id"]).to eq(@customer_2.id)
    expect(customer.last["attributes"]["first_name"]).to eq(@customer_2.first_name)
    expect(customer.last["attributes"]["last_name"]).to eq(@customer_2.last_name)

    get "/api/v1/customers/find_all?created_at=#{@customer_3.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_3.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_3.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_3.last_name)
  end

  it 'finds a customer by updated_at' do

    get "/api/v1/customers/find_all?updated_at=#{@customer_1.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(1)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_1.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_1.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_1.last_name)

    get "/api/v1/customers/find_all?updated_at=#{@customer_2.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.first["type"]).to eq("customer")

    expect(customer.first["attributes"]["id"]).to eq(@customer_2.id)
    expect(customer.first["attributes"]["first_name"]).to eq(@customer_2.first_name)
    expect(customer.first["attributes"]["last_name"]).to eq(@customer_2.last_name)

    get "/api/v1/customers/find_all?updated_at=#{@customer_3.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)['data']
    expect(customer.count).to eq(2)
    expect(customer.last["type"]).to eq("customer")

    expect(customer.last["attributes"]["id"]).to eq(@customer_3.id)
    expect(customer.last["attributes"]["first_name"]).to eq(@customer_3.first_name)
    expect(customer.last["attributes"]["last_name"]).to eq(@customer_3.last_name)
  end
end
