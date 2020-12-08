class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end
  def new
    @sample = Sample.new
  end
  def create
    @sample = Sample.new(sample_params)
    if @sample.save
      redirect_to sample_path, notice: "投稿しました"
    else
      render :new
    end
  end
  def show
    @sample = Sample.find(params[:id])
  end
  private
  def sample_params
    params.require(:sample).permit(:content)
  end
end
