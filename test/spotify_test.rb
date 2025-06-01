# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/spotify'

# Test program coolness
class SpotifyTest < Minitest::Test
  def test_spotify
    # skip
    assert_equal Spotify.new.test, 11
  end
end
