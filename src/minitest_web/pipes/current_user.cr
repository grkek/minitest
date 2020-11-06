require "grip"
require "http/server"

module Minitest
  module Web
    module Pipes
      class CurrentUser < ::Pipes::Base
        def call(context : HTTP::Server::Context) : HTTP::Server::Context
          # Get the subject field of the decoded payload of a JWT token.
          subject = context.assigns.jwt.not_nil!["sub"]
          begin
            # Find the user in the database and assign it to the current_user extension.
            context.assigns.current_user = subject.to_s
            
            context
          rescue exception
            # Raise a bad request error if the user does not exist.
            raise Exceptions::BadRequest.new
          end
        end
      end
    end
  end
end