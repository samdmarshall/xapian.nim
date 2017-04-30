
import "cpp/string.nim"

type
  CompactorCompactionLevel = enum
    STANDARD = 0,
    FULL = 1,
    FULLER = 2
  
  Compactor* {.header: "xapian/compactor.h", importcpp: "Xapian::Compactor".} = distinct object
    level*: CompactorCompactionLevel
    

proc newCompactor*(): Compactor {.header: "xapian/compactor.h", constructor, importcpp: "Compactor(@)".}


proc setStatus*(this: Compactor, table: CppString, status: CppString): void
  {.header: "xapian/compactor.h", importcpp: "#.set_status(@)".}
