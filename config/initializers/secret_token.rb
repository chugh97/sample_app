# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '3661bd80a72c0a297769275605ab74e1f30b7012ea50a5374d2af3f81aa86d78ac98197a903cd605a9ca82d41923e3ea0a0f15cefbc370253e40bfb8272bed2f'
requires 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if file.exist?(token_file)
      File.read(token_file).chomp
  else
      token = SecureRandom.hex(64)
      File.write(token_file, token)
      token
  end
      
end

SampleApp::Application.config.secret_key_base = secure_token

