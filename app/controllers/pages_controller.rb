class PagesController < ApplicationController
  def home
  end

  def about
  end

  def art
    @jobs = Job.art.scoped.order("RANDOM()")
  end

  def graphic
    @jobs = Job.graphic.scoped.order("RANDOM()")
  end

  def welcome
  end

end
