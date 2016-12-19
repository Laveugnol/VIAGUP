require 'hello_sign'
HelloSign.configure do |config|
  # You might want to put all these keys in environment variables or you can YOLO it.
  config.api_key = ENV["HELLO_SIGN"]
  config.client_id = ENV["HELLO_SIGN_CLIENT"]
end
