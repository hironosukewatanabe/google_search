class GoogleSearchController < ApplicationController
  def index
	end
	def search
    seacher = SearchApiClient.new
    @search_results = seacher.get_list(search_params[:search_text])
    render action: :index
  end
  def search_params
    params.permit(:search_text)
  end
end
