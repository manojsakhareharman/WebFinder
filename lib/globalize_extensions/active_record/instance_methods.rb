module GlobalizeExtensions
  module ActiveRecord
    module InstanceMethods

      # Ensure the parent object gets its 'udpated_at' flag touched
      # so that we can identify which records need translating
      def save(*)
        unless new_record?
          touch if translation.locale == I18n.default_locale
        end
        super
      end

      def needs_translation?(locale)
        !self.class.needing_translations(locale).include?(self)
      end

    end
  end
end
