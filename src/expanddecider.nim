
import "cpp/set.nim"
import "cpp/string.nim"


{.push header: "xapian/expanddecider.h".}

type
  ExpandDecider* {.importcpp: "Xapian::ExpandDecider".} = object

  ExpandDeciderAnd* {.importcpp: "Xapian::ExpandDeciderAnd".} = ExpandDecider

  ExpandDeciderFilterTerms* {.importcpp: "Xapian::ExpandDeciderFilterTerms".} = ExpandDecider

  ExpandDeciderFilterPrefix* {.importcpp: "Xapian::ExpandDeciderFilterPrefix".} = ExpandDecider

proc newExpandDecider(): ExpandDecider
  {.constructor, importcpp: "Xapian::ExpandDecider()".}
proc newExpandDeciderAnd(): ExpandDeciderAnd
  {.constructor, importcpp: "Xapian::ExpandDeciderAnd()".}
proc newExpandDeciderFilterTerms(): ExpandDeciderFilterTerms
  {.constructor, importcpp: "Xapian::ExpandDeciderFilterTerms()".}
proc newExpandDeciderFilterPrefix(): ExpandDeciderFilterPrefix
  {.constructor, importcpp: "Xapian::ExpandDeciderFilterPrefix()".}

{.pop.}
