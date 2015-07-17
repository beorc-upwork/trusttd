class Notification < ActiveRecord::Base
  serialize :payload, HashSerializer

  validates :payload, presence: true

  def product_name
    payload['lineItems'].first['productTitle']
  end

  def customer_name
    shipping_info['fullName']
  end

  def customer_email
    shipping_info['email']
  end

  def sale_date
    DateTime.parse(payload['transactionTime']).to_date
  end

  private

  def shipping_info
    payload['customer']['shipping']
  end
end
