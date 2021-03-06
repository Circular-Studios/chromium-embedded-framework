// Copyright (c) 2012 The Chromium Embedded Framework Authors. All rights
// reserved. Use of this source code is governed by a BSD-style license that can
// be found in the LICENSE file.

#ifndef CEF_LIBCEF_BROWSER_BROWSER_INFO_H_
#define CEF_LIBCEF_BROWSER_BROWSER_INFO_H_
#pragma once

#include <set>

#include "libcef/browser/browser_host_impl.h"
#include "base/memory/ref_counted.h"

// CefBrowserInfo is used to associate a browser ID and render view/process
// IDs with a particular CefBrowserHostImpl. Render view/process IDs may change
// during the lifetime of a single CefBrowserHostImpl.
//
// CefBrowserInfo objects are managed by CefContentBrowserClient and should not
// be created directly.
class CefBrowserInfo : public base::RefCountedThreadSafe<CefBrowserInfo> {
 public:
  CefBrowserInfo(int browser_id, bool is_popup);
  virtual ~CefBrowserInfo();

  int browser_id() const { return browser_id_; };
  bool is_popup() const { return is_popup_; }
  bool is_window_rendering_disabled() const { 
      return is_window_rendering_disabled_;
  }

  void set_window_rendering_disabled(bool disabled);
  
  // Adds an ID pair if it doesn't already exist.
  void add_render_view_id(int render_process_id, int render_routing_id);
  void add_render_frame_id(int render_process_id, int render_routing_id);

  // Remove an ID pair if it exists.
  void remove_render_view_id(int render_process_id, int render_routing_id);
  void remove_render_frame_id(int render_process_id, int render_routing_id);

  // Returns true if this browser matches the specified ID pair.
  bool is_render_view_id_match(int render_process_id, int render_routing_id);
  bool is_render_frame_id_match(int render_process_id, int render_routing_id);

  CefRefPtr<CefBrowserHostImpl> browser();
  void set_browser(CefRefPtr<CefBrowserHostImpl> browser);

 private:
  typedef std::set<std::pair<int, int> > RenderIdSet;

  void add_render_id(RenderIdSet* id_set,
                     int render_process_id,
                     int render_routing_id);
  void remove_render_id(RenderIdSet* id_set,
                        int render_process_id,
                        int render_routing_id);
  bool is_render_id_match(const RenderIdSet* id_set,
                          int render_process_id,
                          int render_routing_id);

  int browser_id_;
  bool is_popup_;
  bool is_window_rendering_disabled_;

  base::Lock lock_;

  // The below members must be protected by |lock_|.

  // Set of mapped (process_id, routing_id) pairs. Keeping this set is
  // necessary for the following reasons:
  // 1. When navigating cross-origin the new (pending) RenderViewHost will be
  //    created before the old (current) RenderViewHost is destroyed.
  // 2. When canceling and asynchronously continuing navigation of the same URL
  //    a new RenderViewHost may be created for the first (canceled) navigation
  //    and then destroyed as a result of the second (allowed) navigation.
  // 3. Out-of-process iframes have their own render IDs which must also be
  //    associated with the host browser.
  RenderIdSet render_view_id_set_;
  RenderIdSet render_frame_id_set_;

  // May be NULL if the browser has not yet been created or if the browser has
  // been destroyed.
  CefRefPtr<CefBrowserHostImpl> browser_;

  DISALLOW_COPY_AND_ASSIGN(CefBrowserInfo);
};

#endif  // CEF_LIBCEF_BROWSER_BROWSER_INFO_H_
