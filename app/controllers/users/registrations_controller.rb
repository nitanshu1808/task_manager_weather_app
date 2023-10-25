module Users
  class RegistrationsController < Devise::RegistrationsController
    def build_resource(hash = {})
      self.resource = resource_class.new_with_session(hash, session)
      resource.location || resource.build_location
    end

    def sign_up_params
      params.require(:user).permit(
        :email, :first_name, :last_name, :password,
        :password_confirmation, location_attributes: [:name]
      )
    end
  end
end
