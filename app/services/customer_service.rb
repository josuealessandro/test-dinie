class CustomerService
  def initialize(customer)
    @customer = customer
  end

  def get_due_date(purchase_date)
    @purchase_date = purchase_date

    if @customer.first_payment_delay != nil
      prefixed_due_date
    else
      not_prefixed_due_date
    end
  end

  def prefixed_due_date
    due_date = @purchase_date + @customer.first_payment_delay.days

    if due_date.day <= @customer.payment_day
      return Date.new(due_date.year,due_date.month,@customer.payment_day)
    end

    if due_date.month == 12
      Date.new(due_date.year+1,1,@customer.payment_day)
    else
      Date.new(due_date.year,due_date.month+1,@customer.payment_day)
    end
  end

  def not_prefixed_due_date
    due_date = @purchase_date + 30.days
    if due_date.day <= 14
      Date.new(due_date.year,due_date.month,14)
    elsif due_date.day > 14 && due_date.day <= 28
      Date.new(due_date.year,due_date.month,28)
    else
      Date.new(due_date.year,due_date.month+1,14)
    end
  end
end