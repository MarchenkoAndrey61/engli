RSpec.shared_examples 'has index action' do
  let(:user) { create(:user) }
  before do
    sign_in user
    
  end
  it { expect(render_template(:index)) }
end
