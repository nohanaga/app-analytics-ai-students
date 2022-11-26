# 演習 - Azure Functions プロジェクトを作成する

**[Home](./README.md)**

ショッピング リスト Web アプリには API が必要です。 この演習では、Azure Functions プロジェクトを使用し、API をビルドして実行します。 そこから、Visual Studio Code 用の Azure Functions 拡張機能を使用して、新しい関数で API を拡張します。

この演習では、次の手順を行います。

  1. Web アプリを変更するための準備としてブランチを作成します。
  1. Azure 関数プロジェクトを調べます。
  1. HTTP GET 関数を作成します。
  1. 関数のスタート コードを、製品を取得するためのロジックに置き換えます。
  1. HTTP 要求を API にプロキシするように Web アプリを構成します。
  1. API と Web アプリを実行します。

## 関数アプリを取得する

ここで、API を追加してフロントエンド アプリに接続します。 api-starter フォルダーには、不完全な Azure Functions プロジェクトが含まれています。 ここでそれを完成させます。

### プロジェクト フォルダーを開く

  1. Visual Studio Code の上部のメニューから [ファイル]>[フォルダーを閉じる] の順に選択し、現在開いている React アプリケーション フォルダーを閉じます。
  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「File: Open Folder...」と入力します。
  1. `my-static-web-app-and-api` フォルダーを選択します。
  1. [フォルダーの選択] を選択して、Visual Studio Code でフォルダーを開きます。

### API ブランチを作成する

アプリに変更を加える前に、変更用の新しいブランチを作成することをお勧めします。 アプリの API を完成させようとしているので、ここでブランチを作成することをお勧めします。

  1. Visual Studio Code で、`F1` キーを押してコマンド パレットを開きます。
  1. 「**Git: Checkout to...**」と入力して選択します。
  1. **[新しいブランチの作成]** を選択します。
  1. 新しいブランチ名として「api」と入力し、Enter キーを押します。

これで **api** git ブランチが作成されました。

### Azure Functions API を完成させる

API を完成させるには、まず、スターター API コードを *api*という名前のフォルダーに移動します。 これは、Static Web Apps インスタンスを作成したときに、既定で api_location に設定されるフォルダー名です。

  1. Visual Studio Code で、`F1` キーを押してコマンド パレットを開きます。
  1. 「**Terminal: Create New Terminal (In Active Workspace)**」と入力して選択します。
  1. プロジェクトのルート フォルダーを開いていることを確認します。
  1. 次の git コマンドを実行して、*api-starter* フォルダーの名前を *api* に変更します。

     ```
     git mv api-starter api
     ```
  1. `F1` キーを押して、コマンド パレットを開きます。
  1. 「**Git: Commit All**」と入力して選択します。
  1. ファイルの先頭に「api」と入力します。
  1. Git コミット メッセージ ファイルを保存して閉じます。  

これで、Visual Studio Code エクスプローラーに **api** フォルダーが表示されるようになります。 **api** フォルダーには、3 つの関数と共に、Azure Functions プロジェクトが含まれています。

| フォルダーとファイル | HTTP メソッド | ルート |
| - | - | - |
| *api/products-post* | POST | `products` |
| *api/products-put* | PUT | `products/:id` |
| *api/products-delete* | DELETE | `products/:id` |

## HTTP GET 関数を作成する
API には、ショッピング リストの製品を操作するためのルートがありますが、製品を取得するためのルートはありません。 ここではそれを追加します。

### Visual Studio Code 用 Azure Functions 拡張機能をインストールする
Visual Studio Code 用 Azure Functions 拡張機能を使用して Azure Functions アプリケーションを作成および管理できます。

  1. 上部のメニューから [表示]>[拡張機能] の順に選択し、検索ボックスに「Azure Functions」と入力します。
  1. 拡張機能タブが Visual Studio Code に読み込まれたら、[**インストール**] を選択します。  
  
     ウィンドウ右下に [**ウィンドウの再読み込み**] ボタンが表示された場合は、このボタンをクリックします。

> **注意**  
> Azure Functions をローカルで実行できるように、[Azure Functions Core Tools](https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-run-local) を必ずインストールしてください。

### 関数を作成する
次に、製品を取得する関数を使って Azure Function アプリを拡張します。

  1. Visual Studio Code で、`F1` キーを押してコマンド パレットを開きます。
  1. [**Azure Functions: Create Function**] を入力して選択します。
  1. 関数の作成を求められたら、[**HTTP trigger**] を選択します。
  1. 関数の名前として、「**products-get**」と入力します。
  1. 認証レベルとして [**Anonymous**] を選択します。

> **注意**  
> Functions アプリは api フォルダー内にあります。これによって個々の Web アプリ プロジェクトから分離されます。 フロントエンド フレームワークを使用するすべての Web アプリでは、同じ API が呼び出されます。 アプリケーションをどのように構成するかを決めることができますが、このサンプルでは、それらが分離されているのがわかると役立ちます。

### HTTP メソッドとルート エンドポイントを構成する
*api/products-get* フォルダーに、*function.json* ファイルが含まれていることに注目してください。 このファイルには関数の構成が含まれています。

規則により、ルート エンドポイントには、関数が含まれるフォルダーと同じ名前が付けられます。 関数は *products-get* フォルダーに作成されるため、ルート エンドポイントは既定で **products-get** として生成されます。 しかし、エンドポイントを **products** にする必要があります。

次のようにして関数を構成します。

  1. *api/products-get/function.json* ファイルを開きます。
  1. メソッドにより `GET` と `POST` が両方許可されることに注目します。
  1. `GET` 要求だけを許可するように `"post"` を削除することでメソッド配列を変更します。
  1. メソッド配列の後に `"route": "products"` エントリを追加します。

