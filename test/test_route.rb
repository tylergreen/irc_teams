require "test/unit"
require 'utils/route'

describe Route do
  before do
    @r = Route.new(/join (.*)/) { |match_data| "joined #{match_data[1]}!" }
  end

  it 'can be matched and have its block evaluated' do
    assert(@r.match('join rangers'), 'failed to match' )
    assert(@r.match('meet rangers').nil?, 'false match')
  end

  it 'once matched, it can have its action executed' do
    @r.match('join rangers')
    assert_equal(@r.exec, 'joined rangers!')
  end

  it "cannot be exec'd before matched" do
    assert_raises(RuntimeError) { @r.exec }
  end
end
