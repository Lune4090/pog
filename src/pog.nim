#[
  Graph-based Game/GUI  
  - High-level abstruction
    - drawing and plan do draw is perfectly separated
    - Only plan to draw, interface to drawing are supported
    - Real drawing is done by backend library
  - ECS
    - Entity: Object
      - every data is object
      - every node obly has **index** of its data and parent/child node
        - system can easily track its parency through graph
          - e.g. relative position -> global position
    - Component: seq[T]
      - entity's
    - System: Func
      - EverySystem only treats entity
      - real operation is done to entity's component.
  - Graph
    - Every entity
]#

import naylib

type
  NodeKind* = enum
    ## Different types of nodes.
    nkRoot

  Node* = object
    id*: string
    uid*: string
    kind*: NodeKind
    parentUids: seq[int]
    childUids: seq[int]


var
  positions: seq[float]
  velocities: seq[float]
  accelerations: seq[float]
