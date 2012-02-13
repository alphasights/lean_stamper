module Ddb #:nodoc:
  module Userstamp
    module Stamper
      def self.included(base) # :nodoc:
        base.extend(Ddb::Userstamp::Stamper::ClassMethods)
      end

      module ClassMethods
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