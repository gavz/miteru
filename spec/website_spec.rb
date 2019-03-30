# frozen_string_literal: true

RSpec.describe Miteru::Website do
  include_context "http_server"

  subject { Miteru::Website }

  describe "#title" do
    it "should return a String" do
      expect(subject.new("#{base_url}/has_kit").title).to be_a(String)
    end
  end

  describe "#kits" do
    it "should return an Array" do
      kits = subject.new("#{base_url}/has_kit").kits
      expect(kits).to be_an(Array)
      expect(kits.length).to eq(2)
    end
  end

  describe "#has_kits?" do
    context "when giving a url which contains a phishing kit" do
      it "should return true" do
        expect(subject.new("#{base_url}/has_kit").has_kits?).to eq(true)
      end
    end

    context "when giving a url which doesn't contain a phishing kit" do
      it "should return false" do
        expect(subject.new("#{base_url}/no_kit").has_kits?).to eq(false)
      end
    end
  end
end
