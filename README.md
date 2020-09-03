# 概要

# 使い方

## [開発] プロジェクトを作成する
## [開発] アプリケーションを起動する
## [開発] 単体テストを実行する
## [運用] リモートホストにデプロイする

# Makefileの解説

## 開発者用コマンド
- `dev/composer`
- `dev/run`
- `dev/lint`
- `dev/test`


# ディレクトリ構成
- src/
    - アプリケーション本体のPHPファイルおよび各種リソース
- test/
    - テスト用コード
- vendor/
    - サードバーティライブラリ
- .gitignore
- composer.json(composer.lock)
- Makefile
    - 開発および運営用の各種コマンド
- Dockerfile-dev
    - 開発環境用のDockerコンテナ定義ファイル
- README.md

# src/のディレクトリ構成
- Application/
    - ユースケースを定義したコード
- Domain/
    - フレームワークに依存してはならないビジネスロジックを定義したコード
    - Model/
        - ドメインモデルを定義したコード
- Infrastructure
    - Persistence
        - データの永続化に関する詳細コード
    - Web/
        - public/
            - index.php
                - **Webサーバ用のエントリーポイント**
            - js/
            - css/
            - img/
    - Console/
        - app.php
            - コマンドライン用のエントリーポイント
