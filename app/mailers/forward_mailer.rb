class ForwardMailer < ActionMailer::Base

  default from: ENV['FORWARDING_FROM_ADDRESS']

  def forward_from_incoming(email)
    create_attachments_from_griddler_email(email)
    send_from_griddler_email(email)
  end

  protected

  def create_attachments_from_griddler_email(email)
    email.attachments.each do |attachment|
      attachments[attachment.original_filename] = attachment.read
    end
  end

  def send_from_griddler_email(email)
    recipients = forward_recipients_from_griddler_email(email)
    mail(to: recipients, reply_to: email.from, subject: email.subject) do |format|
      format.text { render text: email.raw_text }
      format.html { render html: email.raw_html.html_safe }
    end
  end

  def forward_recipients_from_griddler_email(email)
    ForwardingAddress.by_source_emails(*email.to.map { |r| r[:email] }).map(&:recipient_emails).flatten
  end

end
