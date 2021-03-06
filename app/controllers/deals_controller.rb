class DealsController < ApplicationController

def index
  @deals = Deal.all
end

  def show
    id = params[:id] # retrieve deal ID from URI route
    @deal = Deal.find(id) # Look up deal by unique ID
    # will render app/views/deals/show.<extension> by default
  end

  def new
	@deal = Deal.new
  end

 def create
   @deal = Deal.create!(params[:deal])
   if @deal.save
   	flash[:notice]="#{@deal.name} was successfully created"
   	redirect_to deals_path
   end 
 end

  def edit
    @deal = Deal.find params[:id]
  end

  def update
    @deal = Deal.find params[:id]
    @deal.update_attributes!(params[:deal])
    flash[:notice] = "#{@deal.name} was successfully updated."
    redirect_to deal_path(@deal)
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    flash[:notice] = "Deal '#{@deal.name}' deleted."
    redirect_to deals_path
  end

end
