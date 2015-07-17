require 'rails_helper'

RSpec.describe Notification, type: :model do
  fixtures :notifications

  let(:notification) { notifications(:test) }
  subject { notification }

  it { should validate_presence_of(:payload) }
  it { should be_valid }

  its(:product_name) { should eq 'Product Title' }
  its(:customer_name) { should eq 'John Doe' }
  its(:customer_email) { should eq 'john@doe.net' }
  its('sale_date.to_s') { should eq '2014-09-05' }
end

