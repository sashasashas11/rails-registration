require 'spec_helper'

def login_user
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = User.create(:email => 'admin@gmail.com', :first_name => 'Bob', :last_name => 'Marley', password: '12345678')
    sign_in user
  end
end

describe TransactionsController do
  login_user

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #index' do
    it 'loads all of the transactions into @transactions' do
      get :index
      acc1 = Account.create(name: 'Ben')
      acc2 = Account.create(name: 'Joe')
      t1 = Transaction.create(debit_account: acc1, credit_account: acc2, amount: 10.0)
      t2 = Transaction.create(debit_account: acc1, credit_account: acc2, amount: 20.0)
      t3 = Transaction.create(debit_account: acc2, credit_account: acc1, amount: 30.0)

      expect(assigns(:transactions)).to match_array([t1, t2, t3])
    end
  end

  describe 'GET #index' do
    it 'loads all of the accounts into @accounts' do
      acc1, acc2 = Account.create!, Account.create!
      get :index

      expect(assigns(:accounts)).to match_array([acc1, acc2])
    end
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      acc1, acc2 = Account.create!, Account.create!
      transaction = Transaction.create(debit_account: acc1, credit_account: acc2, amount: 10.0)
      get :show, id: transaction.id

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    it 'displays current transaction value' do
      acc1, acc2 = Account.create!(name:'joe'), Account.create!(name:'bill')
      transaction = Transaction.create(debit_account: acc1, credit_account: acc2, amount: 10.0)
      get :edit, id: transaction.id
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    it 'create new transaction' do
      acc1, acc2 = Account.create!, Account.create!
      attr = {debit: acc1, credit: acc2, :amount => 12.0 }
      post :create, transaction: attr
      expect(Transaction.all.size).to eq(1)
      expect(Transaction.first.debit_account).to eq(acc1)
      expect(Transaction.first.credit_account).to eq(acc2)
      expect(Transaction.first.amount).to eq(12.0)
    end
  end

  describe 'GET #update' do
    it 'responds successfully with an HTTP 200 status code' do
      acc1, acc2 = Account.create!, Account.create!
      transaction = Transaction.create(debit_account: acc1, credit_account: acc2, amount: 10.0)
      attr = { :amount => 12.0 }
      put :update, id:transaction.id, transaction: attr

      expect(Transaction.first.amount).to eq(12.0)
    end
  end

  describe "GET #destroy" do
    it 'responds successfully with an HTTP 200 status code' do
      acc1, acc2 = Account.create!, Account.create!
      transaction = Transaction.create(debit_account: acc1, credit_account: acc2, amount: 10.0)
      delete :index, {id: transaction.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end