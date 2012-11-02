module Simcity
  class Actor

    def resource_type
      nil
    end

    def offer? resource
      resource_type == resource
    end

    class Power < Actor
      def resource_type
        :power
      end
    end
  end
end
