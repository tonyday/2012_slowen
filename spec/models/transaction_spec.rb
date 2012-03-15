require 'spec_helper'

describe Transaction do

  before do
    @transaction = Transaction.new(date: Date.today,
                                   amount: 123.45,
                                   payee: 'Countdown',
                                   fit_id: '0987654321',
                                   account: Factory(:account))
  end

  subject { @transaction }

  it { should respond_to(:date) }
  it { should respond_to(:amount) }
  it { should respond_to(:payee) }
  it { should respond_to(:fit_id) }
  it { should respond_to(:account) }

  it {should be_valid}

  describe 'when date is not present' do
    before { @transaction.date = ' ' }
    it { should_not be_valid }
  end

  describe 'when amount is not present' do
    before { @transaction.amount = ' ' }
    it { should_not be_valid }
  end

  describe 'when payee is not present' do
    before { @transaction.payee = ' ' }
    it { should_not be_valid }
  end

  describe 'when fit_id is not present' do
    before { @transaction.fit_id = ' ' }
    it { should_not be_valid }
  end

  describe 'when account is not present' do
    before { @transaction.account = nil }
    it { should_not be_valid }
  end

  describe 'when fit_id is already taken' do
    before do
      transaction_with_same_fit_id = @transaction.dup
      transaction_with_same_fit_id.save
    end
    it { should_not be_valid }
  end

end
