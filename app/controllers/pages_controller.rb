class PagesController < ApplicationController
  
  def welcome
  end

  def home
  end

  def art
    if params[:query].present?
      @jobs = Job.text_search(params[:query])
      if @jobs.empty?
        redirect_to :back, notice: "bummer! no art called <strong>#{params[:query]}</strong> around here...".html_safe
      end
    else
      @jobs = Job.art.order(created_at: :desc)
    end
  end

  def graphic
    if params[:query].present?
      @jobs = Job.text_search(params[:query])
      if @jobs.empty?
        redirect_to :back, notice: "uhmm... we can't seem to find <strong>#{params[:query]}</strong> around here...".html_safe
      end
    else
      @jobs = Job.graphic.order(created_at: :desc)
    end
  end

  def admin
    if params[:query].present?
      @jobs = Job.text_search(params[:query])
      @clippings = Clipping.text_search(params[:query])
      if @jobs.empty? && @clippings.empty?
        redirect_to :back, notice: " couldn't find <strong>#{params[:query]}</strong> honey pie...please try again ; )".html_safe
      end
    else
      @jobs = Job.order(created_at: :desc)
      @clippings = Clipping.order(created_at: :desc)
    end
  end
end