
import "types.nim"
import "cpp/string.nim"
import "termiterator.nim"
import "valueiterator.nim"

type
  Document* {.header: "xapian/document.h", importcpp: "Xapian::Document".} = object


proc newDocument*(): Document
  {.header: "xapian/document.h", constructor, importcpp: "Xapian::Document(@)".}

proc getValue*(this: Document, slot: valueno): CppString 
  {.header: "xapian/document.h", importcpp: "#.get_value(@)".}
proc addValue*(this: Document, slot: valueno, value: CppString): void 
  {.header: "xapian/document.h", importcpp: "#.add_value(@)".}
proc removeValue*(this: Document, slot: valueno): void 
  {.header: "xapian/document.h", importcpp: "#.remove_value(@)".}
proc clearValues*(this: Document): void 
  {.header: "xapian/document.h", importcpp: "#.clear_values()".}

proc getData*(this: Document): CppString 
  {.header: "xapian/document.h", importcpp: "#.get_data()".}
proc setData*(this: Document, data: CppString): void 
  {.header: "xapian/document.h", importcpp: "#.set_data(@)".}

proc addPosting*(this: Document, tname: CppString, tpos: termpos, wdfinc: termcount = 1): void 
  {.header: "xapian/document.h", importcpp: "#.add_posting(@)".}
proc addTerm*(this: Document, tname: CppString, wdfinc: termcount = 1): void
  {.header: "xapian/document.h", importcpp: "#.add_term(@)".}
proc addBooleanTerm*(this: Document, tname: CppString): void
  {.header: "xapian/document.h", importcpp: "#.add_boolean_term(@)".}
proc removePosting*(this: Document, tname: CppString, tpos: termpos, wdfinc: termcount = 1): void
  {.header: "xapian/document.h", importcpp: "#.remove_posting(@)".}
proc removeTerm*(this: Document, tname: CppString): void
  {.header: "xapian/document.h", importcpp: "#.remove_term(@)".}
proc clearTerms*(this: Document): void
  {.header: "xapian/document.h", importcpp: "#.clear_terms()".}

proc termlistCount*(this: Document): termcount
  {.header: "xapian/document.h", importcpp: "#.termlist_count()".}
proc termlistBegin*(this: Document): TermIterator
  {.header: "xapian/document.h", importcpp: "#.termlist_begin()".}
proc termlistEnd*(this: Document): TermIterator
  {.header: "xapian/document.h", importcpp: "#.termlist_end()".}

proc valuesCount*(this: Document): termcount
  {.header: "xapian/document.h", importcpp: "#.values_count()".}
proc valuesBegin*(this: Document): ValueIterator
  {.header: "xapian/document.h", importcpp: "#.values_begin()".}
proc valuesEnd*(this: Document): ValueIterator
  {.header: "xapian/document.h", importcpp: "#.values_end()".}

proc getDocId(this: Document): docid
  {.header: "xapian/document.h", importcpp: "#.get_docid()".}
proc serialise*(this: Document): CppString
  {.header: "xapian/document.h", importcpp: "#.serialise()".}
proc unserialise*(this: Document, data: CppString): Document
  {.header: "xapian/document.h", importcpp: "#.unserialize(@)".}
proc getDescription*(this: Document): CppString
  {.header: "xapian/document.h", importcpp: "#.get_description()".}
