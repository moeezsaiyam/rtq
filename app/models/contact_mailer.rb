class ContactMailer < ActionMailer::Base

  def contact_us(email, name, message)
    recipients    "info@refertoquran.com"
    from          email
    subject       "Refer to Quran"
    body          name: name, message: message
  end

end
