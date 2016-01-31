require './test/test_base.rb'

class GlipPosterTest < Test::Unit::TestCase
  def test_setup
    poster = Glip::Poster.new('deadbeef')

    assert_equal 'Glip::Poster', poster.class.name
    assert_equal 'https://hooks.glip.com/webhook/deadbeef', poster.webhook_url
  end

  def test_url
    url = 'https://hooks.glip.com/webhook/11111111-2222-3333-4444-555555555555'
    poster = Glip::Poster.new(url)
    assert_equal url, poster.webhook_url
  end

  def test_farday
    poster = Glip::Poster.new('deadbeef')
    Faraday::Connection.any_instance.stubs(:post).returns(Faraday::Response.new)
    res = poster.send_message('Hello World!')
    assert_equal 'Faraday::Response', res.class.name
  end
end