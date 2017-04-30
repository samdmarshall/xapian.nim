
type
  CppString* {.header: "string", importcpp: "std::string".} = object

proc newCppString*(str: cstring): CppString {.constructor, header: "string", importcpp: "std::string(@)".}

proc `$`*(this: CppString): cstring
  {.header: "string", importcpp: "#.c_str()".}
