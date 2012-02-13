module Ddb
  module Userstamp
    module Stampable
      def self.included(base)
        super

        base.extend(ClassMethods)
        base.class_eval do
          include InstanceMethods
          self.stampable
        end
      end

      module ClassMethods
        def stampable
          class_eval do
            belongs_to :creator, :class_name => 'User',
                                 :foreign_key => :creator_id

            belongs_to :updater, :class_name => 'User',
                                 :foreign_key => :updater_id

            before_save     :set_updater_attribute
            before_create   :set_creator_attribute
          end
        end
      end

      module InstanceMethods

      private
        def has_stamper?
          !User.stamper.nil?
        end

        def set_creator_attribute
          if respond_to?(:creator=) && has_stamper?
            self.creator = User.stamper
          end
        end

        def set_updater_attribute
          if respond_to?(:updater=) && has_stamper?
            self.updater = User.stamper
          end
        end
      end
    end
  end
end