class OrderMailer < ActionMailer::Base
  default from: "chris@airbnb.com"

  # the brackets with 'order' will decide in which order we want to send the mail
  # the order without the @ sign is only available within the def
  def new_order_notification(order)

  	# make the order available to the view html
  	# this is basically saying create the @order variable that the view can use and it is the same as order
  	@order = order
  	@room = @order.room
  	@user = @order.user
  	@owner = @room.user

  	# emailing the person who owns the room
  	mail to: @owner.email, subject "You've got mail!", cc: "team@airnbn.com"

  end







end
