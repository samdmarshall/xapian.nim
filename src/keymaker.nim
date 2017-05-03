
import "cpp/string.nim"

import "types.nim"
import "document.nim"

{.push header: "xapian/keymaker.h".}

type
  KeyMaker* {.importcpp: "Xapian::KeyMaker".} = object
  MultiValueKeyMaker* {.importcpp: "Xapian::MultiValueKeyMaker".} = KeyMaker

proc newKeyMaker*(): KeyMaker
  {.constructor, importcpp: "Xapian::KeyMaker()".}
proc newMultiValueKeyMaker*(): MultiValueKeyMaker
  {.constructor, importcpp: "Xapian::MultiValueKeyMaker".}

proc build*(this: KeyMaker, doc: Document): CppString
  {.importcpp: "#(@)".}

proc add*(this: MultiValueKeyMaker, slot: ValueNo, reverse: bool, defValue: CppString = CppString()): void
  {.importcpp: "#.add_value(@)".}

{.pop.}
