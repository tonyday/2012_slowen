require 'spec_helper'

describe Account do

  before do
    @account = Account.new(name: 'Example Account',
                           number: '1234567890',
                           ofx_type: 'BankAccount')
  end

  subject { @account }

  it { should respond_to(:name) }
  it { should respond_to(:number) }
  it { should respond_to(:ofx_type) }

  it { should be_valid }

  describe 'when number is not present' do
    before { @account.number = ' ' }
    it { should_not be_valid }
  end

  describe 'when type is not present' do
    before { @account.ofx_type = ' ' }
    it { should_not be_valid }
  end

  describe 'when number is already taken' do
    before do
      account_with_same_number = @account.dup
      account_with_same_number.number = @account.number.upcase
      account_with_same_number.save
    end
    it { should_not be_valid }
  end

end
