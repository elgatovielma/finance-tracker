#it handles the form submition with the customize items first_name and
# last_name using a new devise child class
class User::RegistrationsController < Devise::RegistrationsController

    before_action(:configure_permitted_parameters)

    protected 

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
        end

end