# Azure Basic Hands-on トレーニング 

## Introduction
このトレーニングは、AI 搭載のクラウドネイティブ Web アプリケーションを迅速に構築する方法を学ぶことができます。

ソーシャルデータを自動的に取得し、AI によるテキスト感情分析を行ってデータベースに保存するワークフローを作成します。データベースに保存したデータは、モダン Web フレームワークである React を用いてブラウザで可視化します。

このトレーニングでは、以下のサービスを利用します。

- Azure Logic Apps
- Azure Cognitive Services
- Azure SQL Database
- Azure Cosmos DB
- Azure Functions
- Azure Static Web Apps

## Scenario

## Goal
このモジュールでは、次のことを行います。
### 1. Logic Apps で感情分析アプリ開発
- ビジネスの問題を解決するためのワークフロー モデルを構築する
- 外部イベントに応答し、Logic Apps を起動する
- 処理条件付きロジックを適用して、データをフィルターし、処理パスを選択する
- Azure サービスをワークフローに統合する

### 2. Functions から NoSQL Database にデータ投入
- Azure の NoSQL である Cosmos DB について基礎を理解する
- Visual Studio Code を使用して Azure に JavaScript 関数を作成する
- Visual Studio Code を使用して Azure Functions を Azure Cosmos DB に接続する

### 3. Static Web Apps で SPA 開発
- Angular、React、Svelte、または Vue を使用して既存の Web アプリ プロジェクトを選択する
- Azure Functions を使用してアプリの API を作成する
- ローカルでアプリケーションを実行する
- アプリを Azure Static Web Apps に発行する
- アプリとその API を Azure Static Web Apps に発行し、ステージング サイトに発行する


## 前提条件
 - 初心者レベルでの Azure portal を使用するリソースの作成および管理経験
 - コネクタ、トリガー、およびアクションの Azure Logic Apps の概念の基本的な知識
 - 条件付きステートメントやループなどのプログラミングの概念に関する知識

## Contents
### 1. Logic Apps で感情分析アプリ開発
組み込みのトリガー、アクション、および条件演算子を使用してワークフローを定義します。 ワークフローはデータがあるときに自動的に実行され、クラウド内のデータを処理し、データベースで結果を記録し、電子メール通知を送信します。

 - Challenge-01 [はじめに](https://learn.microsoft.com/training/modules/route-and-process-data-logic-apps/1-introduction)
 - Challenge-02 [ワークフロー用に Logic Apps を設計する](https://learn.microsoft.com/training/modules/route-and-process-data-logic-apps/2-design-logic-apps-for-your-workflows)
 - Challenge-03 [トリガーを使用して外部イベントを検出する](https://learn.microsoft.com/training/modules/route-and-process-data-logic-apps/3-detect-external-event-using-trigger)
 - Challenge-04 [演習 - ソーシャル メディア トラッカー ロジック アプリを作成する](./1-4-ex-create-social-media-tracker.md)
 - Challenge-05 [アクションを実行する](https://learn.microsoft.com/training/modules/route-and-process-data-logic-apps/5-execute-an-action)
 - Challenge-06 [演習 - ツイートのコンテンツを分析する](./1-6-ex-analyze-content-of-tweet.md)
 - Challenge-07 [コントロール アクションを使用して制御フローを変更する](https://learn.microsoft.com/training/modules/route-and-process-data-logic-apps/7-alter-control-flow-using-control-action)
 - Challenge-08 [演習 - ツイートの感情に基づいて分岐する](./1-8-ex-branch-based-on-tweet-sentiment.md)
 - Challenge-09 [まとめ](https://learn.microsoft.com/training/modules/route-and-process-data-logic-apps/9-summary)

### 2. Functions から NoSQL Database にデータ投入
Azure の NoSQL である Cosmos DB とはどのようなデータストアなのかを理解し、そのうえで Azure Function から実際にデータを投入、参照してみます。
 - Cosmos DB の説明には他のステップ同様に MS Learn の下記ページを参照します。
 　「Visual Studio Code で Azure Cosmos DB Core (SQL) 用の Node.js アプリを構築する 」
　　[Cosmos DB インスタンスの作成](https://learn.microsoft.com/ja-jp/training/modules/build-node-cosmos-app-vscode/2-create-cosmosdb-instance)
 - 演習は Cosmos DB Docs の下記ページを使用します。
 - [クイックスタート: Visual Studio Code を使用して Azure に JavaScript 関数を作成する](https://learn.microsoft.com/ja-jp/azure/azure-functions/create-first-function-vs-code-node)
 - [Visual Studio Code を使用して Azure Functions を Azure Cosmos DB に接続する](https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-add-output-binding-cosmos-db-vs-code?pivots=programming-language-javascript&tabs=in-process)

### 3. Static Web Apps で SPA 開発
Azure Static Web Apps と Azure Functions を使用して、React の JavaScript アプリと API を発行します。 プレビュー URL を使用して、GitHub からステージング サイトにコードをデプロイします。

 - Challenge-01 [はじめに](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/1-introduction?pivots=react)
 - Challenge-02 [演習 - はじめに](./3-2-exercise-get-started.md)
 - Challenge-03 [Azure Functions を使用して API をビルドする](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/3-build-api)
 - Challenge-04 [演習 - Azure Functions プロジェクトを作成する](./3-4-exercise-function-app.md)
 - Challenge-05 [GitHub Actions を使用して API を発行する](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/5-action?pivots=react)
 - Challenge-06 [演習 - GitHub Actions を使用して API を発行する](./3-6-exercise-action.md)
 - Challenge-07 [知識チェック](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/7-knowledge-check)
 - Challenge-08 [まとめ](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/8-summary)

### 4. 応用: クラウドネイティブアプリを体感する
これまでに身に着けた知識を総動員して、クラウドネイティブで AI を搭載した Web アプリケーションを開発します。

 - Challenge-01 [Twitter トレンド トラッカー ロジック アプリを作成する](./4-1-ex-create-social-media-tracker.md)
 - Challenge-02 [Azure Static Web Apps で Twitter 分析 Web アプリをデプロイする](./4-2-ex-deploy-static-web-app-api.md)

