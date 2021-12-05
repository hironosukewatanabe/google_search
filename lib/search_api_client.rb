require 'google/apis/customsearch_v1'

class SearchApiClient
	cse_keys = Rails.application.credentials.config[:custom_search]
	API_KEY = cse_keys[:api_key]
	CSE_ID = cse_keys[:cse_id]

	def initialize
		@searcher = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
		@searcher.key = API_KEY
	end

	def get_list(query)
		@searcher.list_cses(q: query, cx: CSE_ID).items
	end
end
