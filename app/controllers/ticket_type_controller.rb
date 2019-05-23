class TicketTypeController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @ticket_types = Ticket_type.all
  end


  def show
  	@ticket_types = Ticket_type.find(params[:id])
  end


  def new
  	@ticket_type = Ticket_type.new(ticket_type_params)
  end


  def edit
  end


  def create
  	@ticket_type = Ticket_type.new(ticket_type_params)

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to @ticket_type, notice: 'ticket_type was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_type }
      else
        format.html { render :new }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @ticket_type.update(ticket_type_params)
        format.html { redirect_to @ticket_type, notice: 'ticket_type was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_type }
      else
        format.html { render :edit }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket_type.destroy
    respond_to do |format|
      format.html { redirect_to ticket_types_url, notice: 'ticket_type was successfully destroyed.' }
      format.json { head :json }
    end
  end

  private

    def set_ticket_type
      @ticket_type = Ticket_type.find(params[:id])
    end


    def ticket_type_params
      params.fetch(:ticket_type, {})
    end
end



