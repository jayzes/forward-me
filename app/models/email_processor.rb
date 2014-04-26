class EmailProcessor
  def self.process(email)
    return unless ForwardingAddress.by_source_emails(*email.to.map { |r| r[:email] }).any?
    ForwardEmailJob.new.async.perform email
  end
end
