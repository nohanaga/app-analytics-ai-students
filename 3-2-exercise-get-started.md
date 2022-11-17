# 演習 - はじめに

この演習では、Web サイトを自動的に構築して発行する GitHub アクションを含む、Azure Static Web App インスタンスを作成します。

また Web サイトの構築に使用する JavaScript フレームワークとして React を使用します。

## リポジトリを作成する

まず、GitHub テンプレートを使用してリポジトリを作成します。 一連のリポジトリ テンプレートを使用できます。これには、さまざまなフロントエンド フレームワークに実装されたスターター アプリが含まれています。

  1. GitHub の[テンプレートからの作成ページ](https://github.com/login?return_to=%2FMicrosoftDocs%2Fmslearn-staticwebapp-api%2Fgenerate%3Fazure-portal%3Dtrue)に移動し、テンプレート リポジトリを開きます。
  1. 所有者の入力を求められた場合は、GitHub アカウントのいずれかを選択します。
  1. リポジトリ名として「my-static-web-app-and-api」を入力します。
  1. **Create repository from template** を選択します。  
     テンプレートからプロジェクトを作成すると、GitHub によってバックグラウンドでリポジトリが構築されます。

## アプリをローカルで実行する
これで、GitHub アカウントに my-static-web-app-and-api という名前の GitHub リポジトリが作成されました。 次に、GitHub リポジトリをクローンし、使用しているコンピューター上でローカルにコードを実行します。

  1. コンピューター上でターミナル ウィンドウを開きます。  
     Windows を使用している場合、システム トレイの検索ボックスに「`cmd`」と入力できます。
  1. リポジトリを自分のマシンに複製するには、次のコードをコマンド プロンプト ウィンドウに貼り付けます。  
     `<YOUR_GITHUB_USERNAME>` は、必ずお使いの GitHub ユーザー名に置き換えてください。

     ```bash
     git clone https://github.com/<YOUR_GITHUB_USERNAME>/my-static-web-app-and-api
     ```

  1. 複製したソース コードのディレクトリに変更します。

     ```bash
     cd my-static-web-app-and-api
     ```

  1. フロントエンド フレームワークとして React を使用しているディレクトリに移動します。

     ```bash
     cd react-app
     ```

  1. アプリケーションの依存関係をインストールします。

     ```bash
     npm install -D babel-eslint
     ```

  1. 次のコマンドを使用して、各依存関係の最新バージョンがインストールされていることを確認します。  

     ```bash
     npm audit fix --force
     ```

  1. フロントエンド クライアント アプリケーションを実行します。

     ```bash
     npm start
     ```

## アプリに移動する

アプリケーション バンドルが生成されてコンパイルされると、ブラウザー タブが自動的に開き、アプリケーションがローカルで実行されていることが表示されます。

React のローカル ホストでの URL は `http://localhost:3000` です。

[image.png]

データや API がまだないため、アプリに [**Loading data ...**] と表示されるはずです。 このレッスンでは、後で Web アプリ用の API を追加します。

ターミナルで、`Ctrl`+`C` キーを押してバッチ ジョブを停止します。

おめでとうございます。 アプリケーションをビルドし、ローカルに実行されていることをブラウザーで確認しました。 これで、アプリケーションを Azure Static Web Apps に発行できます。

## 静的 Web アプリを作成する

独自の GitHub リポジトリを作成したので、Visual Studio Code 用の Azure static Web Apps 拡張機能を使用して、独自の静的 Web アプリを作成できます。

### Visual Studio Code 用の Azure Static Web Apps 拡張機能をインストールする

  1. Visual Studio Code を開きます。
  1. 上部のメニューから [表示]>[拡張機能] の順に選択し、検索ボックスに「Azure Static Web Apps」と入力します。
  1. 拡張機能タブが Visual Studio Code に読み込まれたら、[**インストール**] を選択します。  

     ウィンドウ右下に [**ウィンドウの再読み込み**] ボタンが表示された場合は、このボタンをクリックします。

## アプリケーション フォルダーを開く

React アプリケーションが含まれるフォルダーを開きます。

  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「File: Open Folder...」と入力します。
  1. `my-static-web-app-and-api/react-app` フォルダーを選択します。
  1. [フォルダーの選択] を選択して、Visual Studio Code でフォルダーを開きます。

## Visual Studio Code で Azure にサインインする

  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「Azure: Sign In」と入力し、プロンプトに従って認証を行います。

## サブスクリプションを選択する

  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「Azure: Select Subscriptions」を入力し、以降のステップで使用するサブスクリプションを除くすべての選択を解除します。

## 変更をコミットする

このプロセスで、アプリケーションの依存関係をインストールしたときに、プロジェクト内の一部のファイルが更新されました。 続行するには、これらの変更をリポジトリにコミットする必要があります。

  1. `package.json` ファイルを開き、下記のように `name` や `version` と同じインデントで `engines` とその中身を追記して保存します。

     ```json
     {
       "name": "react-app",
       "version": "0.1.0",
         :
       "engines": {
         "node": "16.14.2"
       },
         :
     }
     ```

  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「**Git: Commit All**」と入力して選択します。
  1. ファイルの先頭に「initial commit」と入力します。
  1. Git コミット メッセージ ファイルを保存して閉じます。  
  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「**Git: Push**」と入力して選択します。

## 静的 Web アプリの作成

静的 Web アプリを作成するには、現在 Azure および GitHub で認証されているセッションが必要です。 両方のプロバイダーにまだサインインしていない場合は、作成プロセス中に、拡張機能により、サインインするように求められます。

  1. F1 キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「Azure Static Web Apps: Create Static Web App...」と入力して選択します。  
     コマンド パレット プロンプトの残りの部分に次の値を入力します。

     | Prompt | 値 |
     | ---- | ---- |
     | サブスクリプション |	ご自分のサブスクリプションを選択する |
     | 名前 | 「my-static-web-app-and-api」と入力する |
     | リージョン | 最も近いリージョン (`East Asia`) を選択します |
     | プリセット | `React` を選択します |
     | アプリケーション コードの場所 | `react-app` と入力します |
     | Output location (出力場所)	| `build` と入力します |

  1. アプリが作成されると、確認通知が Visual Studio Code に表示されます。  
    [image.png]  
    ビルドの構成中、Visual Studio Code にビルドの状態が示されます。  
    [image.png]
  
  1. GitHub Actions で [アクション] メニューを展開すると、デプロイの進行状況を参照できます。  
    [image.png]  
     デプロイが完了したら、Web サイトに直接移動できます。
  1. ブラウザーで Web サイトを表示するには、Static Web Apps 拡張機能でプロジェクトを右クリックし、 [Browse Site] を選択します。    
     [image.png]  
     データや API がまだないため、アプリに [Loading data ...] と表示されるはずです。 このモジュールでは、後で Web アプリ用の API を追加します。

おめでとうございます。 アプリを Azure Static Web Apps にデプロイしました。

> **注意**  
> アプリがまだビルドおよびデプロイされていないことを示す Web ページが表示されても心配しないでください。 しばらくしてからブラウザーを再更新してみてください。 Azure 静的 Web アプリが作成されると、GitHub アクションによって自動的に実行されます。 そのため、スプラッシュ ページが表示されても、アプリはデプロイ中です。

### GitHub から変更内容をプルする

GitHub から最新の変更内容をプルし、Azure Static Web Apps サービスによって作成されたワークフロー ファイルを停止します。

  1. `Ctrl`+`Shift`+`P` キーを押してコマンド パレットを開きます。
  1. 「Git: Pull」と入力して選択します。
  1. `Enter` キーを押します。

## 次のステップ
次に、Azure Functions プロジェクトを使用して API をビルドおよび実行する方法について学習します。

### 次のユニット: [Azure Functions を使用して API をビルドする](https://learn.microsoft.com/ja-jp/training/modules/publish-static-web-app-api-preview-url/3-build-api)
