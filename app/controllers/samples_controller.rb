class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy]
  def index
    @samples = Sample.all
  end
  def new
    @sample = Sample.new
  end
  def create
    @sample = Sample.new(sample_params)
    if params[:back]
      render :new
    else
      if @sample.save
        redirect_to samples_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end
  def update
    if @sample.update(sample_params)
      redirect_to samples_path, notice: "編集しました！"
    else
      render :edit
    end
  end
  def confirm
    @sample = Sample.new(sample_params)
    render :new if @sample.invalid?
  end
  def destroy
    @sample.destroy
    redirect_to samples_path, notice:"削除しました！"
  end

  private
  def sample_params
    params.require(:sample).permit(:content)
  end
  def set_sample
    @sample = Sample.find(params[:id])
  end
end
