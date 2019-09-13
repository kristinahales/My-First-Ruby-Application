#Modules are pieces of the code that you want to pass around and share between classes.
module DeviseWhitelist
    #gives us access to all the method without the ActiveSupport module
    extend ActiveSupport::Concern
    #concerns allow us to use before filters
    included do
        #run this method before all other controllers
        before_filter :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
