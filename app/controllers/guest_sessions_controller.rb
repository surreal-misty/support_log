class GuestSessionsController < ApplicationController
  def create
    guest = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = "guestpassword123"
      user.password_confirmation = "guestpassword123"
    end

    sign_in guest
    redirect_to root_path
  end
end
