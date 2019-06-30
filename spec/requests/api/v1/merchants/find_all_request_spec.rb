require 'rails_helper'

describe 'Merchants Find All API' do
  before :each do
    @merchant_1 = create(:merchant, name: "Chuck Norris", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @merchant_2 = create(:merchant, name: "Mr. T", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @merchant_3 = create(:merchant, name: "Chuck Norris", created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
  end

  it 'finds a merchant by id' do

    get "/api/v1/merchants/find_all?id=#{@merchant_1.id}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(1)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_1.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_1.name)

    get "/api/v1/merchants/find_all?id=#{@merchant_2.id}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(1)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_2.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_2.name)

    get "/api/v1/merchants/find_all?id=#{@merchant_3.id}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(1)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_3.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_3.name)
  end

  it 'finds merchants by name' do

    get "/api/v1/merchants/find_all?name=#{@merchant_1.name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(2)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_1.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_1.name)

    get "/api/v1/merchants/find_all?name=#{@merchant_2.name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(1)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_2.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_2.name)

    get "/api/v1/merchants/find_all?name=#{@merchant_3.name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(2)
    expect(merchants.last["type"]).to eq("merchant")

    expect(merchants.last["attributes"]["id"]).to eq(@merchant_3.id)
    expect(merchants.last["attributes"]["name"]).to eq(@merchant_3.name)
  end

  it 'finds merchants by created_at' do

    get "/api/v1/merchants/find_all?created_at=#{@merchant_1.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(2)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_1.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_1.name)

    get "/api/v1/merchants/find_all?created_at=#{@merchant_2.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(2)
    expect(merchants.last["type"]).to eq("merchant")

    expect(merchants.last["attributes"]["id"]).to eq(@merchant_2.id)
    expect(merchants.last["attributes"]["name"]).to eq(@merchant_2.name)

    get "/api/v1/merchants/find_all?created_at=#{@merchant_3.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(1)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_3.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_3.name)
  end

  it 'finds merchants by updated_at' do

    get "/api/v1/merchants/find_all?updated_at=#{@merchant_1.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(1)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_1.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_1.name)

    get "/api/v1/merchants/find_all?updated_at=#{@merchant_2.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(2)
    expect(merchants.first["type"]).to eq("merchant")

    expect(merchants.first["attributes"]["id"]).to eq(@merchant_2.id)
    expect(merchants.first["attributes"]["name"]).to eq(@merchant_2.name)

    get "/api/v1/merchants/find_all?updated_at=#{@merchant_3.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)['data']
    expect(merchants.count).to eq(2)
    expect(merchants.last["type"]).to eq("merchant")

    expect(merchants.last["attributes"]["id"]).to eq(@merchant_3.id)
    expect(merchants.last["attributes"]["name"]).to eq(@merchant_3.name)
  end
end
