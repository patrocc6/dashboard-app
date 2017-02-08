class PhasesController < ApplicationController
  def sort
    params[:phase].each_with_index do |id, index|
      Phase.update(id, {position: index+1})
    end
    head :ok
  end

end
