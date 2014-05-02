class OrdersController < ApplicationController

	# I want to be logged in for ANY area of the orders section

	# we added this action in the applications controller as a check that someone is logged in
	before_action :make_sure_logged_in

def new

	# place a new order form
	@room = Room.find(params[:room_id])
	@order = @room.orders.new

	# to add the current user to the order
	# the @order has a user and so we use the current_user that we created in the applications controller
	@order.user = current_user

	# we can also prefill information
	# starting.at would be a column in the model and we would put in the Time.now which is a rails command but we could use the users name via current_user.name
	# @order.starting_at = Time.now

end	

def create

	# this is actually charging the customer i.e. creating the payment and the order
	@room = Room.find(params[:room_id])
	@order = @room.orders.new(order_params)

	@order.user = current_user

	if @order.save

		# charge them with stripe
		# we are using the stripe gem
		# we could also change the currency in the same way we have set the price per room
		Stripe::Charge.create(amount: @room.price_in_pence, currency: "gbp", card: @order.stripe_token, description: "Air order")

		# Stripe::Customer.create(card: @order.stripe_token, plan: "silver", description: "Onboard subscription")
		# could have a destroy order in the controller to allow a customer to cancel a subscription

		# once we charge them we need to send the new order mails
		# this @order is refering to the order that we defined in the order_mailer
		OrderMailer.new_order_notification(@order).deliver


		flash[:success] = "Woohoo - you've ordered a room!"

		redirect_to room_path(@room)
	else


		flash[:error] = "Woops - something went wrong. You haven't been charged."
		render "new"
		
	end


end	


def order_params

	# these are to ensure we can't hack the orders or payments i.e. we are whitelisting the form data
	params.require(:order).permit(:stripe_token)
end	

end
