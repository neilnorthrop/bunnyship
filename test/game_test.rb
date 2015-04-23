require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/ship_builder'

class GameTest < MiniTest::Test

  def setup
    @game     = Game.new
    @player_1 = Player.new
    @player_2 = Player.new(name: 'Joe')
  end

  def test_active_player_count
    assert_equal 0, @game.active_player_count

    @game.players[@player_1.name] = @player_1
    ship = ShipBuilder.new(type: 'battleship', x: 1, y: 1, alignment: 'h', length: 4).ship
    @game.players[@player_1.name].ships << ship

    assert_equal 1, @game.active_player_count
  end

  def test_active
    assert_equal false, @game.active?

    @game.players[@player_1.name] = @player_1
    ship = ShipBuilder.new(type: 'battleship', x: 1, y: 1, alignment: 'h', length: 4).ship
    @game.players[@player_1.name].ships << ship

    assert_equal true, @game.active?
  end

  def test_switch_turns
    skip
    expected_turn = @player_1
    @game.players[@player_1.name] = @player_1
    @game.players[@player_2.name] = @player_2

    assert_equal expected_turn, @game.current_turn
  end

  def test_add_player
    expected_players = { "#{@player_1.name}" => @player_1 }
    expected_array = [@player_1]
    @game.add(@player_1)

    assert_equal expected_players, @game.players
    assert_equal expected_array, @game.turn_order

    expected_players[@player_2.name] = @player_2
    expected_array << @player_2
    @game.add(@player_2)

    assert_equal expected_players, @game.players
    assert_equal expected_array, @game.turn_order
  end

  def test_subtract_player
    expected_hash = { "#{@player_1.name}" => @player_1 }
    expected_turn = [@player_1]
    @game.add(@player_1)
    @game.add(@player_2)

    @game.sub(@player_2)
    assert_equal expected_hash, @game.players
    assert_equal expected_turn, @game.turn_order
  end

end
