
const
  XAPIAN_VERSION* = "1.4.3"

  XAPIAN_MAJOR_VERSION* = 1
  XAPIAN_MINOR_VERSION* = 4
  XAPIAN_REVISION* = 3

type
  XAPIAN_DOCID_BASE_TYPE* = cint
  XAPIAN_TERMCOUNT_BASE_TYPE* = cint
  XAPIAN_REVISION_TYPE* = culong

template XAPIAN_AT_LEAST*(a: cint, b: cint, c: cint): bool =
  return (XAPIAN_MAJOR_VERSION > (a) or \
   (XAPIAN_MAJOR_VERSION == (a) and \
   (XAPIAN_MINOR_VERSION > (b) or \
   (XAPIAN_MINOR_VERSION == (b) and XAPIAN_REVISION >= (c)))))
