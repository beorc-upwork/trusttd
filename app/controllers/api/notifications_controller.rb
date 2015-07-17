class Api::NotificationsController < ActionController::Base
  def create
    payload_json = Clickbank.decryptor.decrypt_notification(
      message: request.raw_post,
      secret_key: ENV['CLICKBANK_SECRET_KEY']
    )
    Notification.create!(payload: JSON.parse(payload_json))

    head :ok, content_type: 'text/html'
  end
end
