class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ClubMembersHelper
  include EmployeeSessionsHelper
  include BeneficiarySessionsHelper
  include StatusSessionsHelper
end
