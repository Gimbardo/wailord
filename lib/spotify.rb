# frozen_string_literal: true

class Spotify
  attr_reader :test

  def initialize
    @test = 11
  end
end

puts "Coolness: #{Spotify.new.test}/10"
