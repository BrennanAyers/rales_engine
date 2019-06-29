require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant}
    it { should have_many :invoices}
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
      expect(Item.most_revenue(1)).to eq([@item_2])
      expect(Item.most_revenue).to eq([@item_2, @item_3, @item_1])
    end
  end
end
