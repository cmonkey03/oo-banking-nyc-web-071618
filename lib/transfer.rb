'require pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && @sender.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"

    elsif @status == 'pending' && !@sender.valid?
      "Transaction rejected. Please check your account balance."
    else
      nil
    end
  end







end
