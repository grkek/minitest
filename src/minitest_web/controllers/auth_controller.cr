require "grip"

module Minitest
  module Web
    module Controllers
      class AuthController < Grip::Controllers::Http
        def sign_up(context : Context) : Context
          first_name = 
            context
              .fetch_json_params
              .["first_name"]
              .to_s
              .valid?(:name)

          last_name = 
            context
              .fetch_json_params
              .["last_name"]
              .to_s
              .valid?(:name)

          email = 
            context
              .fetch_json_params
              .["email"]
              .to_s
              .valid?(:email)

          password = 
            context
              .fetch_json_params
              .["password"]
              .to_s
              .valid?(:password)

          context
            .json(
              content: {
                first_name: first_name,
                last_name: last_name,
                email: email,
                password: password,
              }
            )
        end

        def sign_in(context : Context) : Context
          context
            .json(
              content: {

              } of String => String
            )
        end

        def sign_out(context : Context) : Context
          context
            .json(
              content: {

              } of String => String
            )
        end
      end
    end
  end
end    