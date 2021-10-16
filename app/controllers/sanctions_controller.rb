class SanctionsController < ApplicationController
  def index
    @sanctions = Sanction.all
  end

  def new
    @event = Event.find(params[:event])
    @sanction = Sanction.new
  end

  def create
  end
end