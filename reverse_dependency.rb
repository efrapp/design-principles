class Gear
  attr_reader :cog, :chain_ring

  def initialize(cog:, chain_ring:)
    @cog = cog
    @chain_ring = chain_ring
  end

  def ratio
    chain_ring / cog.to_f
  end

  def gear_inches(diameter)
    ratio * diameter
  end
end

class Wheel
  attr_reader :tire, :rim, :gear

  def initialize(tire:, rim:, cog:, chain_ring:)
    @tire = tire
    @rim = rim
    @gear = Gear.new(cog: cog, chain_ring: chain_ring)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end
end

puts Wheel.new(tire: 1.5, rim: 26, chain_ring: 52, cog: 11).gear_inches
