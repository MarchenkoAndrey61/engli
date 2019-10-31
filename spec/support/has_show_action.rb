RSpec.shared_examples 'has show action' do |shown_object|
  let(:user) { create(:user) }
  let(:obj) { shown_object != :user ? create(shown_object, user: user) : user }
  before do
    sign_in user
  end
  it { expect(render_template(:show)) }
end