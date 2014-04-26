class CreateForwardingAddresses < ActiveRecord::Migration
  def change
    create_table :forwarding_addresses do |t|
      t.string :source_emails, array: true
      t.string :recipient_emails, array: true
      t.timestamps
    end
    add_index :forwarding_addresses, :source_emails, using: :gin
  end
end
