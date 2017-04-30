
import "error.nim"

type
  ErrorHandler* {.header: "xapian/errorhandler.h", importcpp: "Xapian::ErrorHandler".} = object


proc newErrorHandler(): ErrorHandler
  {.header: "xapian/errorhandler.h", constructor, importcpp: "Xapian::ErrorHandler()".}

proc catch*(this: ErrorHandler, `error`: Error): void
  {.header: "xapian/errorhandler.h", importcpp: "#(@)".}
