
import "eset.nim"
import "mset.nim"
import "positioniterator.nim"
import "postingiterator.nim"
import "termiterator.nim"
import "valueiterator.nim"

{.push header: "xapian/iterator.h".}

proc isValid*(this: ESetIterator): bool
  {.importcpp: "Xapian::iterator_valid(@)".}
proc isValid*(this: MSetIterator): bool
  {.importcpp: "Xapian::iterator_valid(@)".}
proc isValid*(this: PositionIterator): bool
  {.importcpp: "Xapian::iterator_valid(@)".}
proc isValid*(this: PostingIterator): bool
  {.importcpp: "Xapian::iterator_valid(@)".}
proc isValid*(this: TermIterator): bool
  {.importcpp: "Xapian::iterator_valid(@)".}
proc isValid*(this: ValueIterator): bool
  {.importcpp: "Xapian::iterator_valid(@)".}


{.pop.}
