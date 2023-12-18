# frozen_string_literal: true

class CustomerService
  FIRST_DEFAULT_PAYMENT_DAY = 14.freeze
  SECOND_DEFAULT_PAYMENT_DAY = 28.freeze

  def initialize(customer)
    @customer = customer
  end

  def get_due_date(purchase_date)
    @purchase_date = purchase_date

    if customer.first_payment_delay.present?
      prefixed_due_date
    else
      not_prefixed_due_date
    end
  end

  private

  attr_reader :customer, :purchase_date

  def prefixed_due_date
    limit_date = purchase_date + customer.first_payment_delay.days

    due_date = limit_date.change(day: customer.payment_day)

    if due_date < limit_date
      due_date + 1.month
    else
      due_date
    end
  end

  def not_prefixed_due_date
    due_date = purchase_date + 30.days

    if due_date.day <= FIRST_DEFAULT_PAYMENT_DAY
      due_date.change(day: FIRST_DEFAULT_PAYMENT_DAY)
    elsif due_date.day > SECOND_DEFAULT_PAYMENT_DAY
      due_date.change(day: FIRST_DEFAULT_PAYMENT_DAY) + 1.month
    else
      due_date.change(day: SECOND_DEFAULT_PAYMENT_DAY)
    end
  end
end
