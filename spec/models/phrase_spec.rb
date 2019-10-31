require 'spec_helper'
require 'rails_helper'

RSpec.describe Phrase do
  describe "validates phrase" do
    it "validates" do 
      phrase = Phrase.new(phrase:'')
      phrase.valid?
      phrase.errors.should_not be_empty
    end

    it "validates translation" do
      translation = Phrase.new(translation:'')
      translation.valid?
      translation.errors.should_not be_empty
    end
  end 
end

