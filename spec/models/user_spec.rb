require 'rails_helper'

RSpec.describe User do

  describe "User" do

    let(:kalle){described_class.new(name: 'Kalle', password: 'passord123', email: 'kalle@kalle.no')}
    let(:holger){described_class.new(name: 'Holger', password: 'passord123', email: 'holgeer@kalle.no')}

    it 'is expected to have a name' do
        
      expect(kalle.name).to eq 'Kalle'
    end

    it 'is expected to have a name' do
      expect(holger.name).to eq 'Holger'
    end
  end

  describe "Mailboxer functionality " do

    let(:sender){described_class.new(name: 'Kalle', password: 'passord123', email: 'kalle@kalle.no')}
    let(:receiver){described_class.new(name: 'Holger', password: 'passord123', email: 'holgeer@kalle.no')}

    before do
      sender.send_message(receiver, 'Hallå hallå', 'Hej')
    end

    it 'receiver should get a mail from sender' do
      expect(receiver.mailbox.inbox.first.subject).to eq 'Hej'
    end

    it 'sender should have message in sentbox' do
      expect(sender.mailbox.sentbox.first.subject).to eq 'Hej'
    end

    it 'user should be able to delete a message and see it in trash' do
      conversation = receiver.mailbox.inbox.first
      receiver.trash(conversation)
      expect(receiver.mailbox.trash.first.subject).to eq 'Hej'
    end

    it 'user should be able to untrash a message' do
      conversation = receiver.mailbox.trash.first
      receiver.untrash(conversation)
      expect(receiver.mailbox.inbox.first.subject).to eq 'Hej'
    end
  end

end
