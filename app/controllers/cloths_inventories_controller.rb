class ClothsInventoriesController < ApplicationController
  # GET /cloths_inventories
  # GET /cloths_inventories.json
  def index
    @cloths_inventories = ClothsInventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cloths_inventories }
    end
  end

  # GET /cloths_inventories/1
  # GET /cloths_inventories/1.json
  def show
    @cloths_inventory = ClothsInventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cloths_inventory }
    end
  end

  # GET /cloths_inventories/new
  # GET /cloths_inventories/new.json
  def new
    @cloths_inventory = ClothsInventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cloths_inventory }
    end
  end

  # GET /cloths_inventories/1/edit
  def edit
    @cloths_inventory = ClothsInventory.find(params[:id])
  end

  # POST /cloths_inventories
  # POST /cloths_inventories.json
  def create
    @cloths_inventory = ClothsInventory.new(params[:cloths_inventory])

    respond_to do |format|
      if @cloths_inventory.save
        format.html { redirect_to @cloths_inventory, notice: 'Cloths inventory was successfully created.' }
        format.json { render json: @cloths_inventory, status: :created, location: @cloths_inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @cloths_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cloths_inventories/1
  # PUT /cloths_inventories/1.json
  def update
    @cloths_inventory = ClothsInventory.find(params[:id])

    respond_to do |format|
      if @cloths_inventory.update_attributes(params[:cloths_inventory])
        format.html { redirect_to @cloths_inventory, notice: 'Cloths inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cloths_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloths_inventories/1
  # DELETE /cloths_inventories/1.json
  def destroy
    @cloths_inventory = ClothsInventory.find(params[:id])
    @cloths_inventory.destroy

    respond_to do |format|
      format.html { redirect_to cloths_inventories_url }
      format.json { head :no_content }
    end
  end
end
