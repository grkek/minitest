require "grip"

require "./minitest_web/extensions/**"
require "./minitest_web/**"

module Minitest
  class Application < Grip::Application
    alias Controllers = Minitest::Web::Controllers
    alias Pipes = Minitest::Web::Pipes

    def routes
      pipeline :api, [
        ::Pipes::PoweredByHeader.new
      ]

      pipeline :authentication, [
        ::Pipes::Jwt.new(secret_key: "gM85YK_cXWffOYaBI_faXD8FS67h2_Q9sJtTqMD2txhLqUYvhoBajXQaRK2ddOBC8SgFL1Mbda1apEHXs2VkF76m5N1DeQ3o7ow12csiHOQCsMJiTnCoEFZsyF962kKo81EWoxhFspqLj5R2_YX42KFO8wPywPbzwUiHgeX7wvlC-NEK_qvtInw6bXIzi9aEbr4q6hN3JBGKJMzBFPy0R8eyEe-0hjA416fhehUJCodJj6OTCfgB0OpM-SrgTqjlUj09z3ku4P71KH3ft9R6GkM0sXZ1yqYM1bbWc_Du1z-2ouIzZysb4O6FKwy7_MPKesQLJstmyb_sSa-1vrghjQ"),
        Pipes::CurrentUser.new
      ]

      scope "/api" do
        pipe_through :api

        scope "/auth" do
          post "/signup", Controllers::AuthController, as: :sign_up
          post "/signin", Controllers::AuthController, as: :sign_in
          post "/signout", Controllers::AuthController, as: :sign_out
        end
  
        scope "/users" do
          pipe_through :authentication

          get "/", Controllers::UserController, as: :index
          get "/:id/", Controllers::UserController, as: :show
        end
      end
    end
  end
end

app = Minitest::Application.new
app.run