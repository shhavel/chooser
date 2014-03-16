require "spec_helper"

describe "Array#choose" do
  let(:alex) { Person.new("Alex", "Programmer", "123 Maple, Anytown NC", 27) }
  let(:dave) { Person.new("Dave", "Programmer", "236 Main", 32) }
  let(:nick) { Person.new("Nick", "Designer", "237 Main st.", 29) }
  let(:jack) { Person.new("Jack", "QA", "1010 Center st.", 29) }
  let(:people) { [alex, dave, nick, jack] }

  context "choose elements by attribute equality" do
    it "chooses elements with requested profession" do
      expect(people.choose(:profession => "Programmer")).to match_array([alex, dave])
    end

    it "chooses elements with requested age" do
      expect(people.choose(:age => 29)).to match_array([nick, jack])
    end

    it "chooses elements with requested profession and age" do
      expect(people.choose(:profession => "Designer", :age => 29)).to match_array([nick])
    end

    it "returns empty array if no match found" do
      expect(people.choose(:profession => "Designer", :age => 34)).to eq([])
    end
  end

  context "choose elements by attribute inclusion" do
    it "chooses elements with age included into requested array" do
      expect(people.choose(:age => [29, 32])).to match_array([dave, nick, jack])
    end

    it "chooses elements with age included into requested array and with requested profession" do
      expect(people.choose(:age => [29, 32], :profession => "QA")).to match_array([jack])
    end

    it "chooses elements with age included into requested range and with requested profession" do
      expect(people.choose(:age => (27..29))).to match_array([alex, nick, jack])
    end

    it "chooses elements with age included into requested range and with matching profession" do
      expect(people.choose(:age => (27..29), :profession => /Designer|QA/)).to match_array([nick, jack])
    end

    it "chooses elements with natched address" do
      expect(people.choose(:address => /Main/)).to match_array([dave, nick])
    end
  end

  context "choose elements by passing evaluated string of code" do
    it "chooses elements with matched address" do
      expect(people.choose("address =~ /Main/")).to match_array([dave, nick])
    end

    it "chooses elements with age less or euqual than requested" do
      expect(people.choose("age <= 29")).to match_array([alex, nick, jack])
    end
  end

  context "incorrect arguments" do
    it "raises exception if receives incorrect argument" do
      expect { people.choose([27, 29]) }.to raise_error ArgumentError
    end
  end
end
