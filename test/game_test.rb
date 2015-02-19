require 'minitest/autorun'
require 'minitest/spec'
require 'yaml'
require_relative '../lib/game'

class GameTest < MiniTest::Test

  def setup
    opts  = YAML.load_file('./settings.yaml')
    @game = Game.new(opts)
    @ships = YAML.load_file('./player_1.yaml')
  end

  def test_valid_ship
    carrier = @ships.assoc('carrier')
    assert_equal(true, @game.valid_ship?(carrier))
  end

  def test_valid_fleet
    assert_equal(true, @game.valid_fleet?(@ships))
  end
end