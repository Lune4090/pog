# pog: "Propagate Occurency through Graph" and make it easy to treat object interaction, especially for graphical application.

## For Users

!!! This library is basically personal usage and under heavily development !!!

### What is pog?

Graph-based Game/GUI/Plotting abstruction framework.

Currently, this library depends below libraries

1. [naylib](https://github.com/planetis-m/naylib)
- [raylib](https://github.com/raysan5/raylib) wrapper, being used as OpenGL backend / sound utility, written in pure nim (raylib library is written in C).
- Dependecy to naylib(raylib) is carefully limited to make use other backend library easier.

2. [results](https://github.com/arnetheduck/nim-results)
- Bring result type into nim, written in pure nim.

3. [vmath](https://github.com/treeform/vmath)
- 2D/3D vector calculation, written in pure nim.

All of the above libraries are written in pure nim and raylib can cross compile (see naylib/raylib doc), thus anything build on this library will easily cross-compiled to a lot of platform (linux -> WebAssembly, Android, ...) 

### Features

High-level abstruction
  - rendering and Deciding what is rendered is perfectly separated
  - Only plan to draw, interface to drawing are supported
  - Real drawing is done by backend library

Obj-Graph

- gameObj: `type GameObject = object of RootObj`
  1. uID: `int`
  - User or library predefined object can inherit this obj to use below functionality.
  
- graph: `type Graph = object of RootObj`
  1. uID: `int`
  2. childNodeUIDs: `{ <target: node.uID>, <childs: seq[node.uID]> }`
  3. parentNodeUIDs: `{ <target: node.uID>, <parents: seq[node.uID]> }`
  4. taggedNodeUIDs: `{ <target: node.uID>, <tagged
  Nodes: seq[node.uID]> }`
  5. forwardEdges: `{ <target: node.uID>, <forwardEdges: seq[Edge]> }`
  6. backwardEdges: `{ <target: node.uID>, <backwardEdges: seq[Edge]> }`
  7. nondirectionalEdges: `{ <target: node.uID>, <nondirectionalEdges: seq[Edge]> }`

- node: `type Node = object of RootObj`
  1. uID: `Int`
  2. gameObj_uIDs: `seq[gameObj.uID: Int]`
  - system can easily track its parent/child through graph
    - e.g. relative position -> global position

- edge: `type Edge = object` 
  1. uID: Int
  2. connection: `{ <isDirectional: bool>, <parentNodeUID: node.uID>, <childNodeUID: node.uID> }`
  3. function: `func(nodeUIDs: seq[node.uID])`

- path: `type Path = object of RootObj`
  1. RootNodeUID: `node.uID`
  2. chainedEdge: `seq[Edge]`
  - Will be beneficial temporally occurency propagation


- objectTables: `{ <gameObj.uID>, <object: GameObject> }`

- MaptoNode: `func(obj: GameObject, graph: Graph, node: Node)`

- initNode: `func(graph: Graph): Node`

- initEdge: `func(graph: Graph): Edge`

### examples

see examples/*.
