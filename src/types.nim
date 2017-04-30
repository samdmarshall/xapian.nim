
import "version.nim"

type
  DocCount* {.header: "xapian/types.h", importcpp: "Xapian::doccount".} = cuint
  DocCountDiff* {.header: "xapian/types.h", importcpp: "Xapian::doccount_diff".} = cint
  DocId* {.header: "xapian/types.h", importcpp: "Xapian::docid".} = cuint
  DocLength* {.header: "xapian/types.h", importcpp: "Xapian::doclength".} = cdouble

  TermCount* {.header: "xapian/types.h", importcpp: "Xapian::termcount".} = cuint
  TermCountDiff* {.header: "xapian/types.h", importcpp: "Xapian::termcount_diff".} = cint

  TermPos* {.header: "xapian/types.h", importcpp: "Xapian::termpos".} = cuint
  TermPosDiff* {.header: "xapian/types.h", importcpp: "Xapian::termpos_diff".} = cint

  ValueNo* {.header: "xapian/types.h", importcpp: "Xapian::valueno".} = cuint
  ValueNoDiff* {.header: "xapian/types.h", importcpp: "Xapian::valueno_diff".} = cint
  
  Rev* {.header: "xapian/types.h", importcpp: "Xapian::rev".} = XAPIAN_REVISION_TYPE

const
  BAD_VALUENO* {.header: "xapian/types.h", importcpp: "Xapian::BAD_VALUENO".} = ValueNo(0xffffffff)
