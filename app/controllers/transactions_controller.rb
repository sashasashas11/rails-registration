class TransactionsController < ApplicationController
  before_action :get_transaction, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @transactions = Transaction.all
    @transaction = Transaction.new
    @accounts = Account.all
    respond_to do |format|
      format.html
      format.csv {send_data @transactions.to_csv}
    end
  end

  def show
  end

  def new
    @transaction = Transaction.new
    @accounts = Account.all
  end

  def edit
    @accounts = Account.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    def transaction_params
      params.require(:transaction ).permit([:debit, :credit, :amount])
    end

    ## Use callbacks to share common setup or constraints between actions.
    def get_transaction
      @transaction = Transaction.find(params[:id])
    end
end
