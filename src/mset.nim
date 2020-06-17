
import "cpp/string.nim"

import "types.nim"
import "weight.nim"

{.push header: "xapian/mset.h".}

type
  MSet* {.importcpp: "Xapian::MSet".} = object
  MSetIterator* {.importcpp: "Xapian::MSetIterator".} = object

proc newMSet*(): MSet
  {.importcpp: "Xapian::MSet()".}
proc convertToPercent*(this: MSet, weight: Weight): cint
  {.importcpp: "#.convert_to_percent(@)".}
proc convertToPercent*(this: MSet, iter: MSetIterator): cint
  {.importcpp: "#.convert_to_percent(@)".}
proc getTermFreq*(this: MSet, term: CppString): DocCount
  {.importcpp: "#.get_termfreq(@)".}
proc getTermWeight*(this: MSet, term: CppString): cdouble
  {.importcpp: "#.get_termweight(@)".}
proc getFirstItem*(this: MSet): DocCount
  {.importcpp: "#.get_firstitem()".}
  
proc getMatchesLowerBound*(this: MSet): DocCount
  {.importcpp: "#.get_matches_lower_bound()".}
proc getMatchesEstimated*(this: MSet): DocCount
  {.importcpp: "#.get_matches_estimated()".}
proc getMatchesUpperBound*(this: MSet): DocCount
  {.importcpp: "#.get_matches_upper_bound()".}

proc getUncollapsedMatchesLowerBound*(this: MSet): DocCount
  {.importcpp: "#.get_uncollapsed_matches_lower_bound()".}
proc getUncollapsedMatchesEstimated*(this: MSet): DocCount
  {.importcpp: "#.get_uncollapsed_matches_estimated()".}
proc getUncollapsedMatchesUpperBound*(this: MSet): DocCount
  {.importcpp: "#.get_uncollapsed_matches_upper_bound()".}

proc getMaxAttained*(this: MSet): cdouble
  {.importcpp: "#.get_max_attained()".}
proc getMaxPossible*(this: MSet): cdouble
  {.importcpp: "#.get_max_possible()".}



{.pop.}
