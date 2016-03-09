class ContactMailer < ActionMailer::Base

  def contact_us(email, name, message)
    recipients    "info@refertoquran.com"
    from          email
    subject       "Someone Has Contacted on RTQ"
    body          name: name, message: message, email: email
  end

end
