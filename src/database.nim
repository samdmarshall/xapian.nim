
import "cpp/string.nim"
import "cpp/ostream.nim"

import "types.nim"
import "document.nim"
import "compactor.nim"
import "termiterator.nim"
import "valueiterator.nim"
import "postingiterator.nim"

type
  Database* {.header: "xapian/database.h", importcpp: "Xapian::Database".} = object
  WritableDatabase* {.header: "xapian/database.h", importcpp: "Xapian::WritableDatabase".} = Database

proc newDatabase*(): Database 
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::Database()".}
proc newDatabase*(path: CppString, flags: cint): Database
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::Database(@)".}
proc newDatabase*(fd: cint, flags: cint): Database
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::Database(@)".}

proc newWritableDatabase*(): WritableDatabase
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::WritableDatabase()".}
proc newWritableDatabase*(path: CppString, flags: cint): WritableDatabase
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::WritableDatabase(@)".}
proc newWritableDatabase*(fd: cint, flags: cint): WritableDatabase
  {.header: "xapian/database.h", constructor, importcpp: "Xapian::WritableDatabase(@)".}

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

proc getDocument*(this: Database, did: DocId): Document
  {.header: "xapian/database.h", importcpp: "#.get_document(@)".}
proc getDocument*(this: Database, did: DocId, flags: cuint): Document
  {.header: "xapian/database.h", importcpp: "#.get_document(@)".}

proc getSpellingSuggestion*(this: Database, word: CppString, distance: cuint = 2): CppString
  {.header: "xapian/database.h", importcpp: "#.get_spelling_suggestion(@)".}

proc spellingsBegin*(this: Database, term: CppString): TermIterator
  {.header: "xapian/database.h", importcpp: "#.spellings_begin(@)".}
proc spellingsEnd*(this: Database, term: CppString): TermIterator
  {.header: "xapian/database.h", importcpp: "#.spellings_end(@)".}

proc synonymKeysBegin*(this: Database, prefix: CppString = newCppString("")): TermIterator
  {.header: "xapian/database.h", importcpp: "#.synonym_keys_begin(@)".}
proc synonymKeysEnd*(this: Database, prefix: CppString = newCppString("")): TermIterator
  {.header: "xapian/database.h", importcpp: "#.synonym_keys_end(@)".}

proc getMetadata*(this: Database, key: CppString): CppString
  {.header: "xapian/database.h", importcpp: "#.get_metadata(@)".}
proc metadataKeysBegin*(this: Database, prefix: CppString = newCppString("")): TermIterator
  {.header: "xapian/database.h", importcpp: "#.metadata_keys_begin(@)".}
proc metadataKeysEnd*(this: Database, prefix: CppString = newCppString("")): TermIterator
  {.header: "xapian/database.h", importcpp: "#.metadata_keys_end(@)".}

proc getUuid*(this: Database): CppString 
  {.header: "xapian/database.h", importcpp: "#.get_uuid()".}

proc locked*(this: Database): bool
  {.header: "xapian/database.h", importcpp: "#.locked()".}

proc getRevision*(this: Database): Rev
  {.header: "xapian/database.h", importcpp: "#.get_revision()".}

proc check*(this: Database, path: CppString, opts: cint): cint
  {.header: "xapian/database.h", importcpp: "#.check(@)".}
proc check*(this: Database, fd: cint, opts: cint): cint
  {.header: "xapian/database.h", importcpp: "#.check(@)".}

proc compact*(this: Database, output: CppString, flags: cuint = 0, block_size: cint = 0): void
  {.header: "xapian/database.h", importcpp: "#.compact(@)".}
proc compact*(this: Database, fd: cint, flags: cuint = 0, block_size: cint = 0): void
  {.header: "xapian/database.h", importcpp: "#.compact(@)".}
proc compact*(this: Database, output: CppString, flags: cuint = 0, block_size: cint = 0, compactor: Compactor): void
  {.header: "xapian/database.h", importcpp: "#.compact(@)".}
proc compact*(this: Database, fd: cint, flags: cuint = 0, block_size: cint = 0, compactor: Compactor): void
  {.header: "xapian/database.h", importcpp: "#.compact(@)".}

proc commit*(this: WritableDatabase): void
  {.header: "xapian/database.h", importcpp: "#.commit()".}
proc beginTransaction*(this: WritableDatabase, flush: bool): void
  {.header: "xapian/database.h", importcpp: "#.begin_transaction(@)".}
proc commitTransation*(this: WritableDatabase): void
  {.header: "xapian/database.h", importcpp: "#.commit_transaction()".}
proc cancelTransation*(this: WritableDatabase): void
  {.header: "xapian/database.h", importcpp: "#.cancel_transaction()".}

proc addDocument*(this: WritableDatabase, document: Document): DocId
  {.header: "xapian/database.h", importcpp: "#.add_document(@)".}
proc removeDocument*(this: WritableDatabase, did: DocId): void
  {.header: "xapian/database.h", importcpp: "#.delete_document(@)".}
proc removeDocument*(this: WritableDatabase, term: CppString): void
  {.header: "xapian/database.h", importcpp: "#.delete_document(@)".}
proc replaceDocument*(this: WritableDatabase, did: DocId, document: Document): void
  {.header: "xapian/database.h", importcpp: "#.replace_document(@)".}
proc replaceDocument*(this: WritableDatabase, term: CppString, document: Document): void
  {.header: "xapian/database.h", importcpp: "#.replace_document(@)".}

proc addSpelling*(this: WritableDatabase, word: CppString, freq: cint = 1): void
  {.header: "xapian/database.h", importcpp: "#.add_spelling(@)".}
proc removeSpelling*(this: WritableDatabase, word: CppString, freq: cint = 1): void
  {.header: "xapian/database.h", importcpp: "#.remove_spelling(@)".}

proc addSynonym*(this: WritableDatabase, term: CppString, synonym: CppString): void
  {.header: "xapian/database.h", importcpp: "#.add_synonym(@)".}
proc removeSynonym*(this: WritableDatabase, term: CppString, synonym: CppString): void
  {.header: "xapian/database.h", importcpp: "#.remove_synonym(@)".}
proc clearSynonyms*(this: WritableDatabase, term: CppString): void
  {.header: "xapian/database.h", importcpp: "#.clear_synonyms(@)".}
proc setMetadata*(this: WritableDatabase, key: CppString, value: CppString): void
  {.header: "xapian/database.h", importcpp: "#.set_metadata(@)".}
