
{.push header: "<set>".}

type
  CppSet* {.importcpp: "std::set".} = object

proc newCppSet*(): CppSet
  {.constructor importcpp: "std::set()".}

{.pop.}
