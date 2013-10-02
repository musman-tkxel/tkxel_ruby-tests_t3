class Payment < ActiveRecord::Base

  def self.with line_item_id, service_id
    Payment.transaction do
      Payment.find_each do |payment|
        if payment[:service_id].to_i == service_id.to_i
          if payment[:line_item_id].to_i == line_item_id.to_i
            return payment
          end
        end
      end
    end
  end

  def self.update_transaction mypayment
    Payment.transaction do
      payment = Payment.with(mypayment[:line_item_id], mypayment[:service_id])
      if payment
        payment.amount = mypayment[:amount]
        if payment.save
          true
        end
      else
        false
      end
    end
  end

end




