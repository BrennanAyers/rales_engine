require 'rails_helper'

describe 'Invoice Items Find API' do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @item_1 = create(:item, merchant: @merchant_1)
    @item_2 = create(:item, merchant: @merchant_2)
    @item_3 = create(:item, merchant: @merchant_3)
    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2)
    @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_3)
    @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, quantity: 101, unit_price: 1001, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_2, quantity: 102, unit_price: 1002, created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @invoice_item_3 = create(:invoice_item, item: @item_3, invoice: @invoice_3, quantity: 103, unit_price: 1003, created_at: "2012-03-29T14:54:05.000Z", updated_at: "2012-03-29T14:54:05.000Z")
  end

  it 'finds a invoice_item by id' do

    get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?id=#{@invoice_item_2.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?id=#{@invoice_item_3.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds a invoice_item by item_id' do

    get "/api/v1/invoice_items/find?item_id=#{@invoice_item_1.item_id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?item_id=#{@invoice_item_2.item_id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?item_id=#{@invoice_item_3.item_id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds a invoice_item by invoice_id' do

    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_1.invoice_id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_2.invoice_id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_3.invoice_id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds a invoice_item by quantity' do

    get "/api/v1/invoice_items/find?quantity=#{@invoice_item_1.quantity}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?quantity=#{@invoice_item_2.quantity}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?quantity=#{@invoice_item_3.quantity}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds a invoice_item by unit_price' do

    get "/api/v1/invoice_items/find?unit_price=#{'%.2f' % @invoice_item_1.unit_price.fdiv(100)}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?unit_price=#{'%.2f' % @invoice_item_2.unit_price.fdiv(100)}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice2item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?unit_price=#{'%.2f' % @invoice_item_3.unit_price.fdiv(100)}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_it3m_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds a invoice_item by created_at' do

    get "/api/v1/invoice_items/find?created_at=#{@invoice_item_1.created_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?created_at=#{@invoice_item_2.created_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?created_at=#{@invoice_item_3.created_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds a invoice_item by updated_at' do

    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_1.updated_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_2.updated_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_3.updated_at}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)['data']
    expect(invoice_item["type"]).to eq("invoice_item")

    expect(invoice_item["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end
end
