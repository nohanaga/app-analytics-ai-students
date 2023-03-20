# 演習 - はじめに

**[Home](./README.md)** 

この演習では、Web サイトを自動的に構築して発行する Azure Static Web App インスタンスを作成します。

また Web サイトの構築に使用する JavaScript フレームワークとして React を使用します。

## リポジトリを取得する

まず、サンプルのシングル ページ アプリケーションのソースコード一式が含まれたリポジトリのコンテンツを取得します。コンテンツは GitHub にて公開されており、下記リンクから zip ファイルとして取得できます。

https://github.com/MSKK-Div2-App-Innovation/mslearn-staticwebapp-api/archive/refs/heads/main.zip

参加者の環境により上記のリンクにアクセスできない場合、講師等が上記のリンクより zip ファイルを取得し、参加者と共有してください。

## アプリをローカルで実行する
これで、ローカル コンピュータ上にサンプルのシングル ページ アプリケーションのソースコード一式を保存できました。次に zip ファイルを解凍して、使用しているコンピューター上でローカルにコードを実行します。

  1. ダウンロードした zip ファイルを任意の場所で解凍します。
  1. コンピューター上でターミナル ウィンドウを開きます。  
     Windows を使用している場合、システム トレイの検索ボックスに「`cmd`」と入力できます。
  1. 手順 1. で zip ファイルを解凍したディレクトリに変更します。  

     ```bash
     cd mslearn-staticwebapp-api-main
     ```

     ディレクトリを変更した後は下記のファイル / ディレクトリ構成になります。

     ```
     mslearn-staticwebapp-api-main
     ├─.vscode/
     ├─api-starter/
     ├─react-app/
     ├─.gitignore
     ├─CODE_OF_CONDUCT.md
     ├─LICENSE
     ├─LICENSE-CODE
     ├─README.md
     └─SECURITY.md
     ```

  1. フロントエンド フレームワークとして React を使用しているディレクトリに移動します。

     ```bash
     cd react-app
     ```

  1. 次の `npm install` コマンドを実行して、アプリケーションの依存モジュールをインストールします。

     ```bash
     npm install
     ```

  1. フロントエンド クライアント アプリケーションを実行します。

     ```bash
     npm start
     ```

## アプリに移動する

アプリケーション バンドルが生成されてコンパイルされると、ブラウザー タブが自動的に開き、アプリケーションがローカルで実行されていることが表示されます。

React のローカル ホストでの URL は `http://localhost:3000` です。

![image](https://user-images.githubusercontent.com/4566555/202408274-7ae00831-1ec6-4851-a6ac-f3303475f192.png)

データや API がまだないため、アプリに [**Loading data ...**] と表示されるはずです。 このレッスンでは、後で Web アプリ用の API を追加します。

ターミナルで、`Ctrl`+`C` キーを押してバッチ ジョブを停止します。

おめでとうございます。 アプリケーションをビルドし、ローカルに実行されていることをブラウザーで確認しました。 これで、アプリケーションを Azure Static Web Apps に発行できます。

## 静的 Web アプリを作成する
ここでは Azure Static Web Apps を作成します。 これを行うには、[Azure portal](https://portal.azure.com/) で Azure Static Web Apps のリソースの種類を見つける必要があります。

1. [Azure portal](https://portal.azure.com/) にサインインします。
1. Azure portal のメニューで [リソースの作成] を選択し、上部の検索ボックスで [静的 Web アプリ] と入力します。 [静的 Web アプリ] ペインが表示されます。
1. 静的 Web アプリ画面で[作成] ボタンをクリックします。 [静的 Web アプリの作成] ペインが表示されます。

## 静的 Web アプリの作成
リソース グループや場所などの基本的な設定を構成しましょう。

1. [基本] タブで、各設定に対して次の値を入力します。

    |  設定  |  値  |
    | ---- | ---- |
    |  **プロジェクトの詳細**  |
    |  サブスクリプション  |  ご自分のサブスクリプション  |
    |  リソース グループ   |  任意のリソース グループ<br>　新規作成 or これまで使ってきたリソース グループでも構いません。  |
    |  **静的 Web アプリの詳細**  |
    |  静的 Web アプリ名  |  my-static-web-app-and-api  |
    |  プランの種類  |  Free  |
    |  **Azure Functions とステージングの詳細**  |
    |  Azure Functions API とステージング環境のリージョン  |  最も近い場所をドロップダウン リストから選択します。<br>　ex. East Asia  |
    |  **デプロイの詳細**  |
    |  ソース  |  その他  |

1. [確認および作成]、[作成] の順に選択します。 [デプロイ] ペインに、作成されたリソースが表示されます。 デプロイが正常に終了するまで待ちます。

1. デプロイが正常に終了したら、デプロイした静的 Web アプリ リソースに移動した後、[概要] ブレード上部の [デプロイ トークンの管理] をクリックし、デプロイ トークンをコピーし控えます。このデプロイ トークンは静的 Web アプリへのシングル ページ アプリケーションの展開に使用します。

## 静的 Web アプリへのアプリケーションの展開

ローカル コンピュータ上のシングル ページ アプリケーションを静的 Web アプリを展開するには、アプリケーション バンドルの作成と [`Static Web Apps CLI`](https://azure.github.io/static-web-apps-cli/) の実行が必要です。

  1. 開いているターミナル上で、`react-app` ディレクトリにいることを確認した後、アプリケーション バンドルを作成します。
  
     ```
     npm run build
     ```

     `react-app` ディレクトリ内に `build` ディレクトリが作成されていることを確認します。

  1. 1 つ上のディレクトリに移動します。

     ```bash
     cd ..
     ```

  1. 静的 Web アプリに `react-app/build` 内のコンテンツを展開します。

     ```bash
     npx --package @azure/static-web-apps-cli swa deploy react-app/build --env Production --swa-config-location react-app --deployment-token <デプロイ トークン>
     ```

     コマンド実行時にインストールの確認が出た場合は `y` を押します。

     ```bash
     Need to install the following packages:
       @azure/static-web-apps-cli
     Ok to proceed? (y)
     ```

  1. コマンドが正常に終了すると、`√ Project deployed to <サイトの URL> 🚀` というメッセージが表示されるので、ブラウザーのアドレス バーに URL を入力して、展開したシングル ページ アプリケーションを表示します。  
  データや API がまだないため、アプリに [Loading data ...] と表示されるはずです。 このモジュールでは、後で Web アプリ用の API を追加します。

おめでとうございます。 アプリを Azure Static Web Apps にデプロイしました。

> **注意**  
> アプリがまだビルドおよびデプロイされていないことを示す Web ページが表示されても心配しないでください。 しばらくしてからブラウザーを再更新してみてください。 Azure 静的 Web アプリが作成されると、GitHub アクションによって自動的に実行されます。 そのため、スプラッシュ ページが表示されても、アプリはデプロイ中です。

## 次のステップ
次に、Azure Functions プロジェクトを使用して API をビルドおよび実行する方法について学習します。

----

**[Home](./README.md)** 
