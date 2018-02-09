
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && receiver.valid?
  end

  def execute_transaction
    # transaction subtracts the amount from the sender balance and adds to the receiver balance.
    # status of the transaction changes to "complete"
    #transfer cannot happen if
    # 1. it already happened (status is complete)
    # 2. the sender does not have a valid account
    if @status == "pending" && sender.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else sender.valid? == false
      "Transaction rejected. Please check your account balance."
    end
  end

end
