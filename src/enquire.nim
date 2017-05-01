
import "eset.nim"
import "mset.nim"
import "query.nim"
import "types.nim"
import "weight.nim"
import "database.nim"
import "keymaker.nim"
import "matchspy.nim"
import "termiterator.nim"
import "expanddecider.nim"

{.push header: "xapian/enquire.h".}

type
  RSet* {.importcpp: "Xapian::RSet".} = object
  MatchDecider* {.importcpp: "Xapian::MatchDecider".} = object
  Enquire* {.importcpp: "Xapian::Enquire".} = object

  DocID_Order* {.importcpp: "docid_order".} = enum
    ASCENDING = 1
    DESCENDING = 0
    DONT_CARE = 2

proc newRSet*(): RSet
  {.constructor, importcpp: "Xapian::RSet()".}
proc size*(this: RSet): DocCount
  {.importcpp: "#.size()".}
proc empty*(this: RSet): bool
  {.importcpp: "#.empty()".}
proc addDocument*(this: RSet, did: DocId): void
  {.importcpp: "#.add_document(@)".}
proc addDocument*(this: RSet, iter: MSetIterator): void
  {.importcpp: "#.add_document(@)".}
proc removeDocument*(this: RSet, did: DocId): void
  {.importcpp: "#.remove_document(@)".}
proc removeDocument*(this: RSet, iter: MSetIterator): void
  {.importcpp: "#.remove_document(@)".}
proc contains*(this: RSet, did: DocId): bool
  {.importcpp: "#.contains(@)".}
proc contains*(this: RSet, iter: MSetIterator): bool
  {.importcpp: "#.contains(@)".}
proc getDescription*(this: RSet): CppString
  {.importcpp: "#.get_description()".}

proc newMatchDecider*(): MatchDecider
  {.constructor, importcpp: "Xapian::MatchDecider()".}
proc `try`*(this: MatchDecider, did: DocId): bool
  {.importcpp: "#(@)".}

proc newEnquire*(): Enquire
  {.constructor, importcpp: "Xapian::Enquire()".}
proc newEnquire*(database: Database): Enquire
  {.constructor, importcpp: "Xapian::Enquire(@)".}
proc setQuery*(this: Enquire, query: Query, length: TermCount): void
  {.importcpp: "#.set_query(@)".}
proc getQuery*(this: Enquire): Query
  {.importcpp: "#.get_query()".}

proc addMatchSpy*(this: Enquire, spy: MatchSpy): void
  {.importcpp: "#.add_matchspy(@)".}
proc clearMatchSpies*(this: Enquire): void
  {.importcpp: "#.clear_matchspies()".}

proc setWeighingScheme*(this: Enquire, weight: Weight): void
  {.importcpp: "#.set_weighing_scheme(@)".}
proc setExpansionScheme*(this: Enquire, weight_name: CppString, expand: cdouble = 1.0): void
  {.importcpp: "#.set_expansion_scheme(@)".}
proc setCollapseKey*(this: Enquire, collapse_key: ValueNo, max_collapse: DocCount = 1): void
  {.importcpp: "#.set_collapse_key(@)".}
proc setDocIdOrder*(this: Enquire, order: DocId_Order): void
  {.importcpp: "#.set_docid_order(@)".}
proc setCutoff*(this: Enquire, percent_cutoff: cint, weight_cutoff: cdouble = 1.0): void
  {.importcpp: "#.set_cutoff(@)".}

proc setSortByRelevance*(this: Enquire): void
  {.importcpp: "#.set_sort_by_relevance()".}
proc setSortByValue*(this: Enquire, sort_key: ValueNo, reverse: bool): void
  {.importcpp: "#.set_sort_by_value(@)".}
proc setSortByKey*(this: Enquire, sorter: KeyMaker, reverse: bool): void
  {.importcpp: "#.set_sort_by_key(@)".}
proc setSortByValueThenByRelevance*(this: Enquire, sort_key: ValueNo, reverse: bool): void
  {.importcpp: "#.set_sort_by_value_then_relevance(@)".}
proc setSortByKeyThenByRelevance*(this: Enquire, sorter: KeyMaker, reverse: bool): void
  {.importcpp: "#.set_sort_by_key_then_relevance(@)".}
proc setSortByRelevanceThenByValue*(this: Enquire, sort_key: ValueNo, reverse: bool): void
  {.importcpp: "#.set_sort_by_relevance_then_value(@)".}
proc setSortByRelevanceThenByKey*(this: Enquire, sorter: KeyMaker, reverse: bool): void
  {.importcpp: "#.set_sort_by_relevance_then_key(@)".}

proc setTimeLimit*(this: Enquire, time: cdouble): void
  {.importcpp: "#.set_time_limit(@)".}

proc getMSet*(this: Enquire, first: DocCount, maxitems: DocCount, checkatlast: DocCount = 0): MSet
  {.importcpp: "#.get_mset(@)".}
proc getMSet*(this: Enquire, first: DocCount, maxitems: DocCount, ormset: RSet): MSet
  {.importcpp: "#.get_mset(@)".}

proc getESet*(this: Enquire, maxitems: TermCount, ormset: RSet, flags: ESet_Query_Flags, edecider: ExpandDecider, min_wt: cdouble = 0): ESet
  {.importcpp: "#.get_eset(@)".}
proc getESet*(this: Enquire, maxitems: TermCount, ormset: RSet, edecider: ExpandDecider): ESet
  {.importcpp: "#.get_eset(@)".}

proc getMatchingTermsBegin*(this: Enquire, did: DocId): TermIterator
  {.importcpp: "#.get_matching_terms_begin(@)".}
proc getMatchingTermsBegin*(this: Enquire, iter: MSetIterator): TermIterator
  {.importcpp: "#.get_matching_terms_begin(@)".}
proc getMatchingTermsEnd*(this: Enquire, did: DocId): TermIterator
  {.importcpp: "#.get_matching_terms_end(@)".}
proc getMatchingTermsEnd*(this: Enquire, iter: MSetIterator): TermIterator
  {.importcpp: "#.get_matching_terms_end(@)".}

proc getDescription*(this: Enquire): CppString
  {.importcpp: "#.get_description()".}

{.pop.}
