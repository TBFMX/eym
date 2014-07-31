OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	
	#provider :twitter, ENV['G7wFqd9MDPhvIUVGu9T5nVBdF'], ENV['ot9gPzMWUGQMuRafg5vxAwWpFDVIVMLHSitR8uie1JAMJsuXl0']
	provider :google_oauth2, '897257467068-npulc9dqjavi23kmp2sli8pn1vuppuhs.apps.googleusercontent.com', '4BMlC5_QjUh2JDA90UanCMu-'
	#localhost
	provider :facebook, '1451557391770177', '3607dfa33038469e7d37bd1b60961343'
	#provider :facebook, '281783672006763', '6a63c1628abe7157f9d673c975bad6aa'
	#produccion
	#provider :facebook, '490103561092106', '6254ea4d5f447c698ddab1d51241f0e5'
	#provider :identity, on_failed_registration: lambda { |env|    UsersController.action(:new).call(env)}
end

OmniAuth.config do |config|
  config.on_failure do
   redirect_to root_path
  end
end