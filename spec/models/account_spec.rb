require 'spec_helper'

describe Account do

  describe 'calculations on' do
    before :each do
      @acc1 = Account.create(name: 'Ben')
      @acc2 = Account.create(name: 'Joe')
      Transaction.create(debit_account: @acc1, credit_account: @acc2, amount: 10.0, created_at: '2013-12-18 10:54:23')
      Transaction.create(debit_account: @acc1, credit_account: @acc2, amount: 20.0, created_at: '2013-12-18 11:54:23')
      Transaction.create(debit_account: @acc1, credit_account: @acc2, amount: 30.0, created_at: '2013-12-18 12:54:23')
      Transaction.create(debit_account: @acc2, credit_account: @acc1, amount: 40.0, created_at: '2013-12-18 13:54:23')
      Transaction.create(debit_account: @acc2, credit_account: @acc1, amount: 50.0, created_at: '2013-12-18 14:54:23')
      Transaction.create(debit_account: @acc2, credit_account: @acc1, amount: 60.0, created_at: '2012-12-18 15:54:23')
    end
    it 'Debit' do
      expect(@acc1.debitSum).to eq(10+20+30)
    end
    it 'Credit' do
      expect(@acc1.creditSum).to eq(40+50+60)
    end
    it 'Balance' do
      expect(@acc1.balance).to eq(10+20+30-40-50-60)
    end
    it 'First Credit time' do
      expect(@acc1.firstCredit).to eq(60)
    end
  end


end
