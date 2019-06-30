require 'rails_helper'

describe 'Items Find All API' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @item_1 = create(:item, name: "Chuck Norris", description: "Insert Joke Here", unit_price: 1001, merchant: @merchant_1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @item_2 = create(:item, name: "Mr. T", description: "Get to the choppah!", unit_price: 1001, merchant: @merchant_2, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @item_3 = create(:item, name: "Chuck Norris", description: "Get to the choppah!", unit_price: 1003, merchant: @merchant_2, created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
  end

  it 'finds an item by id' do

    get "/api/v1/items/find_all?id=#{@item_1.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?id=#{@item_2.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_2.id)
    expect(items.first["attributes"]["name"]).to eq(@item_2.name)
    expect(items.first["attributes"]["description"]).to eq(@item_2.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?id=#{@item_3.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_3.id)
    expect(items.first["attributes"]["name"]).to eq(@item_3.name)
    expect(items.first["attributes"]["description"]).to eq(@item_3.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds items by name' do

    get "/api/v1/items/find_all?name=#{@item_1.name}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?name=#{@item_2.name}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_2.id)
    expect(items.first["attributes"]["name"]).to eq(@item_2.name)
    expect(items.first["attributes"]["description"]).to eq(@item_2.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?name=#{@item_3.name}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.last["type"]).to eq("item")

    expect(items.last["attributes"]["id"]).to eq(@item_3.id)
    expect(items.last["attributes"]["name"]).to eq(@item_3.name)
    expect(items.last["attributes"]["description"]).to eq(@item_3.description)
    expect(items.last["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.last["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds items by description' do

    get "/api/v1/items/find_all?description=#{@item_1.description}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?description=#{@item_2.description}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.first.count).to eq(2)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_2.id)
    expect(items.first["attributes"]["name"]).to eq(@item_2.name)
    expect(items.first["attributes"]["description"]).to eq(@item_2.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?description=#{@item_3.description}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq()
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_3.id)
    expect(items.first["attributes"]["name"]).to eq(@item_3.name)
    expect(items.first["attributes"]["description"]).to eq(@item_3.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds items by unit_price' do

    get "/api/v1/items/find_all?unit_price=#{'%.2f' % @item_1.unit_price.fdiv(100)}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?unit_price=#{'%.2f' % @item_2.unit_price.fdiv(100)}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.last["type"]).to eq("item")

    expect(items.last["attributes"]["id"]).to eq(@item_2.id)
    expect(items.last["attributes"]["name"]).to eq(@item_2.name)
    expect(items.last["attributes"]["description"]).to eq(@item_2.description)
    expect(items.last["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.last["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?unit_price=#{'%.2f' % @item_3.unit_price.fdiv(100)}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_3.id)
    expect(items.first["attributes"]["name"]).to eq(@item_3.name)
    expect(items.first["attributes"]["description"]).to eq(@item_3.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds items by merchant_id' do

    get "/api/v1/items/find_all?merchant_id=#{@item_1.merchant_id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.first.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?merchant_id=#{@item_2.merchant_id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_2.id)
    expect(items.first["attributes"]["name"]).to eq(@item_2.name)
    expect(items.first["attributes"]["description"]).to eq(@item_2.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?merchant_id=#{@item_3.merchant_id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.last["type"]).to eq("item")

    expect(items.last["attributes"]["id"]).to eq(@item_3.id)
    expect(items.last["attributes"]["name"]).to eq(@item_3.name)
    expect(items.last["attributes"]["description"]).to eq(@item_3.description)
    expect(items.last["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.last["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds items by created_at' do

    get "/api/v1/items/find_all?created_at=#{@item_1.created_at}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?created_at=#{@item_2.created_at}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.last["type"]).to eq("item")

    expect(items.last["attributes"]["id"]).to eq(@item_2.id)
    expect(items.last["attributes"]["name"]).to eq(@item_2.name)
    expect(items.last["attributes"]["description"]).to eq(@item_2.description)
    expect(items.last["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.last["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?created_at=#{@item_3.created_at}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_3.id)
    expect(items.first["attributes"]["name"]).to eq(@item_3.name)
    expect(items.first["attributes"]["description"]).to eq(@item_3.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end

  it 'finds items by updated_at' do

    get "/api/v1/items/find_all?updated_at=#{@item_1.updated_at}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(1)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_1.id)
    expect(items.first["attributes"]["name"]).to eq(@item_1.name)
    expect(items.first["attributes"]["description"]).to eq(@item_1.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_1.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_1.unit_price.fdiv(100))

    get "/api/v1/items/find_all?updated_at=#{@item_2.updated_at}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.first.count).to eq(2)
    expect(items.first["type"]).to eq("item")

    expect(items.first["attributes"]["id"]).to eq(@item_2.id)
    expect(items.first["attributes"]["name"]).to eq(@item_2.name)
    expect(items.first["attributes"]["description"]).to eq(@item_2.description)
    expect(items.first["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
    expect(items.first["attributes"]["unit_price"]).to eq('%.2f' % @item_2.unit_price.fdiv(100))

    get "/api/v1/items/find_all?updated_at=#{@item_3.updated_at}"

    expect(response).to be_successful

    items = JSON.parse(response.body)['data']
    expect(items.count).to eq(2)
    expect(items.last["type"]).to eq("item")

    expect(items.last["attributes"]["id"]).to eq(@item_3.id)
    expect(items.last["attributes"]["name"]).to eq(@item_3.name)
    expect(items.last["attributes"]["description"]).to eq(@item_3.description)
    expect(items.last["attributes"]["merchant_id"]).to eq(@item_3.merchant_id)
    expect(items.last["attributes"]["unit_price"]).to eq('%.2f' % @item_3.unit_price.fdiv(100))
  end
end
