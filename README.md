# pog: "Propagate Occurency through Graph" and make it easy to treat object interaction, especially for graphical application.

## For Users

!!! This library is basically personal usage and under heavily development !!!

### What is pog?

Graph-based Game/GUI/Plotting abstruction framework.

Currently, this library depends below libraries

1. [naylib](https://github.com/planetis-m/naylib)
- [raylib](https://github.com/raysan5/raylib) wrapper, being used as OpenGL backend / sound utility.
- Dependecy to naylib(raylib) is carefully limited to make use other backend library easier.

2. [grim](https://github.com/ebran/grim)
- Graph system, pure nim.

3. [vmath](https://github.com/treeform/vmath)
- 2D/3D vector calculation, pure nim.

2 and 3 are pure nim and naylib can cross compile (see naylib doc), thus anything build on this library will easily cross-compiled to a lot of platform (linux -> WebAssembly, Android, ...) 

### Features

High-level abstruction
  - rendering and Deciding what is rendered is perfectly separated
  - Only plan to draw, interface to drawing are supported
  - Real drawing is done by backend library

ECS-Graph

- Entity: `type Entity = Object`
  - All entity have 
    1. uID: `int`
    2. index of the component (where actual data is stored): `tables{<component.uID: int>, <postion in the component: int>}`

- Component: `seq[T]`
  - T depends on each data type.

- ComponentTable: `{<component idx: Int>, <component: seq[T]>}`
  - components are accessed through component table.
  
- System: `func(Entity.uID: var Int)`
  - EverySystem only treats entity
  - real operation is performed on entity's component.
  - !!! In general, touch entity directry will cause unchained data transform !!!
    - e.g. When "Sun" entity has child entity "Earth", and its movement will affect Earth position like x_e = abs(Sun-Earth)*cos(θ), direct transformation of Sun will mean sudden change of substance between Sun and Earth = abs(Sun - Earth)
    - In the above case, if let r = abs(Sun - Earth) is initially defined and use it to define effect of Sun movement to Earth position, direct transformation of 

Graph (based on [grim](https://github.com/ebran/grim) library)
- graph: `graph`
  - graph info can easily access through itself.
  
- Node: `graph.node`
  - All node have
    1. uID: Int
    - uID is used to register the entity to graph
    2. parent uID: `uID: Int`
    3. child uID: `uID: Int`
    4. entity uIDs: `seq[uID: Int]`
    - system can easily track its parent/child through graph
      - e.g. relative position -> global position

- Edge: `graph.edge` 
  - All edge have
    1. uID: Int
    2. funcname: func(Node.entity_uIDs: var seq[entity.uID:Int])

- Path: `graph.path`
  - Will be beneficial temporally occurency propagation


### examples

see examples/*.
