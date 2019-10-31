require 'spec_helper'
require 'rails_helper'


RSpec.describe User, type: :model do
  it "validates" do 
    user = User.new(username:'')
    user.valid?
    user.errors.should_not be_empty
  end
end 