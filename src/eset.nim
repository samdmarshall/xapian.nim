
import "cpp/string.nim"

import "types.nim"

{.push header: "xapian/eset.h".}

type
  ESet_Query_Flags* = enum
    INCLUDE_QUERY_TERMS = 1
    USE_EXACT_TERMFREQ = 2

  ESet* {.importcpp: "Xapian::ESet".} = object
  ESetIterator* {.importcpp: "Xapian::ESetIterator".} = object

proc newESet(): ESet
  {.constructor, importcpp: "Xapian::ESet()".}
proc newESetIterator(): ESetIterator
  {.constructor, importcpp: "Xapian::ESetIterator()".}

proc size*(this: ESet): DocCount
  {.importcpp: "#.size()".}
proc empty*(this: ESet): bool
  {.importcpp: "#.empty()".}
proc getEbound*(this: ESet): TermCount
  {.importcpp: "#.get_ebound()".}
proc begin*(this: ESet): ESetIterator
  {.importcpp: "#.begin()".}
proc `end`*(this: ESet): ESetIterator
  {.importcpp: "#.end()".}
proc `[]=`*(this: ESet, index: cint): ESetIterator
  {.importcpp: "#[#]".}
proc back*(this: ESet): ESetIterator
  {.importcpp: "#.back()".}
proc getDescription*(this: ESet): CppString
  {.importcpp: "#.get_description()".}

proc `==`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# == #".}
proc `!=`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# != #".}
proc `<`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# < #".}
proc `>`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# > #".}
proc `<=`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# <= #".}
proc `>=`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# >= #".}
proc `+`*(this: ESetIterator, other: ESetIterator): bool
  {.importcpp: "# + #".}

{.pop.}
