module GlobalizeExtensions
  module ActiveRecord
    module ClassMethods

      def without_translations(*locales)
        all - with_translations(*locales)
      end

      def updated_but_not_translated(*locales)
        with_translations(*locales).where("#{table_name}.updated_at > #{translations_table_name}.updated_at")
      end

      def needing_translations(*locales)
        updated_but_not_translated(*locales) + without_translations(*locales)
      end

    end
  end
end

