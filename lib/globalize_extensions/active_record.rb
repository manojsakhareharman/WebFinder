require "globalize_extensions/active_record/class_methods"
require "globalize_extensions/active_record/instance_methods"

module GlobalizeExtensions
  module ActiveRecord
  end
end

Globalize::ActiveRecord::ClassMethods.include GlobalizeExtensions::ActiveRecord::ClassMethods
Globalize::ActiveRecord::InstanceMethods.include GlobalizeExtensions::ActiveRecord::InstanceMethods
