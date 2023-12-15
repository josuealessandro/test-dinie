require 'rails_helper'

RSpec.describe CustomerService do
  let(:customer) do
    Customer.create(customer_name: 'Customer Tests', first_payment_delay: 10, payment_day: 12)
  end

  subject { described_class.new(customer) }

  describe '#get_due_date' do
    context 'when first_payment_delay is not nil' do
      it 'returns the prefixed due date within the same month' do
        purchase_date = Date.new(2023, 1, 2)
        due_date = subject.get_due_date(purchase_date)
        expected_due_date = Date.new(2023, 1, 12)

        expect(due_date).to eq(expected_due_date)
      end

      it 'returns the prefixed due date crossing to the next month' do
        purchase_date = Date.new(2023, 1, 3)
        due_date = subject.get_due_date(purchase_date)
        expected_due_date = Date.new(2023, 2, 12)

        expect(due_date).to eq(expected_due_date)
      end

      it 'returns the prefixed due date crossing to the next year' do
        purchase_date = Date.new(2023, 12, 3)
        due_date = subject.get_due_date(purchase_date)
        expected_due_date = Date.new(2024, 1, 12)

        expect(due_date).to eq(expected_due_date)
      end
    end

    context 'when first_payment_delay is nil' do
      before { customer.update(first_payment_delay: nil, payment_day: nil) }

      it 'returns the not prefixed due date crossing to the next month' do
        purchase_date = Date.new(2023, 1, 14)
        due_date = subject.get_due_date(purchase_date)
        expected_due_date = Date.new(2023, 2, 14)

        expect(due_date).to eq(expected_due_date)
      end

      it 'returns the not prefixed due date crossing to the next year' do
        purchase_date = Date.new(2023, 12, 10)
        due_date = subject.get_due_date(purchase_date)
        expected_due_date = Date.new(2024, 1, 14)

        expect(due_date).to eq(expected_due_date)
      end
    end
  end
end
