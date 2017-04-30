
import "types.nim"

type
  Error* {.header: "xapian/error.h", importcpp: "Xapian::Error".} = object
    msg*: CppString
    context*: CppString
    error_string*: CppString
    `type`*: cstring
    my_errno*: cint
    already_handled*: bool
    
  ErrorHandler* {.header: "xapian/error.h", importcpp: "Xapian::ErrorHandler".} = object
