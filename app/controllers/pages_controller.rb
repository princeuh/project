class PagesController < ApplicationController
  before_action :logout_users

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
end
