## SimCity-esque simulation using celluloid

The following entities exist in the system:

- Map
- MapCell
- Agent
- Resource
- Structure
- Conduit


### Simple example
- A Power Plant is a Structure.
- It emits Agents that carry 1 resource along conduits.
- An Agent checks at each cell along the conduit to see if any attached Structures
consume its resource.
