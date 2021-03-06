/* Converted to D from ../include/capi/cef_display_handler_capi.h by htod */
module cef_display_handler_capi;
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

//C     #ifndef CEF_INCLUDE_CAPI_CEF_DISPLAY_HANDLER_CAPI_H_
//C     #define CEF_INCLUDE_CAPI_CEF_DISPLAY_HANDLER_CAPI_H_
//C     #pragma once

//C     #include "include/capi/cef_base_capi.h"
import cef_base_capi;
//C     #include "include/capi/cef_browser_capi.h"
import cef_browser_capi;
//C     #include "include/capi/cef_frame_capi.h"

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif


///
// Implement this structure to handle events related to browser display state.
// The functions of this structure will be called on the UI thread.
///
//C     typedef struct _cef_display_handler_t {
  ///
  // Base structure.
  ///
//C       cef_base_t base;

  ///
  // Called when a frame's address has changed.
  ///
//C       void (CEF_CALLBACK *on_address_change)(struct _cef_display_handler_t* self,
//C           struct _cef_browser_t* browser, struct _cef_frame_t* frame,
//C           const cef_string_t* url);

  ///
  // Called when the page title changes.
  ///
//C       void (CEF_CALLBACK *on_title_change)(struct _cef_display_handler_t* self,
//C           struct _cef_browser_t* browser, const cef_string_t* title);

  ///
  // Called when the browser is about to display a tooltip. |text| contains the
  // text that will be displayed in the tooltip. To handle the display of the
  // tooltip yourself return true (1). Otherwise, you can optionally modify
  // |text| and then return false (0) to allow the browser to display the
  // tooltip. When window rendering is disabled the application is responsible
  // for drawing tooltips and the return value is ignored.
  ///
//C       int (CEF_CALLBACK *on_tooltip)(struct _cef_display_handler_t* self,
//C           struct _cef_browser_t* browser, cef_string_t* text);

  ///
  // Called when the browser receives a status message. |value| contains the
  // text that will be displayed in the status message.
  ///
//C       void (CEF_CALLBACK *on_status_message)(struct _cef_display_handler_t* self,
//C           struct _cef_browser_t* browser, const cef_string_t* value);

  ///
  // Called to display a console message. Return true (1) to stop the message
  // from being output to the console.
  ///
//C       int (CEF_CALLBACK *on_console_message)(struct _cef_display_handler_t* self,
//C           struct _cef_browser_t* browser, const cef_string_t* message,
//C           const cef_string_t* source, int line);
//C     } cef_display_handler_t;
struct _cef_display_handler_t
{
    cef_base_t base;
    void  function(_cef_display_handler_t *self, _cef_browser_t *browser, _cef_frame_t *frame, cef_string_t *url)on_address_change;
    void  function(_cef_display_handler_t *self, _cef_browser_t *browser, cef_string_t *title)on_title_change;
    int  function(_cef_display_handler_t *self, _cef_browser_t *browser, cef_string_t *text)on_tooltip;
    void  function(_cef_display_handler_t *self, _cef_browser_t *browser, cef_string_t *value)on_status_message;
    int  function(_cef_display_handler_t *self, _cef_browser_t *browser, cef_string_t *message, cef_string_t *source, int line)on_console_message;
}
extern (C):
alias _cef_display_handler_t cef_display_handler_t;


//C     #ifdef __cplusplus
//C     }
//C     #endif

//C     #endif  // CEF_INCLUDE_CAPI_CEF_DISPLAY_HANDLER_CAPI_H_
