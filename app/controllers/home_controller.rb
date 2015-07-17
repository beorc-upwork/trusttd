class HomeController < ApplicationController
  def show
    @notification = Notification.last
  end
end
