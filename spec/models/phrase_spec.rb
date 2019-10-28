require 'spec_helper'

describe Phrase do
  describe "validates phrase" do
    it "validates" do 
      phrase = Phrase.new(phrase:'')
      phrase.valid?
      phrase.errors[:phrase].should_not be_empty
    end

    it "validates translation" do
      translation = Phrase.new(translation:'')
      translation.valid?
      translation.errors[:translation].should_not be_empty
    end
  end 
end

