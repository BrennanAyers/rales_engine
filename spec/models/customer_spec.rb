require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :invoices }
  end

  describe 'instance methods' do
    before :each do
      @customer = create(:customer)
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)
      @item_1 = create(:item, unit_price: 100, merchant: @merchant_1)
      @item_2 = create(:item, unit_price: 1000, merchant: @merchant_2)
      @item_3 = create(:item, unit_price: 200, merchant: @merchant_2)
      @invoice_1 = create(:invoice, customer: @customer, merchant: @merchant_1, updated_at: "2012-04-01 09:53:09 UTC")
      @invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: @invoice_1, item: @item_1)
      @transaction_1 = create(:transaction, invoice: @invoice_1)
      @invoice_2 = create(:invoice, customer: @customer, merchant: @merchant_2, updated_at: "2012-04-01 09:54:09 UTC")
      @invoice_item_2 = create(:invoice_item, quantity: 20, unit_price: 1000, invoice: @invoice_2, item: @item_2)
      @transaction_2 = create(:transaction, invoice: @invoice_2)
      @invoice_3 = create(:invoice, customer: @customer, merchant: @merchant_2, updated_at: "2012-04-02 09:54:09 UTC")
      @invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: @invoice_3, item: @item_3)
      @transaction_3 = create(:transaction, invoice: @invoice_3)
    end

    it 'favorite_merchant' do
      expect(@customer.favorite_merchant).to eq(@merchant_2)

      invoice_4 = create(:invoice, customer: @customer, merchant: @merchant_1, updated_at: "2012-04-01 09:53:09 UTC")
      invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: invoice_4, item: @item_1)
      transaction_4 = create(:transaction, invoice: invoice_4)
      invoice_5 = create(:invoice, customer: @customer, merchant: @merchant_1, updated_at: "2012-04-01 09:53:09 UTC")
      invoice_item_1 = create(:invoice_item, quantity: 30, unit_price: 100, invoice: invoice_5, item: @item_1)
      transaction_5 = create(:transaction, invoice: invoice_5)

      expect(@customer.favorite_merchant).to eq(@merchant_1)

      invoice_6 = create(:invoice, customer: @customer, merchant: @merchant_2, updated_at: "2012-04-02 09:54:09 UTC")
      invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: invoice_6, item: @item_3)
      transaction_6 = create(:transaction, invoice: invoice_6, result: "failed")
      invoice_7 = create(:invoice, customer: @customer, merchant: @merchant_2, updated_at: "2012-04-02 09:54:09 UTC")
      invoice_item_3 = create(:invoice_item, quantity: 21, unit_price: 200, invoice: invoice_7, item: @item_3)
      transaction_7 = create(:transaction, invoice: invoice_7, result: "failed")

      expect(@customer.favorite_merchant).to eq(@merchant_1)
    end
  end
end
