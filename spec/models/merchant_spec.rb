require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many :invoices }
  end

  describe 'class methods' do
    before :each do
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)
      @merchant_3 = create(:merchant)
      @customer_1 = create(:customer)
      @customer_2 = create(:customer)
      @item_1 = create(:item, unit_price: 100, merchant: @merchant_1)
      @item_2 = create(:item, unit_price: 1000, merchant: @merchant_2)
      @item_3 = create(:item, unit_price: 200, merchant: @merchant_3)
      @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1, updated_at: "2012-04-01 09:53:09 UTC")
      @invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: @invoice_1, item: @item_1)
      @transaction_1 = create(:transaction, invoice: @invoice_1)
      @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2, updated_at: "2012-04-01 09:54:09 UTC")
      @invoice_item_2 = create(:invoice_item, quantity: 20, unit_price: 1000, invoice: @invoice_2, item: @item_2)
      @transaction_2 = create(:transaction, invoice: @invoice_2)
      @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_2, updated_at: "2012-04-02 09:54:09 UTC")
      @invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: @invoice_3, item: @item_3)
      @transaction_3 = create(:transaction, invoice: @invoice_3)
    end

    it 'most_revenue' do
      expect(Merchant.most_revenue(1)).to eq([@merchant_2])
      expect(Merchant.most_revenue).to eq([@merchant_2, @merchant_3, @merchant_1])
    end

    it 'most_items' do
      expect(Merchant.most_items(1)).to eq([@merchant_1])
      expect(Merchant.most_items).to eq([@merchant_1, @merchant_3, @merchant_2])
    end

    it 'revenue' do
      expect(Merchant.revenue("2012-04-01")["total_revenue"]).to eq(23000)
      expect(Merchant.revenue("2012-04-02")["total_revenue"]).to eq(4200)

      merchant_4 = create(:merchant)
      customer_4 = create(:customer)
      item_4 = create(:item, unit_price: 100, merchant: merchant_4)
      invoice_4 = create(:invoice, merchant: merchant_4, customer: customer_4, updated_at: Date.today)
      invoice_item_4 = create(:invoice_item, quantity: 15, unit_price: 100, invoice: invoice_4, item: item_4)
      transaction_4 = create(:transaction, invoice: invoice_4)

      expect(Merchant.revenue["total_revenue"]).to eq(1500)
    end
  end

  describe 'instance methods' do
    before :each do
      @merchant = create(:merchant)
      @customer_1 = create(:customer)
      @customer_2 = create(:customer)
      @item_1 = create(:item, unit_price: 100, merchant: @merchant)
      @item_2 = create(:item, unit_price: 1000, merchant: @merchant)
      @item_3 = create(:item, unit_price: 200, merchant: @merchant)
      @invoice_1 = create(:invoice, merchant: @merchant, customer: @customer_1, updated_at: "2012-04-01 09:53:09 UTC")
      @invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: @invoice_1, item: @item_1)
      @transaction_1 = create(:transaction, invoice: @invoice_1)
      @invoice_2 = create(:invoice, merchant: @merchant, customer: @customer_2, updated_at: "2012-04-01 09:54:09 UTC")
      @invoice_item_2 = create(:invoice_item, quantity: 20, unit_price: 1000, invoice: @invoice_2, item: @item_2)
      @transaction_2 = create(:transaction, invoice: @invoice_2)
      @invoice_3 = create(:invoice, merchant: @merchant, customer: @customer_2, updated_at: "2012-04-02 09:54:09 UTC")
      @invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: @invoice_3, item: @item_3)
      @transaction_3 = create(:transaction, invoice: @invoice_3)
    end

    it 'revenue' do
      expect(@merchant.revenue("2012-04-01")["revenue"]).to eq(23000)
      expect(@merchant.revenue("2012-04-02")["revenue"]).to eq(4200)

      customer_4 = create(:customer)
      item_4 = create(:item, unit_price: 100, merchant: @merchant)
      invoice_4 = create(:invoice, merchant: @merchant, customer: customer_4, updated_at: Date.today)
      invoice_item_4 = create(:invoice_item, quantity: 15, unit_price: 100, invoice: invoice_4, item: item_4)
      transaction_4 = create(:transaction, invoice: invoice_4)

      expect(@merchant.revenue["revenue"]).to eq(28700)
    end

    it 'favorite_customer' do
      expect(@merchant.favorite_customer).to eq(@customer_2)

      invoice_4 = create(:invoice, merchant: @merchant, customer: @customer_1, updated_at: "2012-04-01 09:53:09 UTC")
      invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: invoice_4, item: @item_1)
      transaction_4 = create(:transaction, invoice: invoice_4)
      invoice_5 = create(:invoice, merchant: @merchant, customer: @customer_1, updated_at: "2012-04-01 09:53:09 UTC")
      invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: invoice_5, item: @item_1)
      transaction_5 = create(:transaction, invoice: invoice_5)

      expect(@merchant.favorite_customer).to eq(@customer_1)

      invoice_6 = create(:invoice, merchant: @merchant, customer: @customer_2, updated_at: "2012-04-02 09:54:09 UTC")
      invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: invoice_6, item: @item_3)
      transaction_6 = create(:transaction, invoice: invoice_6, result: "failed")
      invoice_7 = create(:invoice, merchant: @merchant, customer: @customer_2, updated_at: "2012-04-02 09:54:09 UTC")
      invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: invoice_7, item: @item_3)
      transaction_7 = create(:transaction, invoice: invoice_7, result: "failed")

      expect(@merchant.favorite_customer).to eq(@customer_1)
    end
  end
end
