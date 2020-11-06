require "grip"

module Minitest
  module Web
    module Controllers
      class UserController < Grip::Controllers::Http
        def index(context : Context) : Context
          context
            .json(
              content: {

              } of String => String
            )
        end

        def show(context : Context) : Context
          id =
            context
              .fetch_path_params
              .["id"]
      
          context
            .json(
              content: {
                id: id
              }
            )
        end
      end
    end
  end
end    