require './test/test_base.rb'

class GlipPosterTest < Test::Unit::TestCase
  def test_setup
    poster = Glip::Poster.new('deadbeef')

    assert_equal 'Glip::Poster', poster.class.name
    assert_equal 'https://hooks.glip.com/webhook/deadbeef', poster.webhook_url
  end

  def test_url
    url = 'https://hooks.glip.com/webhook/11112222-3333-4444-5555-666677778888'
    poster = Glip::Poster.new(url)
    assert_equal url, poster.webhook_url
  end

  def test_farday
    poster = Glip::Poster.new('deadbeef')
    Faraday::Connection.any_instance.stubs(:post).returns(Faraday::Response.new)
    res = poster.send_message('Hello World!')
    assert_equal 'Faraday::Response', res.class.name
  end

  def test_raise
    assert_raise do
      poster = Glip::Poster.new
    end

    assert_raise do
      poster = Glip::Poster.new('dead/beef')
    end
  end

  def test_options
    poster = Glip::Poster.new('deadbeef')

    assert_equal true, poster.options.is_a?(Hash)

    poster.options[:icon] = 'http://example.com/icon.png'
    assert_equal 'http://example.com/icon.png', poster.options[:icon]
  end
end
