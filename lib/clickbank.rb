require 'base64'
require 'digest/sha1'
require 'json'
require 'openssl'

module Clickbank
  def self.decryptor
    self
  end

  # Decode the IPN post into a JSON object. The message param is the raw HTTP POST
  # body of the notification

  def self.decrypt_notification(message:, secret_key:)
    parsed = JSON.parse(message)
    aes = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
    aes.iv = Base64.decode64(parsed['iv'])
    aes.decrypt
    aes.key = Digest::SHA1.hexdigest(secret_key).slice(0, 32)
    aes.update(Base64.decode64(parsed['notification'])) + aes.final
  end
end
