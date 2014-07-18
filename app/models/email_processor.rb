class EmailProcessor
  def self.process(email)
    recipients = email.to.map { |r| r[:email] } + email.cc.map { |r| r[:email] }
    return unless ForwardingAddress.by_source_emails(*recipients).any?
    ForwardEmailJob.new.async.perform email
  end
end
