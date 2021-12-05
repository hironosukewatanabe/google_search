# README
Googleでの検索結果一覧を表示するアプリケーションです。

*  使用した技術等
  - Rubyバージョン: 3.0.3
  - Railsバージョン: 6.1.3
  - Custom Search JSON API


* セットアップ
  - credentialを再作成し、api_keyとcse_idを設定する。
	```
	custom_search:
      api_key: # CustomSearchAPIのキー
      cse_id: # サーチエンジンID
	```
  - dockerコンテナを起動する
  ```
	  docker-compose build
	    docker-compose up
	```

