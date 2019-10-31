require 'spec_helper'
require 'rails_helper'

RSpec.describe Example do
  it "validates" do 
    example = Example.new(example: '')
    example.valid?
    example.errors.should_not be_empty
  end
end 