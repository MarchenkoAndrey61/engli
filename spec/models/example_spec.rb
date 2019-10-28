require 'spec_helper'

describe Example do
  it "validates" do 
    example = Example.new(example: '')
    example.valid?
    example.errors[:example].should_not be_empty
  end
end 