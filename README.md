# Azure Basic Hands-on トレーニング 

## Introduction

## Scenario

## Goal
このモジュールでは、次のことを行います。
### 1. Logic Apps で感情分析アプリ開発
- ビジネスの問題を解決するためのワークフロー モデルを構築する
- 外部イベントに応答し、Logic Apps を起動する
- 処理条件付きロジックを適用して、データをフィルターし、処理パスを選択する
- Azure サービスをワークフローに統合する

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


### 3. Static Web Apps で SPA 開発
Azure Static Web Apps と Azure Functions を使用して、React の JavaScript アプリと API を発行します。 プレビュー URL を使用して、GitHub からステージング サイトにコードをデプロイします。

 - Challenge-01 [はじめに](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/1-introduction?pivots=react)
 - Challenge-02 [演習 - はじめに](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/2-exercise-get-started?pivots=react)
 - Challenge-03 [Azure Functions を使用して API をビルドする](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/3-build-api)
 - Challenge-04 [演習 - Azure Functions プロジェクトを作成する](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/4-exercise-function-app?pivots=react)
 - Challenge-05 [GitHub Actions を使用して API を発行する](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/5-action?pivots=react)
 - Challenge-06 [演習 - GitHub Actions を使用して API を発行する](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/6-exercise-action?pivots=react)
 - Challenge-07 [知識チェック](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/7-knowledge-check)
 - Challenge-08 [まとめ](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/8-summary)

### 4. クラウドネイティブアプリを体感する
これまでに身に着けた知識を総動員して、クラウドネイティブで AI を搭載した Web アプリケーションを開発します。

 - Challenge-01 [Twitter トレンド トラッカー ロジック アプリを作成する](./4-1-ex-create-social-media-tracker.md)
 - Challenge-02 [Azure Static Web Apps で Web アプリをデプロイする](./4-2-ex-deploy-static-web-app-api.md)

