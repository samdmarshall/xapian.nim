/** @file errorhandler.h
 * @brief Decide if a Xapian::Error exception should be ignored.
 */
/* Copyright (C) 2003,2006,2007,2012,2013,2014,2016 Olly Betts
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
 */

#ifndef XAPIAN_INCLUDED_ERRORHANDLER_H
#define XAPIAN_INCLUDED_ERRORHANDLER_H

#include <xapian/attributes.h>
#include <xapian/deprecated.h>
#include <xapian/intrusive_ptr.h>
#include <xapian/visibility.h>

namespace Xapian {

class Error;

/** Decide if a Xapian::Error exception should be ignored.
 *
 *  You can create your own subclass of this class and pass in an instance
 *  of it when you construct a Xapian::Enquire object.  Xapian::Error
 *  exceptions which happen during the match process are passed to this
 *  object and it can decide whether they should propagate or whether
 *  Enquire should attempt to continue.
 *
 *  The motivation is to allow searching over remote databases to handle a
 *  remote server which has died (both to allow results to be returned, and
 *  also so that such errors can be logged and dead servers temporarily removed
 *  from use).
 */
class ErrorHandler
    : public Xapian::Internal::opt_intrusive_base {
    /// Don't allow assignment.
    void operator=(const ErrorHandler &);

    /// Don't allow copying.
    ErrorHandler(const Xapian::ErrorHandler &);

  public:
    /// Default constructor.
    ErrorHandler() {}

    /// We require a virtual destructor because we have virtual methods.
    virtual ~ErrorHandler();

    /** Handle a Xapian::Error object.
     *
     *  This method is called when a Xapian::Error object is thrown and
     *  caught inside Enquire.  If this is the first ErrorHandler that
     *  the Error has been passed to, then the handle_error() virtual
     *  method is called, which allows the API user to decide how to
     *  handle the error.
     *
     *  @param error	The Xapian::Error object under consideration.
     */
    void operator()(Xapian::Error &error);

    /** Start reference counting this object.
     *
     *  You can hand ownership of a dynamically allocated ErrorHandler
     *  object to Xapian by calling release() and then passing the object to a
     *  Xapian method.  Xapian will arrange to delete the object once it is no
     *  longer required.
     */
    ErrorHandler * release() {
	opt_intrusive_base::release();
	return this;
    }

    /** Start reference counting this object.
     *
     *  You can hand ownership of a dynamically allocated ErrorHandler
     *  object to Xapian by calling release() and then passing the object to a
     *  Xapian method.  Xapian will arrange to delete the object once it is no
     *  longer required.
     */
    const ErrorHandler * release() const {
	opt_intrusive_base::release();
	return this;
    }
};

}

#endif /* XAPIAN_INCLUDED_ERRORHANDLER_H */
