class EmailProcessor
  def self.process(email)
    Rails.logger.info email.inspect
  end
end
