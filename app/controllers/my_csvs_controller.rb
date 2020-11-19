# frozen_string_literal: true

class MyCsvsController < ApplicationController
  before_action :authenticate_user!
  

  def show
    @csv = MyCsv.find(params[:id])
  end
  

  def create
    @csv = current_user.my_csvs.new(csv_params)
    if @csv.save
      flash[:success] = 'Object successfully created'
      redirect_to @csv
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def csv_params
    params.require(:my_csv).permit(:file)
  end
end