これで、**products** に対する HTTP `GET` 要求で関数がトリガーされるようになりました。 *function.json* は次のコードのようになるはずです。

```json
{
  "bindings": [
    {
      "authLevel": "anonymous",
      "type": "httpTrigger",
      "direction": "in",
      "name": "req",
      "methods": ["get"],
      "route": "products"
    },
    {
      "type": "http",
      "direction": "out",
      "name": "res"
    }
  ]
}
```

### 関数ロジックを更新する

*api/products-get* フォルダーの *index.js* ファイルには、ルートに対して HTTP 要求を行うときに実行されるロジックが含まれています。

製品を取得するには、ロジックを更新する必要があります。 JavaScript モジュールの */shared/product-data.js* には、データ アクセス ロジックがあります。 `product-data` モジュールでは、ショッピング リストの製品を取得するための関数 `getProducts` を公開します。

ここで、関数エンドポイントを変更して製品が返されるようにします。

  1. *api/products-get/index.js* ファイルを開きます。
  1. その内容を次のコードに置き換えます

     ```JavaScript
     const data = require('../shared/product-data');

     module.exports = async function (context, req) {
       try {
         const products = data.getProducts();
         context.res.status(200).json(products);
       } catch (error) {
         context.res.status(500).send(error);
       }
     };
     ```

関数で製品が取得され、正常に完了した場合、それらは状態コード 200 で返されます。

### クロスオリジン リソース共有 (CORS) をローカルで構成する

Azure Static Web Apps に発行するときに、CORS について心配する必要はありません。 リバース プロキシを使用して Azure 上の API と通信できるように、Azure Static Web Apps で自動的にアプリが構成されます。 しかし、ローカルで実行する場合は、Web アプリと API が通信できるように CORS を構成する必要があります。

ここで、コンピューターでの Web アプリによる API に対する HTTP 要求を許可するように、Azure Functions に指示します。

  1. *api/local.settings.json* という名前のファイルを作成します。
  1. そのファイルに次の内容を追加します。

     ```json
     {
       "Host": {
          "CORS": "http://localhost:3000"
        }
     }
     ```
> **注意**  
> *local.settings.json* ファイルは *.gitignore* ファイルに一覧表示されます。これにより、このファイルは GitHub にプッシュされなくなります。 これは、このファイルにシークレットを格納できるため、GitHub では不要となるためです。 このため、テンプレートからリポジトリを作成したときに、ファイルを作成する必要がありました。

また最新の Azure Functions ランタイムについて、実行に使う Node.js のバージョンやこの変更に対応する設定をします。

  1. *api/host.json* を開きます。
  1. 拡張バンドルのバージョンを以下のように更新して保存します。

     ```json
     {
       "version": "2.0",
       "extensionBundle": {
         "id": "Microsoft.Azure.Functions.ExtensionBundle",
         "version": "[2.*, 3.0.0)"
       }
     }
     ```
  1. *react-app/staticwebapp.config.json* を開きます。
  1. バックエンドの API を動かすランタイムを以下のように指定して保存します。

     ```json
     {
       "navigationFallback": {
         "rewrite": "/index.html",
         "exclude": ["*.{css,scss,js,png,gif,ico,jpg,svg}"]
       },
       "platform": {
         "apiRuntime": "node:16"
       }
     }
     ```

### API を実行する

次は、Web アプリと Azure Functions プロジェクトが連動していることを監視します。 まず、これらの手順に従って、Azure Functions プロジェクトをローカルで実行します。

> **注意**  
> Azure Functions をローカルで実行できるように、[Azure Functions Core Tools](https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-run-local) を必ずインストールしてください。

  1. Visual Studio Code で、`F1` キーを押してコマンド パレットを開きます。
  1. 「**Terminal: Create New Terminal (In Active Workspace)**」と入力して選択します。
  1. *api* フォルダーに移動します。

     ```
     cd api
     ```
  1. Azure Functions アプリをローカルで実行します。

     ```
     func start
     ```

## Web アプリを実行する
API が実行されています。 ここで、API に対して HTTP 要求を行うようにフロントエンド アプリを構成する必要があります。 フロントエンド アプリはあるポートで実行され、API は別のポート (7071) で実行されます。 各フロントエンド フレームワークは、HTTP 要求をポートに安全にプロキシするように構成できます。

### プロキシ ポートを構成する
次の手順でフロントエンド アプリ用にプロキシを構成します。

  1. *react-app/package.json* ファイルを開きます。
  1. `"proxy": "http://localhost:7071/",` という設定を見つけます。
  1. プロキシのポートが 7071 を指していることを確認してください。

### フロントエンド Web アプリを実行する
API はポート 7071 で既に実行されています。 ここで Web アプリを実行すると、API に対して HTTP 要求が行われます。 これらの手順に従って、Web アプリを実行します。

  1. Visual Studio Code で、F1 キーを押してコマンド パレットを開きます。
  1. 「**Terminal: Create New Terminal (In Active Workspace)**」と入力して選択します。
  1. 次に、以下のように、任意のフロントエンド フレームワークのフォルダーに移動します。

     ```
     cd react-app
     ```
  1. フロントエンド クライアント アプリケーションを実行します。
     ```
     npm start
     ```

### アプリに移動する
次は、アプリケーションが Azure Functions API に対してローカルに実行されていることを確認します。

  1. `http://localhost:3000` を参照します。  
     アプリケーションをビルドしたので、ローカルで実行すると、API に対して HTTP GET 要求が行われるようになりました。
  1. ここで、ターミナルで `Ctrl` + `C` キーを押して、実行中のアプリと API を停止します。

## 次の手順
アプリはローカルで動作しています。次の手順では、アプリと API を一緒に発行します。

----

**[Home](./README.md)** 
