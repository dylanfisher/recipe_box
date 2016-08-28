# Disable spoof detection, at least temporarily to allow uploading svg's from the admin interface
require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
