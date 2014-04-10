class Admin::SlidesController < ApplicationController
  def index
    @slides = Slide.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slide }
    end
  end

  def show
  end

  def new
    @slide = Slide.new
  end

  def edit
    @slide = Slide.find(params[:id])
  end

  def create
    @slide = Slide.new(params[:slide])

    respond_to do |format|
      if @slide.save
        format.html { redirect_to front_admin_path, notice: 'Slide was successfully created.' }
        format.json { render json: @slide, status: :created, location: @slide }
      else
        format.html { render front_admin_path, notice: 'error happened' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @slide = Slide.find(params[:id])

    respond_to do |format|
      if @slide.update_attributes(params[:slide])
        format.html { redirect_to front_admin_path, notice: 'slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to front_admin_path }
      format.json { head :no_content }
    end
  end
end
