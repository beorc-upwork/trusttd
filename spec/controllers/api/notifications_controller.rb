require 'rails_helper'

RSpec.describe Api::NotificationsController, type: :controller do
  let(:request_data) do
    '{"notification":"lrD1hWtqVyN/3EkC/sjxmVNMA4/bu82WDM1ONT8WgJbVSJD6oAHDl369xsPRqDlwXEwQYs4S6jr6\n1wg66cB+nfpUUWmFYZxvGt+okj0yx2r6F/VHp0afvd6N872N/O+6GxYPt+B04weTHPSF66AM3gdy\n2RLL1oTnJpJGd5lo9+Rohbhj/W49NAkrcAtlPetR53zXK228pBoqRrnkYAX1C9f4swdUW3rYaQK5\n8MINXWCJsfJyRO1WWsXSYDdkimpDjH+cb5NGDw+P/HLAe13f5hUpoykHTihFhMhcKAHksQ3qPsoM\nO0O/S6wYDOlIhL1jMPlU5lobhObDUYHL5xROpoJtHmjCCJiPfCMzgS1cUtmeoBpjMpOULnGjm0Pq\nuTvke8wyc8I1IlA5/hvUBYAnKFHbMl9aKoZTD/3guIMO5RUS+Lup2K+qsIbkl7qL46p6DG48Cksw\nhY1U9ZjxVX/DpLJSpzEi0aJA0TxOO7kQzm4aBtCh5ZI4eTs6uwn9QQmyELVh2Nmp9fO6oA4iI+KQ\ng3fd2zrIz4piNgSlx6VX9ydLH6dUBmKe9bIQehXv4vrcggXmArZ05oJrG0F0uwHg0HAFREmuKBQC\nI/8E44oAd4ivj0wk2CBlHpUFiOsm4HO+IOn92NaAbeir3/eWkm7wObkQZvI9w44Ow+d7/3BWc1la\nQf2FCH77Z21yXARW3uoXqtYBvodOMDAaldbhNmWy2+IzrKW3x4qL+N87xxe19VkMfBqMGHa87jqP\nI1UOkTh124kuIzp4NM3DlObfSc2Ct/699aInzGzRrJztMXBqDlum2M1KU/GZbqC4f3s4saOUywwb\n+4AUn8uX2bgS7VOOD3WrJRqrCpqllOYDbwBXIe0ErzVML0Ctf/SA/hRYw4JgJFb4R/bD24HG5TeD\ncs1LFw==", "iv":"MkU5ODhERjUxMTQwNzc5RQ=="}'
  end

  describe 'POST create' do
    let(:request_block) do
      -> { post :create, request_data, { format: 'json' } }
    end

    context 'given valid data' do
      it 'returns 200 status' do
        request_block.call

        expect(response).to have_http_status(:ok)
      end

      it 'creates notification' do
        expect do
          request_block.call
        end.to change { Notification.count }.from(0).to(1)

        notification = Notification.last
        expect(notification.product_name).to eq 'A passed in title'
        expect(notification.customer_name).to eq 'Test User'
        expect(notification.customer_email).to eq 'testuser@somesite.com'
        expect(notification.sale_date).to eq '2015-07-21'
      end
    end

    context 'given invalid data' do
      let(:request_data) do
        '{}'
      end

      it 'returns 422 status' do
        request_block.call

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'did not create notification in database' do
        request_block.call

        expect(Notification.count).to eq 0
      end
    end
  end
end

