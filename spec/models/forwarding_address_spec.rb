require 'spec_helper'

describe ForwardingAddress do

  describe 'searching by source emails' do
    let!(:record) { ForwardingAddress.create! source_emails: ['info@example.com', 'sales@example.com'], recipient_emails: [ 'someguy@example.com' ] }

    it 'returns records matching a given source e-mail' do
      expect(ForwardingAddress.by_source_emails('info@example.com')).to include(record)
    end

    it 'returns records matching one of several given source e-mails' do
      expect(ForwardingAddress.by_source_emails('info@example.com', 'marketing@example.com')).to include(record)
    end

    it 'excludes records without a matching source e-mail' do
      expect(ForwardingAddress.by_source_emails('marketing@example.com')).not_to include(record)
    end

  end

end
