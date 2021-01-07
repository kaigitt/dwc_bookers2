class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do
      resource.update(confirmed_at: Time .now.utc)
    end
  end
end