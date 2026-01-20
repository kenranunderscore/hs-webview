module WebView.Extras (enableReloadShortcuts) where

import Foreign.C.String (CString, withCString)
import Foreign.Ptr (Ptr)

import WebView.Internal (WebView (..))

-- | Install Cmd/Ctrl+R and F5 shortcuts for the current and future pages.
-- Call this before 'navigate'/'setHtml' to affect the first load.
enableReloadShortcuts :: WebView -> IO ()
enableReloadShortcuts (WebView ptr) =
  withCString reloadShortcutScript (c_webview_init ptr)

foreign import ccall unsafe "webview_init"
  c_webview_init :: Ptr () -> CString -> IO ()

reloadShortcutScript :: String
reloadShortcutScript =
  unlines
    [ "(function () {"
    , "  if (window.__hsWebviewReloadShortcuts) return;"
    , "  window.__hsWebviewReloadShortcuts = true;"
    , "  window.addEventListener('keydown', function (event) {"
    , "    var isReload = (event.key === 'r' || event.key === 'R') &&"
    , "      (event.metaKey || event.ctrlKey);"
    , "    var isF5 = event.key === 'F5';"
    , "    if (isReload || isF5) {"
    , "      event.preventDefault();"
    , "      window.location.reload();"
    , "    }"
    , "  }, true);"
    , "})();"
    ]
