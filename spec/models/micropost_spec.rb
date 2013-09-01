require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    #@micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
	@micropost = user.microposts.build(content:"Haha,weibo!")
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should be_valid }
  it { should respond_to(:user)
  its(:user) { should eq user }
  
  describe "when user_id is not present"  do
	before { @micropost.user_id = nil }
	it { should_not be_valid }
  end
end