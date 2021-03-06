/* Converted to D from ../include/capi/cef_process_message_capi.h by htod */
module cef_process_message_capi;
// Copyright (c) 2014 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

//C     #ifndef CEF_INCLUDE_CAPI_CEF_PROCESS_MESSAGE_CAPI_H_
//C     #define CEF_INCLUDE_CAPI_CEF_PROCESS_MESSAGE_CAPI_H_
//C     #pragma once

//C     #include "include/capi/cef_base_capi.h"
import cef_base_capi;
//C     #include "include/capi/cef_values_capi.h"
import cef_values_capi;

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


///
// Structure representing a message. Can be used on any process and thread.
///
//C     typedef struct _cef_process_message_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Returns true (1) if this object is valid. Do not call any other functions
  // if this function returns false (0).
  ///
//C       int (CEF_CALLBACK *is_valid)(struct _cef_process_message_t* self);

  ///
  // Returns true (1) if the values of this object are read-only. Some APIs may
  // expose read-only objects.
  ///
//C       int (CEF_CALLBACK *is_read_only)(struct _cef_process_message_t* self);

  ///
  // Returns a writable copy of this object.
  ///
//C       struct _cef_process_message_t* (CEF_CALLBACK *copy)(
//C           struct _cef_process_message_t* self);

  ///
  // Returns the message name.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
//C       cef_string_userfree_t (CEF_CALLBACK *get_name)(
//C           struct _cef_process_message_t* self);

  ///
  // Returns the list of arguments.
  ///
//C       struct _cef_list_value_t* (CEF_CALLBACK *get_argument_list)(
//C           struct _cef_process_message_t* self);
//C     } cef_process_message_t;
struct _cef_process_message_t
{
    cef_base_t base;
    int  function(_cef_process_message_t *self)is_valid;
    int  function(_cef_process_message_t *self)is_read_only;
    _cef_process_message_t * function(_cef_process_message_t *self)copy;
    cef_string_userfree_t  function(_cef_process_message_t *self)get_name;
    _cef_list_value_t * function(_cef_process_message_t *self)get_argument_list;
}
extern (C):
alias _cef_process_message_t cef_process_message_t;


///
// Create a new cef_process_message_t object with the specified name.
///
//C     CEF_EXPORT cef_process_message_t* cef_process_message_create(
//C         const cef_string_t* name);
cef_process_message_t * cef_process_message_create(cef_string_t *name);


//C     #ifdef __cplusplus
//C     }
//C     #endif

//C     #endif  // CEF_INCLUDE_CAPI_CEF_PROCESS_MESSAGE_CAPI_H_
