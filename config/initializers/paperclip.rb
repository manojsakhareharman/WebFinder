# monkeypatch to get around paperclip's horrible spoof detector
require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end

# Don't use the timestamp in the generated URLs
Paperclip::Attachment.default_options[:use_timestamp] = false

# Add support for timestamps in the stored file path
Paperclip.interpolates(:timestamp) do |attachment, style|
  attachment.instance_read(:updated_at).to_i
end

if Rails.env.test?
  Paperclip::Attachment.default_options.merge!( Rails.application.config.paperclip_default_storage )
end
