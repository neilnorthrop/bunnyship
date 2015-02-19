class Player

  def initialize(opts)
    @name  = opts[:name]
    @ships = opts[:ships]
    @turn  = opts[:turn]
  end

  def active_ships
   active_ships = []
   @ships.each do |ship|
      unless ship.destroyed?
        active_ships << ship
      end
    end
    return active_ships
  end

  def active?
    if active_ships.empty?
      return false
    else
      return true
    end
  end

end