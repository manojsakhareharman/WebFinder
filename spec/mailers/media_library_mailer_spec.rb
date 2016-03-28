require "rails_helper"

RSpec.describe MediaLibraryMailer, type: :mailer do
  describe "access_request" do
    let(:mail) { MediaLibraryMailer.access_request }

    it "renders the headers" do
      expect(mail.subject).to eq("Access request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
