type supertype = 
  | DoSuper 
  | DataSuper 
  | ActionSuper
type direction = 
  | Forward 
  | Backward 
type navigation = 
  | AlongDoNav of direction 
  | DataNav of rank 
  | CallerNav of rank
  | ActionNav 
  | ActionToDoNav
  | NonsyntaxNav of rank 
type 'a new_node = 
  | Do 
  | Data of subtype * 'a 
  | Action of subtype 
  | Nonsyntax of 'a
type trait = 
  | SyntaxOrNonsyntax 
  | Supertype 
  | Subtype 
  | Value
type arg_pos = 
  | ArgumentPosition of int 
  | Inapplicable
type testable_condition = 
  | EqStoredTrait of trait 
  | EqAllStoredTraits
  | LocSaved 
  | Traversable of 
      navigation 
  | CanAddNeighbor of 
      new_node * arg_pos
  | CanAddNeighborFromStored 
      of arg_pos
  | CanConnectWithSaved of arg_pos
val store_characteristic : 
  characteristic -> graph -> graph
val nop : graph -> graph 
val compose : 
     (graph -> graph) 
  -> (graph -> graph)
  -> graph -> graph
val conditional : 
     testable_condition 
  -> (graph -> graph) 
  -> (graph -> graph) 
  -> graph -> graph
val save_current_loc : 
  graph -> graph 
val discard_saved_loc : 
  graph -> graph
val traverse : 
  navigation -> graph -> graph 
val add_neighbor : 'a new_node 
  -> arg_pos -> graph -> graph 
val add_neighbor_from_stored : 
  argument_position -> graph -> graph 
val create_edge_to_saved_loc : 
  argument_position -> graph -> graph
val discard_stored : 
  graph -> graph