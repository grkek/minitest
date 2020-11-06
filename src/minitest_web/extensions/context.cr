module Grip
  module Extensions
    module Context
      struct Assigns
        property ip : String?
        property basic : String?
        property jwt : JSON::Any?

        property current_user : String?
      end
    end
  end
end