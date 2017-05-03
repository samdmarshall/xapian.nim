
{.push header: "<string>".}

type
  CppString* {.importcpp: "std::string".} = object

proc newCppString*(str: cstring): CppString 
  {.constructor, importcpp: "std::string(@)".}

proc `$`*(this: CppString): cstring
  {.importcpp: "#.c_str()".}

{.pop.}
