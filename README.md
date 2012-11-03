## SimCity-esque simulation

### Requirements:

Ruby 2 Preview
    rvm reinstall ruby-head -n newborn && rvm ruby-head-newborn

The following entities exist in the system:

- Map
- MapCell
- Actor
  - Power
- Structures
  - Road
  - Power Plant
  - House


### Simple example
- A Power Plant is a Structure.
- It emits a Power Actor that carry 1 resource along roads.
- Structures check to see if there is a resource they need, if there is, they consume it.
