
import "types.nim"
import "cpp/string.nim"
import "termiterator.nim"
import "valueiterator.nim"
import "postingiterator.nim"

type
  Database* {.header: "xapian/database.h", importcpp: "Xapian::Database".} = object

proc newDatabase*(): Database 
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::Database()".}
proc newDatabase*(path: CppString, flags: cint): Database
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::Database(@)".}
proc newDatabase*(fd: cint, flags: cint): Database
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::Database(@)".}

proc addDatabase(this: Database, add: Database): void
  {.header: "xapian/database.h", importcpp: "#.add_database(@)".}
proc reOpen*(this: Database): bool
  {.header: "xapian/database.h", importcpp: "#.reopen()".}
proc close*(this: Database): void
  {.header: "xapian/database.h", importcpp: "#.close()".}
proc getDescription*(this: Database): CppString
  {.header: "xapian/database.h", importcpp: "#.get_description()".}

proc postlistBegin*(this: Database, tname: CppString): PostingIterator
  {.header: "xapian/database.h", importcpp: "#.postlist_begin(@)".}
proc postlistEnd*(this: Database, tname: CppString): PostingIterator
  {.header: "xapian/database.h", importcpp: "#.postlist_end(@)".}

proc termlistBegin*(this: Database, did: docid): TermIterator
  {.header: "xapian/database.h", importcpp: "#.termlist_begin(@)".}
proc termlistEnd*(this: Database, did: docid): TermIterator
  {.header: "xapian/database.h", importcpp: "#.termlist_end(@)".}

proc hasPositions*(this: Database): bool
  {.header: "xapian/database.h", importcpp: "#.has_positions()".}
proc positionlistBegin*(this: Database, did: docid, tname: CppString): TermIterator
  {.header: "xapian/database.h", importcpp: "#.positionlist_begin(@)".}
proc positionlistEnd*(this: Database, did: docid, tname: CppString): TermIterator
  {.header: "xapian/database.h", importcpp: "#.positionlist_end(@)".}

proc alltermsBegin*(this: Database, prefix: CppString = newCppString("")): TermIterator
  {.header: "xapian/database.h", importcpp: "#.allterms_begin(@)".}
proc alltermsEnd*(this: Database, prefix: CppString = newCppString("")): TermIterator
  {.header: "xapian/database.h", importcpp: "#.alterms_end(@)".}
  
proc getDocumentCount*(this: Database): DocCount
  {.header: "xapian/database.h", importcpp: "#.get_doccount()".}
proc getLastDocumentId*(this: Database): DocId
  {.header: "xapian/database.h", importcpp: "#.get_lastdocid()".}
proc getAverageLength*(this: Database): DocLength
  {.header: "xapian/database.h", importcpp: "#.get_avlength()".}
proc getTermFrequency*(this: Database, tname: CppString): DocCount
  {.header: "xapian/database.h", importcpp: "#.get_termfreq(@)".}
proc termExists*(this: Database, tname: CppString): bool
  {.header: "xapian/database.h", importcpp: "#.term_exists(@)".}
proc termCollectionFrequency*(this: Database, tname: CppString): TermCount
  {.header: "xapian/database.h", importcpp: "#.term_collection_freq(@)".}
proc getValueFrequency*(this: Database, slot: ValueNo): DocCount
  {.header: "xapian/database.h", importcpp: "#.get_value_freq(@)".}
proc getValueLowerBound*(this: Database, slot: ValueNo): CppString
  {.header: "xapian/database.h", importcpp: "#.get_value_lower_bound(@)".}
proc getValueUpperBound*(this: Database, slot: ValueNo): CppString
  {.header: "xapian/database.h", importcpp: "#.get_value_upper_bound(@)".}
proc getDocumentLengthLowerBound*(this: Database): TermCount
  {.header: "xapian/database.h", importcpp: "#.get_doclength_lower_bound()".}
proc getDocumentLengthUpperBound*(this: Database): TermCount
  {.header: "xapian/database.h", importcpp: "#.get_doclength_upper_bound()".}
proc getWdfUpperBound*(this: Database, tname: CppString): TermCount
  {.header: "xapian/database.h", importcpp: "#.get_wdf_upper_bound(@)".}

proc valuestreamBegin*(this: Database, slot: ValueNo): ValueIterator
  {.header: "xapian/database.h", importcpp: "#.valuestream_begin(@)".}
proc valuestreamEnd*(this: Database, slot: ValueNo): ValueIterator
  {.header: "xapian/database.h", importcpp: "#.valuestream_end(@)".}

proc getDocumentLength*(this: Database, did: DocId): TermCount
  {.header: "xapian/database.h", importcpp: "#.get_doclength(@)".}
proc getUniqueTerms*(this: Database, did: DocId): TermCount
  {.header: "xapian/database.h", importcpp: "#.get_unique_terms(@)".}

proc keepAlive*(this: Database): void
  {.header: "xapian/database.h", importcpp: "#.keep_alive()".}


