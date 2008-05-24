require 'helper'

class FilterErubisTest < Test::Unit::TestCase

  def setup    ; global_setup    ; end
  def teardown ; global_teardown ; end

  def test_filter
    if_have 'erubis' do
      assert_nothing_raised do
        with_site_fixture 'empty_site' do |site|
          site.load_data

          # Get filter
          filter = ::Nanoc::Filters::Erubis.new(site.pages.first.to_proxy, site)

          # Run filter
          result = filter.run('<%= "Hello." %>')
          assert_equal('Hello.', result)
        end
      end
    end
  end

end
