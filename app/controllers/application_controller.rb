class ApplicationController < ActionController::Base
  protect_from_forgery

  def record_invalid_error_message(source)
  	errors = source.errors.full_messages
	  errors.collect { |error| '-' + error }.join("\n")
  end

end
