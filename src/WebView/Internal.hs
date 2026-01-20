module WebView.Internal (WebView (..)) where

import Foreign.Ptr (Ptr)

newtype WebView = WebView (Ptr ())
