require 'rails_helper'

describe 'Items Find API' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @item_1 = create(:item, name: "Chuck Norris", description: "Insert Joke Here", unit_price: 1001, merchant: @merchant_1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @item_2 = create(:item, name: "Mr. T", description: "I pity the fool!", unit_price: 1002, merchant: @merchant_2, created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @item_3 = create(:item, name: "The Governator", description: "Get to the choppah!", unit_price: 1003, merchant: @merchant_3, created_at: "2012-03-29T14:54:05.000Z", updated_at: "2012-03-29T14:54:05.000Z")
  end

  it 'finds a item by id' do

    get "/api/v1/items/find?id=#{@item_1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?id=#{@item_2.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?id=#{@item_3.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds a item by name' do

    get "/api/v1/items/find?name=#{@item_1.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?name=#{@item_2.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?name=#{@item_3.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds a item by description' do

    get "/api/v1/items/find?description=#{@item_1.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?description=#{@item_2.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?description=#{@item_3.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds a item by unit_price' do

    get "/api/v1/items/find?unit_price=#{@item_1.unit_price}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?unit_price=#{@item_2.unit_price}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?unit_price=#{@item_3.unit_price}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds a item by merchant_id' do

    get "/api/v1/items/find?merchant_id=#{@item_1.merchant_id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?merchant_id=#{@item_2.merchant_id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?merchant_id=#{@item_3.merchant_id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds a item by created_at' do

    get "/api/v1/items/find?created_at=#{@item_1.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?created_at=#{@item_2.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?created_at=#{@item_3.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds a item by updated_at' do

    get "/api/v1/items/find?updated_at=#{@item_1.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_1.id)
    expect(item["attributes"]["name"]).to eq(@item_1.name)
    expect(item["attributes"]["description"]).to eq(@item_1.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find?updated_at=#{@item_2.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find?updated_at=#{@item_3.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)['data']
    expect(item["type"]).to eq("item")

    expect(item["attributes"]["id"]).to eq(@item_3.id)
    expect(item["attributes"]["name"]).to eq(@item_3.name)
    expect(item["attributes"]["description"]).to eq(@item_3.description)
    expect(item["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(item["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end
end
