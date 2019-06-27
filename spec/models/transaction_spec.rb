require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'relationships' do
    it { should belong_to :invoice}
  end

  describe 'scopes' do
    before :each do
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)
      @merchant_3 = create(:merchant)
      @customer_1 = create(:customer)
      @customer_2 = create(:customer)
      @item_1 = create(:item, unit_price: 100, merchant: @merchant_1)
      @item_2 = create(:item, unit_price: 1000, merchant: @merchant_2)
      @item_3 = create(:item, unit_price: 200, merchant: @merchant_3)
      @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1)
      @invoice_item_1 = create(:invoice_item, quantity: 3, unit_price: 100, invoice: @invoice_1, item: @item_1)
      @transaction_1 = create(:transaction, invoice: @invoice_1)
      @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2)
      @invoice_item_2 = create(:invoice_item, quantity: 2, unit_price: 1000, invoice: @invoice_2, item: @item_2)
      @transaction_2 = create(:transaction, invoice: @invoice_2)
      @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_2)
      @invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: 200, invoice: @invoice_3, item: @item_3)
      @transaction_3 = create(:transaction, invoice: @invoice_3, result: "failed")
    end

    it 'successful' do
      expect(Transaction.successful).to eq([@transaction_1, @transaction_2])
    end
  end
end
