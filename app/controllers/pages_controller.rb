class PagesController < ApplicationController
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
end
