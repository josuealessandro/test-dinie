class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @selected_date = Date.today
    @customer_options = @customers.map { |customer| [customer.customer_name, customer.id] }
    @selected_customer_id = params[:selected_customer_id]
    render 'index'
  end

  def calculate_due_date
    customer = Customer.find(params[:selected_customer_id])
    purchase_date = Date.parse(params[:selected_date])

    service = CustomerService.new(customer)
    @due_date = service.get_due_date(purchase_date)
    render 'calculate_due_date'
  end
end
