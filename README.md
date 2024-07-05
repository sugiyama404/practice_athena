# Athena/GlueによるサーバーレスETLデータパイプライン構築



<p align="center">
  <img src="sources/aws.png" alt="animated" width="400">
</p>

![Git](https://img.shields.io/badge/GIT-E44C30?logo=git&logoColor=white)
![gitignore](https://img.shields.io/badge/gitignore%20io-204ECF?logo=gitignoredotio&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?logo=terraform&logoColor=white)

# 概要

このプロジェクトは、Amazon S3に保存されたCSVデータに対して、サーバーレスなETL（抽出、変換、ロード）処理を行うデータパイプラインを構築する方法について説明します。

# アーキテクチャ
+ データソース（S3）: CSV形式の生データはAmazon S3バケットに保存されます。
+ データカタログ（Glue Data Catalog）: Glueクローラーを使用してS3バケット内のデータスキーマを自動的に検出し、Glue Data Catalogにメタデータテーブルとして登録します。
+ クエリエンジン（Athena）: Athenaは、Glue Data Catalogに登録されたテーブルに対して標準SQLクエリを実行します。これにより、データの抽出と変換が可能になります

# 利点
+ サーバーレス: サーバーのプロビジョニングや管理が不要になり、運用コストとオーバーヘッドが削減されます。
+ スケーラブル: データ量や処理のニーズに応じて自動的にスケールアップまたはスケールダウンします。
+ 費用対効果: 実際に使用したリソースに対してのみ料金が発生します。
+ 柔軟性: 様々なデータソースやターゲットに対応し、カスタムのETLロジックを実装できます。

# 起動とデプロイ方法
1. 以下のコードを実行すると実行
```
bin/terraform_apply
```

# 停止方法
以下のコードを実行すると実行されます。
```
bin/terraform_destroy
```

# 結果

s3に以下のCSVが作成されました。

<!-- <p align="center">
  <img src="sources/csv.png" alt="animated">
</p> -->
