json.charge_response @charge_response if @charge_response.present?
json.transfer_response @transfer_response if @transfer_response.present?
json.other_history @other_history if @other_history.present?
json.wallet_history @wallet_history if @wallet_history.present?
json.paypal_payment_response @paypal_payment_response if @paypal_payment_response.present?