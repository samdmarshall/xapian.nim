
import "cpp/string.nim"

import "types.nim"
import "document.nim"
import "registry.nim"
import "termiterator.nim"

{.push header: "xapian/matchspy.h".}

type
  MatchSpy* {.importcpp: "Xapian::MatchSpy".} = object
  
  ValueCountMatchSpy* {.importcpp: "Xapian::ValueCountMatchSpy".} = MatchSpy
    # slot*: ValueNo
    # total*: DocCount
    


proc newMatchSpy*(): MatchSpy
  {.constructor, importcpp: "Xapian::MatchSpy()".}
proc newValueCountMatchSpy*(): ValueCountMatchSpy
  {.constructor, importcpp: "Xapian::ValueCountMatchSpy()".}

proc clone*(this: MatchSpy): MatchSpy
  {.importcpp: "#.clone()".}
proc register*(this: MatchSpy, doc: Document): void
  {.importcpp: "#(@)".}
proc getName*(this: MatchSpy): CppString
  {.importcpp: "#.name()".}
proc serialise*(this: MatchSpy): CppString
  {.importcpp: "#.serialise()".}
proc serialiseResults*(this: MatchSpy): CppString
  {.importcpp: "#.serialise_results()".}
proc mergeResults*(this: MatchSpy, str: CppString): void
  {.importcpp: "#.merge_results(@)".}

proc getTotal*(this: ValueCountMatchSpy): cint
  {.importcpp: "#.get_total()".}
proc valuesBegin*(this: ValueCountMatchSpy): TermIterator
  {.importcpp: "#.values_begin()".}
proc valuesEnd*(this: ValueCountMatchSpy): TermIterator
  {.importcpp: "#.values_end()".}
proc topValuesBegin*(this: ValueCountMatchSpy): TermIterator
  {.importcpp: "#.top_values_begin()".}
proc topValuesEnd*(this: ValueCountMatchSpy): TermIterator
  {.importcpp: "#.top_values_end()".}

{.pop.}
