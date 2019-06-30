require 'rails_helper'

describe 'Invoice Items Find All API' do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @item_1 = create(:item, merchant: @merchant_1)
    @item_2 = create(:item, merchant: @merchant_2)
    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2)
    @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, quantity: 101, unit_price: 1001, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_1, quantity: 102, unit_price: 1001, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
    @invoice_item_3 = create(:invoice_item, item: @item_1, invoice: @invoice_2, quantity: 102, unit_price: 1002, created_at: "2012-03-28T14:54:05.000Z", updated_at: "2012-03-28T14:54:05.000Z")
  end

  it 'finds an invoice_item by id' do

    get "/api/v1/invoice_items/find_all?id=#{@invoice_item_1.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?id=#{@invoice_item_2.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?id=#{@invoice_item_3.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds invoice_items by item_id' do

    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_1.item_id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_2.item_id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_3.item_id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.last["type"]).to eq("invoice_item")

    expect(invoice_item.last["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.last["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.last["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.last["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.last["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds invoice_items by invoice_id' do

    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item_1.invoice_id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item_2.invoice_id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.last["type"]).to eq("invoice_item")

    expect(invoice_item.last["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.last["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.last["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.last["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.last["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item_3.invoice_id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds invoice_items by quantity' do

    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_1.quantity}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_2.quantity}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_3.quantity}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.last["type"]).to eq("invoice_item")

    expect(invoice_item.last["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.last["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.last["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.last["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.last["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds invoice_items by unit_price' do

    get "/api/v1/invoice_items/find_all?unit_price=#{'%.2f' % @invoice_item_1.unit_price.fdiv(100)}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?unit_price=#{'%.2f' % @invoice_item_2.unit_price.fdiv(100)}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.last["type"]).to eq("invoice_item")

    expect(invoice_item.last["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.last["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.last["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.last["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.last["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?unit_price=#{'%.2f' % @invoice_item_3.unit_price.fdiv(100)}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds invoice_items by created_at' do

    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_1.created_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_2.created_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.last["type"]).to eq("invoice_item")

    expect(invoice_item.last["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.last["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.last["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.last["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.last["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_3.created_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end

  it 'finds invoice_items by updated_at' do

    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_1.updated_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_1.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_1.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_1.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_1.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_2.updated_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.first["type"]).to eq("invoice_item")

    expect(invoice_item.first["attributes"]["id"]).to eq(@invoice_item_2.id)
    expect(invoice_item.first["attributes"]["item_id"]).to eq(@invoice_item_2.item_id)
    expect(invoice_item.first["attributes"]["invoice_id"]).to eq(@invoice_item_2.invoice_id)
    expect(invoice_item.first["attributes"]["quantity"]).to eq(@invoice_item_2.quantity)
    expect(invoice_item.first["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_2.unit_price.fdiv(100))

    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_3.updated_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)['data']
    expect(invoice_item.count).to eq(2)
    expect(invoice_item.last["type"]).to eq("invoice_item")

    expect(invoice_item.last["attributes"]["id"]).to eq(@invoice_item_3.id)
    expect(invoice_item.last["attributes"]["item_id"]).to eq(@invoice_item_3.item_id)
    expect(invoice_item.last["attributes"]["invoice_id"]).to eq(@invoice_item_3.invoice_id)
    expect(invoice_item.last["attributes"]["quantity"]).to eq(@invoice_item_3.quantity)
    expect(invoice_item.last["attributes"]["unit_price"]).to eq('%.2f' % @invoice_item_3.unit_price.fdiv(100))
  end
end
