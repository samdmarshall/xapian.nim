
const
  DB_CREATE_OR_OPEN* {.header: "xapian/constants.h", importcpp: "Xapian::DB_CREATE_OR_OPEN".}: cint = 0x00
  DB_CREATE_OR_OVERWRITE* {.header: "xapian/constants.h", importcpp: "Xapian::DB_CREATE_OR_OVERWRITE".}: cint = 0x01
  DB_CREATE* {.header: "xapian/constants.h", importcpp: "Xapian::DB_CREATE".}: cint = 0x02
  DB_OPEN* {.header: "xapian/constants.h", importcpp: "Xapian::DB_OPEN".}: cint = 0x03
  DB_NO_SYNC* {.header: "xapian/constants.h", importcpp: "Xapian::DB_NO_SYNC".}: cint = 0x04
  DB_FULL_SYNC* {.header: "xapian/constants.h", importcpp: "Xapian::DB_FULL_SYNC".}: cint = 0x08
  DB_DANGEROUS* {.header: "xapian/constants.h", importcpp: "Xapian::DB_DANGEROUS".}: cint = 0x10
  DB_NO_TERMLIST* {.header: "xapian/constants.h", importcpp: "Xapian::DB_NO_TERMLIST".}: cint = 0x20
  DB_RETRY_LOCK* {.header: "xapian/constants.h", importcpp: "Xapian::DB_RETRY_LOCK".}: cint = 0x40
  DB_BACKEND_GLASS* {.header: "xapian/constants.h", importcpp: "Xapian::DB_BACKEND_GLASS".}: cint = 0x100
  DB_BACKEND_CHERT* {.header: "xapian/constants.h", importcpp: "Xapian::DB_BACKEND_CHERT".}: cint = 0x200
  DB_BACKEND_STUB* {.header: "xapian/constants.h", importcpp: "Xapian::DB_BACKEND_STUB".}: cint = 0x300
  DB_BACKEND_INMEMORY* {.header: "xapian/constants.h", importcpp: "Xapian::DB_BACKEND_INMEMORY".}: cint = 0x400

  DBCHECK_SHORT_TREE* {.header: "xapian/constants.h", importcpp: "Xapian::DBCHECK_SHORT_TREE".}: cint = 1
  DBCHECK_FULL_TREE* {.header: "xapian/constants.h", importcpp: "Xapian::DBCHECK_FULL_TREE".}: cint = 2
  DBCHECK_SHOW_FREELIST* {.header: "xapian/constants.h", importcpp: "Xapian::DBCHECK_SHOW_FREELIST".}: cint = 4
  DBCHECK_SHOW_STATS* {.header: "xapian/constants.h", importcpp: "Xapian::DBCHECK_SHOW_STATS".}: cint = 8
  DBCHECK_FIX* {.header: "xapian/constants.h", importcpp: "Xapian::DBCHECK_FIX".}: cint = 16

  DBCOMPACT_NO_RENUMBER* {.header: "xapian/constants.h", importcpp: "Xapian::DBCOMPACT_NO_RENUMBER".}: cint = 4
  DBCOMPACT_MULTIPASS* {.header: "xapian/constants.h", importcpp: "Xapian::DBCOMPACT_MULTIPASS".}: cint = 8
  DBCOMPACT_SINGLE_FILE* {.header: "xapian/constants.h", importcpp: "Xapian::DBCOMPACT_SINGLE_FILE".}: cint = 16

  DOC_ASSUME_VALID* {.header: "xapian/constants.h", importcpp: "Xapian::DOC_ASSUME_VALID".}: cint = 1
