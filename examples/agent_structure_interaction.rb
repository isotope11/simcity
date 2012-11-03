# When an agent interacts with a structure, it tells the structure to take his
# resource.  If the structure wants it, it responds by sending him a 'gimme that
# stuff' message.
require_relative '../lib/simcity'

agent = Agent.new
agent.is_carrying(:power)

house = Structure.new
house.can_use(:power)
house.wants(:power)

well = Structure.new

agent.offer_resource(well)
agent.offer_resource(house)

# The house should have taken the resource
#
# ---------------
# When an agent offers a resource to a structure, the interaction looks
# something like this:
#
class Agent
  def offer_resource(structure)
    structure.consume_resource(self.resource)
  end
end
