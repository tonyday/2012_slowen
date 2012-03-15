class Account < ActiveRecord::Base
  attr_accessible :name, :number, :ofx_type

  validates :number, presence: true, uniqueness: { case_sensitive: false }
  validates :ofx_type, presence: true
end
