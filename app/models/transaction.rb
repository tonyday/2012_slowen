class Transaction < ActiveRecord::Base

  belongs_to :account

  attr_accessible :date, :amount, :payee, :fit_id, :account_id, :account

  validates :date, presence: true
  validates :amount, presence: true
  validates :payee, presence: true
  validates :fit_id, presence: true, uniqueness: true
  validates :account, presence: true

end
