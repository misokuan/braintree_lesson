class PaymentController < ApplicationController

  def index
  	@client_token = Braintree::ClientToken.generate
  end

  def checkout
    nonce_from_the_client = params[:payment_method_nonce]
    # Use payment method nonce here...
    result = Braintree::Transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )

	if result.success?
	  flash[:notice] = "success!: #{result.transaction.id}"
	elsif result.transaction
	  flash[:notice] = "Error processing transaction:"
	  puts "  code: #{result.transaction.processor_response_code}"
	  puts "  text: #{result.transaction.processor_response_text}"
	else
	  flash[:notice] = result.errors
	end
  end
  
end
