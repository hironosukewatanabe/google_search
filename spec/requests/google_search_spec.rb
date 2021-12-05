require 'rails_helper'
require 'webmock'

RSpec.describe 'GoogleSearch', type: :request do
	before do
		# スタブからの戻り値を格納する。
	  ApiResponseStruct ||= Struct.new(:title, :snippet, :link)
	end
	describe '初期表示' do
		before do
			get google_search_index_path
		end
		context '見出し' do
			it '「Google検索」が表示されること' do
				expect(response).to have_http_status(200)
				expect(response.body).to include('Google検索')
			end
		end
		context '検索フォーム' do
			it '検索テキストボックスが表示されること' do
				expect(response.body).to include("id=\"search_text\"")
			end
			it '検索ボタンが表示されること' do
				expect(response.body).to include('検索')
			end
		end
	end
	describe '検索処理' do
		let(:search_result) {
			[
				ApiResponseStruct.new('タイトル1', '詳細1', 'リンク1'),
				ApiResponseStruct.new('タイトル2', '詳細2', 'リンク2'),
				ApiResponseStruct.new('タイトル3', '詳細3', 'リンク3'),
				ApiResponseStruct.new('タイトル4', '詳細4', 'リンク4'),
				ApiResponseStruct.new('タイトル5', '詳細5', 'リンク5'),
				ApiResponseStruct.new('タイトル6', '詳細6', 'リンク6'),
				ApiResponseStruct.new('タイトル7', '詳細7', 'リンク7'),
				ApiResponseStruct.new('タイトル8', '詳細8', 'リンク8'),
				ApiResponseStruct.new('タイトル9', '詳細9', 'リンク9'),
				ApiResponseStruct.new('タイトル10', '詳細10', 'リンク10')
			]
		}
	  before do
			allow_any_instance_of(SearchApiClient).to receive(:get_list).and_return(search_result)
	  end
		context '「検索テスト」を入力後、検索ボタンを押下した場合' do
			before do
			  get search_google_search_index_path, params: { search_text: '検索テスト' }
			end
			it '「Google検索」が表示されること' do
				expect(response).to have_http_status(200)
				expect(response.body).to include('Google検索')
			end
			it '検索テキストボックスが表示されること' do
				expect(response.body).to include("id=\"search_text\"")
			end
			it '検索ボタンが表示されること' do
				expect(response.body).to include('検索')
			end
			it '検索結果が表示されること' do
				# 検索結果にはタイトル(リンク)、詳細が表示される。
				# 検索結果は10件まで表示する。
				expect(response.body).to include('タイトル1')
				expect(response.body).to include('詳細1')
				expect(response.body).to include('リンク1')
				expect(response.body).to include('タイトル2')
				expect(response.body).to include('詳細2')
				expect(response.body).to include('リンク2')
				expect(response.body).to include('タイトル3')
				expect(response.body).to include('詳細3')
				expect(response.body).to include('リンク3')
				expect(response.body).to include('タイトル4')
				expect(response.body).to include('詳細4')
				expect(response.body).to include('リンク4')
				expect(response.body).to include('タイトル5')
				expect(response.body).to include('詳細5')
				expect(response.body).to include('リンク5')
				expect(response.body).to include('タイトル6')
				expect(response.body).to include('詳細6')
				expect(response.body).to include('リンク6')
				expect(response.body).to include('タイトル7')
				expect(response.body).to include('詳細7')
				expect(response.body).to include('リンク7')
				expect(response.body).to include('タイトル8')
				expect(response.body).to include('詳細8')
				expect(response.body).to include('リンク8')
				expect(response.body).to include('タイトル9')
				expect(response.body).to include('詳細9')
				expect(response.body).to include('リンク9')
				expect(response.body).to include('タイトル10')
				expect(response.body).to include('詳細10')
				expect(response.body).to include('リンク10')
			end
		end
	end
end
