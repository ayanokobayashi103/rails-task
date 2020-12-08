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
      redirect_to samples_path, notice: "投稿しました"
    else
      render :new
    end
  end
  def show
    @sample = Sample.find(params[:id])
  end
  def edit
    @sample = Sample.find(params[:id])
  end
  def update
    @sample = Sample.find(params[:id])
    if @sample.update(sample_params)
     redirect_to samples_path, notice: "編集しました！"
   else
     render :edit
   end
  end
  private
  def sample_params
    params.require(:sample).permit(:content)
  end
end
