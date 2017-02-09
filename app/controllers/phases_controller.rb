class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]

  def destroy
    @phase.destroy
  end

  def sort
    params[:phase].each_with_index do |id, index|
      Phase.update(id, {position: index+1})
    end
    head :ok
  end

  private

  def set_phase
    @phase = Phase.find(params[:id])
  end

end
