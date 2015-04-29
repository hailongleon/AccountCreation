up = {}
up[:name] = 'Leon'
up[:email] = 'leon.test3@mail.com'
up[:password] = 'leon.test3@mail.com'
up[:password_confirmation] = 'leon.test3@mail.com'

u = User.new(up)
u.save

params = {}
params = ActiveSupport::HashWithIndifferentAccess.new(params)

params[:name] = 'TestAccount_3'
# Talarius group id is 86
params[:group] = Group.find 86
params[:account_type] = 'standard'
params[:locale] = 'en-GB'
params[:timezone] = 'London'

# Assuming the payer id is 1982
params[:payer] = Payer.find 1982

params[:email] = 'leon.test3@mail.com'
params[:public_email] = 'leon.test3@mail.com'

params[:users] = User.where(id: u.id)

initial_sms_credits = 0
admin_user_id = 1982
	
	
a= Account.new(params.reverse_merge(sms_credit_price_ex_tax: '0.075', pays_subscription: true, setup_invoice: true))
a.save
