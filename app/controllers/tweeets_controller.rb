class TweeetsController < ApplicationController
  before_action :set_tweeet, only: [:show, :edit, :post, :update, :destroy]


  def index
    @tweeets = Tweeet.all.order("created_at DESC")
  end


  def show
  end


  def new
    @tweeet = Tweeet.new
  end


  def edit
  end

def Post
end

  def create
    @tweeet = Tweeet.new(tweeet_params)

    respond_to do |format|
      if @tweeet.save
        format.html { redirect_to root_path, notice: 'Tweeet was successfully created.' }
        format.json { render :show, status: :created, location: @tweeet }
      else
        format.html { render :new }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @tweeet.update(tweeet_params)
        format.html { redirect_to root_path, notice: 'Tweeet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweeet }
      else
        format.html { render :edit }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweeet.destroy
    respond_to do |format|
      format.html { redirect_to tweeets_url, notice: 'Tweeet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tweeet
      @tweeet = Tweeet.find(params[:id])
    end

    def tweeet_params
      params.require(:tweeet).permit(:tweeet)
    end
end
