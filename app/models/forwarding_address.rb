class ForwardingAddress < ActiveRecord::Base

  def self.by_source_emails(*source_emails)
    where('ARRAY[?]::varchar[] && source_emails', source_emails)
  end

end
