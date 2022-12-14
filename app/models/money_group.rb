class MoneyGroup < ApplicationRecord
  belongs_to :group
  belongs_to :operation

  after_create :increment_amount
  before_destroy :decrement_amount

  private

  def increment_amount
    current_amount = group.total_amount
    group.update(total_amount: current_amount + operation.amount)
  end

  def decrement_amount
    subtracted_amount = group.total_amount - operation.amount
    group.update(total_amount: subtracted_amount)
  end
end
