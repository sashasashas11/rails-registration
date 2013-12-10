class Mailer < Devise::Mailer

	SENDER = "testa5603@gmail.com"

	def send_email(recipient)
		@sender = SENDER
		mail(:to => recipient,
		     :from => @sender,
		     :subject => "Password resets")
	end
end