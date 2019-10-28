require 'spec_helper'

describe User do
  it "validates" do 
    user = User.new(username:'')
    user.valid?
    user.errors[:username].should_not be_empty
  end
end 