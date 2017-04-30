
import "cpp/string.nim"

import "types.nim"

type
  Error* {.header: "xapian/error.h", importcpp: "Xapian::Error".} = object
    msg*: CppString
    context*: CppString
    error_string*: CppString
    `type`*: cstring
    my_errno*: cint
    already_handled*: bool
  LogicError* {.header: "xapian/error.h", importcpp: "Xapian::LogicError".} = Error
  RuntimeError* {.header: "xapian/error.h", importcpp: "Xapian::RuntimeError".} = Error
  AssertionError* {.header: "xapian/error.h", importcpp: "Xapian::AssertionError".} = LogicError
  InvalidArgumentError* {.header: "xapian/error.h", importcpp: "Xapian::InvalidArgumentError".} = LogicError
  InvalidOperationError* {.header: "xapian/error.h", importcpp: "Xapian::InvalidOperationError".} = LogicError
  UnimplementedError* {.header: "xapian/error.h", importcpp: "Xapian::UnimplementedError".} = LogicError
  DatabaseError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseError".} = RuntimeError
  DatabaseCorruptError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseCorruptError".} = DatabaseError
  DatabaseCreateError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseCreateError".} = DatabaseError
  DatabaseLockError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseLockError".} = DatabaseError
  DatabaseModifiedError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseModifiedError".} = DatabaseError
  DatabaseOpeningError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseOpeningError".} = DatabaseError
  DatabaseVersionError* {.header: "xapian/error.h", importcpp: "Xapian::DatabaseVersionError".} = DatabaseOpeningError
  DocNotFoundError* {.header: "xapian/error.h", importcpp: "Xapian::DocNotFoundError".} = RuntimeError
  FeatureUnavailableError* {.header: "xapian/error.h", importcpp: "Xapian::FeatureUnavailable".} = RuntimeError
  InternalError* {.header: "xapian/error.h", importcpp: "Xapian::InternalError".} = RuntimeError
  NetworkError* {.header: "xapian/error.h", importcpp: "Xapian::NetworkError".} = RuntimeError
  NetworkTimeoutError* {.header: "xapian/error.h", importcpp: "Xapian::NetworkTimeoutError".} = NetworkError
  QueryParserError* {.header: "xapian/error.h", importcpp: "Xapian::QueryParserError".} = RuntimeError
  SerialisationError* {.header: "xapian/error.h", importcpp: "Xapian::Serialisation".} = RuntimeError
  RangeError* {.header: "xapian/error.h", importcpp: "Xapian::RangeError".} = RuntimeError
  WildcardError* {.header: "xapian/error.h", importcpp: "Xapian::WildcardError".} = RuntimeError

proc getType*(this: Error): cstring
  {.header: "xapian/error.h", importcpp: "#.get_type()".}
proc getMessage*(this: Error): CppString
  {.header: "xapian/error.h", importcpp: "#.get_msg()".}
proc getContext*(this: Error): CppString
  {.header: "xapian/error.h", importcpp: "#.get_context()".}
proc getErrorString*(this: Error): cstring
  {.header: "xapian/error.h", importcpp: "#.get_error_string()".}
proc getDescription*(this: Error): CppString
  {.header: "xapian/error.h", importcpp: "#.get_description()".}
