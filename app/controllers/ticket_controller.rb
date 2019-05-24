class TicketController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource

  def index
    @tickets = Ticket.all
  end


  def show
  	@tickets = Ticket.find(params[:id])
  end


  def new
  	@ticket = Ticket.new(ticket_params)
  end


  def edit
  end


  def create
  	@ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket}
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'ticket was successfully destroyed.' }
      format.json { head :json }
    end
  end

  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end


    def ticket_params
      params.fetch(:ticket, {})
    end
end