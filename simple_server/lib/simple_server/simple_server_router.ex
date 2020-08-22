defmodule SimpleServer.Router do
    use Plug.Router
    use Plug.Debugger
    require Logger
  plug(Plug.Logger, log: :debug)
  
  
  plug(:match)
  
  plug(:dispatch)
  
  
  # This route will only be “matched” when an incoming request’s path is /hello ,it will send a response of 200 OK and send back the text “Hello World!”.
  get "/hello" do
    send_resp(conn, 200, "Hello World!")
end


  # This route will only be “matched” when an incoming request’s path is /hello/:param ,it will send a response of 200 OK and send back the text “Hello :param”.


get "/hello/:param" do
  send_resp(conn, 200, " Hello #{param} ") 
end



# Default route that will get called when no other route is matched

match _ do

send_resp(conn, 404, "not found")

end
  
end

