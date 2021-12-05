# README
Googleでの検索結果一覧を表示するアプリケーションです。

https://user-images.githubusercontent.com/41007985/144743129-21570dd3-ee4a-40a5-9125-17730b4c8af2.mov




## 使用した技術等
  - Rubyバージョン: 3.0.3
  - Railsバージョン: 6.1.3
  - Custom Search JSON API
  - Rspec
  - Bootstrap
  - rubocop

## 機能一覧
  - Goodle検索機能
  - 検索結果表示機能

## セットアップ
  - credentialを再作成し、api_keyとcse_idを設定する。
      ```
      custom_search:
        api_key: # CustomSearchAPIのキー
        cse_id:  # サーチエンジンID
      ```
  - dockerコンテナを起動する
     ```
     docker-compose build
     docker-compose up
     ```

