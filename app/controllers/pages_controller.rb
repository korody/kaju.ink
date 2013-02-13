class PagesController < ApplicationController
  def home
  end

  def about
  end

  def art
    @jobs = Job.art.scoped.order('jobs.created_at DESC')
  end

  def graphic
    @jobs = Job.graphic.scoped.order('jobs.created_at DESC')
  end

  def welcome
  end

end
