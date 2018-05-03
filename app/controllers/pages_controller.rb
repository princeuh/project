class PagesController < ApplicationController
  before_action :logout_users
   before_action :logout_beneficiaries

  def home
  end

  def about
  end

  def team
  end

  def terms
  end

  def privacy
  end

  def careers
    @careers = Career.all
  end

  def contact
  end

  def enterprises
  end

  def ventures
  end

  def logout_users
    if logged_in?
      log_out
    end
  end

    def logout_beneficiaries
    if beneficiary_logged_in?
      beneficiary_log_out
    end
  end
end
