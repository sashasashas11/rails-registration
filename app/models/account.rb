class Account < ActiveRecord::Base
  #validates_presence_of :name
	has_many :debitTransactions, class_name: 'Transaction', foreign_key: 'debit'
	has_many :creditTransactions, class_name: 'Transaction', foreign_key: 'credit'

  def debitSum
    debitTransactions.map(&:amount).sum
  end

  def creditSum
    creditTransactions.map(&:amount).sum
  end

  def balance
    debitSum - creditSum
  end

  def firstCredit
    creditTransactions.order(:created_at).first.amount
  end
end
