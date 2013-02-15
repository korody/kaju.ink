class PagesController < ApplicationController
  
  def welcome
  end

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

end
