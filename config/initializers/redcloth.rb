require "redcloth"
class ERB
  module Util
    def translate(s)
      if s && s.respond_to?(:to_s)
        I18n.t(s)
      end
    end

    alias t translate
    module_function :t
  end
end
