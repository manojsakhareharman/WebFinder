module Globalized
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def need_translation(*locales)
      all - with_translations(*locales)
    end
  end

end
