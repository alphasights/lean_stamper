module Ddb #:nodoc:
  module Userstamp
    module Stamper
      def self.included(base) # :nodoc:
        base.extend(ClassMethods)
      end

      module ClassMethods
        def model_stamper
          # don't allow multiple calls
          return if self.included_modules.include?(Ddb::Userstamp::Stamper::InstanceMethods)
          send(:extend, Ddb::Userstamp::Stamper::InstanceMethods)
        end
      end

      module InstanceMethods
        # Used to set the stamper for a particular request. See the Userstamp module for more
        # details on how to use this method.
        def stamper=(object)
          Thread.current["#{self.to_s.downcase}_#{self.object_id}_stamper"] = object
        end

        # Retrieves the existing stamper for the current request.
        def stamper
          Thread.current["#{self.to_s.downcase}_#{self.object_id}_stamper"]
        end

        # Sets the stamper back to +nil+ to prepare for the next request.
        def reset_stamper
          Thread.current["#{self.to_s.downcase}_#{self.object_id}_stamper"] = nil
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, Ddb::Userstamp::Stamper) if defined?(ActiveRecord)