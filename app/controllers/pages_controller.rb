class PagesController < ApplicationController
  
  def welcome
  end

  def home
  end

  def about
  end

  def art
    if params[:query].present?
      @jobs = Job.text_search(params[:query])
      if @jobs.empty?
        redirect_to :back, notice: "bummer! no art called <strong>#{params[:query]}</strong> around here...".html_safe
      end
    else
      @jobs = Job.art.scoped.order("RANDOM()")
    end
  end

  def graphic
    if params[:query].present?
      @jobs = Job.text_search(params[:query])
      if @jobs.empty?
        redirect_to :back, notice: "uhmm... we can't seem to find <strong>#{params[:query]}</strong> around here...".html_safe
      end
    else
      @jobs = Job.graphic.scoped.order("RANDOM()")
    end
  end

end
