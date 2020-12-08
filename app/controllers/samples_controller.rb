class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end
  def new
    @sample = Sample.new
  end
  def create
    Sample.create(sample_params)
    redirect_to new_sample_path
  end
  def show
    @sample = Sample.find(params[:id])
  end
  private
  def sample_params
    params.require(:sample).permit(:content)
  end
end
