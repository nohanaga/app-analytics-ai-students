# 演習 - Azure Functions から Azure Cosmos DB に接続するサーバーレスアプリケーションを Visual Studio Code で作成する 

**[Home](./README.md)**

この演習では、Visual Studio Code を使用して、Azure Functions から Azure Cosmos DB に接続するサーバーレスアプリケーションを作成します。 

## 環境を構成する
作業を開始する前に、次の要件が満たされていることを確認します。

- Node.js 18.13.0 。node --version コマンドを使用して、現在のバージョンを確認してください。
- Azure Functions Core Tools 4.x。(.NET Core 3.1 SDK が前提条件）
- Visual Studio Code 用 Azure Functions 拡張機能。
- Azure データベース拡張機能

## ローカル プロジェクトを作成する
このセクションでは、Visual Studio Code を使用して、ローカル Azure Functions プロジェクトを JavaScript で作成します。 

1. アクティビティ バーの Azure アイコンを選択します。 [ワークスペース (ローカル)] 領域の [Create Function...] ボタンを選択して、フォルダの選択画面が表示されたら作業用ディレクトリに移動し、プロジェクトワークスペースのディレクトリを作成します。 そのままプロジェクトワークスペースのディレクトリの場所を選択し、[選択] を選択します。 

> **重要**
> 
> 新しいフォルダーを作成するか、プロジェクト ワークスペースの空のフォルダーを選択する必要があります。 
> ワークスペースに最初から含まれているプロジェクト フォルダーは選択しないでください。
    
![1](https://user-images.githubusercontent.com/116857296/216900380-155f8808-de3b-43fe-a1fc-85a320856708.png)

2. 画面上部にコマンドパレットが表示されるので、プロンプトで次の情報を入力します。

    |  Prompt  |  [選択]  |
    | ---- | ---- |
    | Select a language for your function project (関数プロジェクトの言語を選択してください) | `JavaScript` |
    | Select a template for your project's first function (プロジェクトの最初の関数のテンプレートを選択してください) | `HTTP trigger` |
    | Provide a function name (関数名を指定してください) | `HttpExample`  |
    | 承認レベル | `Anonymous`を選択。承認レベルについては、[承認キー](https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-bindings-http-webhook-trigger#authorization-keys)を参照してください。 |
    | Select how you would like to open your project (プロジェクトを開く方法を選択してください) | `Add to workspace` |
    
    Visual Studio Code は、この情報を使用して、HTTP トリガーによる Azure Functions プロジェクトを生成します。 ローカル プロジェクト ファイルは、エクスプローラーで表示できます。 作成されるファイルの詳細については、[生成されるプロジェクトファイル](https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-develop-vs-code?tabs=javascript#generated-project-files)を参照してください。

## Azure に関数アプリを作成する
このセクションでは、Azure サブスクリプションに関数アプリと関連リソースを作成します。この作業を進めるには、Azure にサインインしておく必要があります。

1. まだ Azure にサインインしていない場合は、アクティビティバーの Azure アイコンを選択します。次に、[リソース] 領域で [Azure にサインイン...] を選択します。
　![image](https://user-images.githubusercontent.com/116857296/216564667-2daf4953-e829-4565-bbe6-ff524802d95e.png)
　既にサインインしていて、既存のサブスクリプションを確認できる場合は、4 に進みます。
1. ブラウザーでプロンプトが表示されたらご利用の Azure アカウントを選択し、その Azure アカウントの資格情報を使用してサインインします。
1. 正常にサインインしたら、新しいブラウザーウィンドウを閉じてかまいません。 ご利用の Azure アカウントに属しているサブスクリプションがサイド バーに表示されます。
1. 次に、[リソース] 領域の + アイコンを選択し、[Create Function App in Azure] (Azure に関数アプリを作成) オプションを選択します。
　![image](https://user-images.githubusercontent.com/116857296/216565933-8c5318ad-a155-44e7-b20b-f8969236bea8.png)
1. プロンプトで、次の情報を入力します。

    |  Prompt  |  [選択]  |
    | ---- | ---- |
    |  **サブスクリプションの選択**  |  ご自分のサブスクリプション（[リソース] 領域に表示されるサブスクリプションが 1 つだけのときは、このプロンプトは表示されません。）  |
    |  **Enter a globally unique name for the function app (関数アプリのグローバルに一意の名前を入力します)**  |  URL パスに有効な名前を入力。入力した名前は、Azure Functions 内での一意性を確保するために検証されます。  |
    |  **Select a runtime stack (ランタイム スタックを選択してください)**  |  `Node.js 18 LTS`  |
    |  **Select a location for new resources (新しいリソースの場所を選択してください)**  |  `東日本リージョン`  |
    
    この拡張機能は、Azure に作成されている個々のリソースの状態を [Azure: Activity Log] (Azure: アクティビティログ) パネルに表示します。
    ![image](https://user-images.githubusercontent.com/116857296/216568117-02647258-8d40-4932-9254-889f449331bb.png)

1. 作成が完了すると、次の Azure リソースがサブスクリプションに作成されます。リソースは、関数アプリの名前に基づいて命名されます。
* リソースグループ。関連リソースの論理コンテナーです。
* Standard Azure ストレージアカウント。プロジェクトについての状態とその他の情報を保持します。
* 関数アプリ。関数コードを実行するための環境となります。関数アプリを使用すると、同じホスティング プランに含まれるリソースの管理、デプロイ、共有を容易にするための論理ユニットとして関数をグループ化できます。
* App Service プラン。関数アプリの基になるホストを定義します。
* 関数アプリに接続された Application Insights インスタンス。アプリ内の関数の使用を追跡します。

　　関数アプリが作成され展開パッケージが適用されると、通知が表示されます。
  
> **ヒント**
> 
> 既定では、関数アプリに必要な Azure リソースが、指定した関数アプリ名に基づいて作成されます。 また、既定では、関数アプリを含んだ同じ新しいリソースグループがその作成先となります。それらのリソースの名前をカスタマイズしたり、既存のリソースを再利用したりする場合は、高度な作成オプションを使用してプロジェクトを発行する必要があります。

## Azure Cosmos DB を作成する
このセクションでは、Azure サブスクリプションに Azure Cosmos DB アカウントを作成します。アカウントを作成後、Azure Cosmos DB にデータベースとコンテナーを作成します。この作業を進めるには、Azure にサインインしておく必要があります。

> **重要**
> 
> [Azure Cosmos DB サーバーレス](https://learn.microsoft.com/ja-jp/azure/cosmos-db/serverless)は一般公開されました。 この使用量ベースのモードにより、Azure Cosmos DB がサーバーレスワークロードのための強力なオプションになります。 サーバーレスモードで Azure Cosmos DB を使用するには、アカウントの作成時に、 [Capacity mode] (容量モード) で [サーバーレス] を選択します。

1. Visual Studio Code で、[表示] (V)>[Command Pallete...] (コマンド パレット...) を選択したら、コマンド パレットで`Azure Databases: Create Server...`を検索します。
1. プロンプトで次の情報を入力します。

    |  Prompt  |  [選択]  |
    | ---- | ---- |
    |  **Azure データベース サーバーを選択してください**  |  `Core(SQL)`  |
    |  **アカウント名**  |  自分の Azure Cosmos DB アカウントを識別するための一意の名前を入力します。アカウント名に使用できるのは、小文字、数字、ハイフン (-) のみで、長さは 3 文字から 31 文字の範囲にする必要があります。  |
    |  **Select a capacity model (容量モデルを選択してください)**  |  `サーバーレス`  |
    |  **Select a resource group for new resources (新しいリソース用のリソース グループを選択してください)**  |  「Azure に関数アプリを作成する」の手順で関数アプリを作成したリソースグループを選択します。  |
    |  **Select a location for new resources (新しいリソースの場所を選択してください)**  |  `東日本リージョン`  |
    
    新しいアカウントがプロビジョニングされると、通知領域にメッセージが表示されます。

1. アクティビティ バーで Azure アイコンを選択し、[Resources] (リソース)>ご自分のサブスクリプション>[Azure Cosmos DB] を展開し、作成したアカウントを右クリックして、[Create database...] (データベースの作成...) を選択します。
1. プロンプトで次の情報を入力します。

    |  Prompt  |  [選択]  |
    | ---- | ---- |
    |  **データベース名**  |  `my-database`  |
    |  **Enter an id for your Collection (コレクションの ID を入力してください)**  |  `my-container`  |
    |  **Enter the partition key for the collection (コレクションのパーティション キーを入力してください)**  |  `/id`  |

1. [OK] を選択してコンテナーとデータベースを作成します。

## 関数アプリの設定を更新する
Azure Cosmos DB アカウントに接続するには、その接続文字列をアプリの設定に追加する必要があります。 その後に、新しい設定を local.settings.json ファイルにダウンロードして、ローカルで実行する際に Azure Cosmos DB アカウントに接続できるようにします。

1. Visual Studio Code で、新しい Azure Cosmos DB アカウントを右クリックし、[Copy Connection String] (接続文字列のコピー) を選択します。

    ![image](https://user-images.githubusercontent.com/116857296/216884172-4b99649a-5113-439e-91de-279c68015c49.png)
1. メニューの [表示] (V)>[コマンド パレット...] を開き、コマンド`Azure Functions: Add New Setting...`を検索して実行します。
1. 「Azure に関数アプリを作成する」の記事で作成した関数アプリを選択し、プロンプトで次の情報を入力します。

    |  Prompt  |  [選択]  |
    | ---- | ---- |
    |  **新しいアプリ設定名を入力する**  |  `CosmosDbConnectionString`  |
    |  **"CosmosDbConnectionString" の値を入力してください**  |  コピーした Azure Cosmos DB アカウントの接続文字列を貼り付けます。  |

　　これにより、Azure の関数アプリ内に「CosmosDbConnectionString」という名前のアプリケーション設定が作成されます。

4. メニューの [表示] (V)>[コマンド パレット...] を開き、コマンド`Azure Functions: Download Remote Settings...`を検索して実行します。
5. 「Azure に関数アプリを作成する」の記事で作成した関数アプリを選択し、[すべてはい] を選択して既存のローカル設定を上書きします。

　　これにより、新しい接続文字列の設定を含むすべての設定が Azure からローカルプロジェクトにダウンロードされます。

## バインディング拡張機能を登録し、出力バインディングを追加する
Azure Cosmos DB の出力バインドを使用するには、プロジェクトを実行する前に対応するバインド拡張機能をインストールしておく必要があります。ツールまたはポータルから non-.NET Functions プロジェクトを作成すると、[拡張機能バンドル](https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-bindings-register#extension-bundles)を使用するように構成されています。これにより、事前定義された一連の拡張機能パッケージが自動的にインストールされます。拡張機能バンドルの使用は、プロジェクトのルートにある host.json ファイルで次のように有効になっています。これで、Azure Cosmos DB の出力バインドをプロジェクトに追加できるようになります。

```JSON
    {
      "version": "2.0",
      "extensionBundle": {
        "id": "Microsoft.Azure.Functions.ExtensionBundle",
        "version": "[3.*, 4.0.0)"
      } 
    }
```

Functions では、各種のバインドで、`direction`、`type`、および固有の`name`が function.json ファイル内で定義される必要があります。これらの属性を定義する方法は、関数アプリの言語によって異なります。
バインドの属性は、function.json ファイルで直接定義されています。バインドの種類によっては、追加のプロパティが必要になることもあります。Azure Cosmos DB の出力構成では、Azure Cosmos DB 出力バインドに必要なフィールドについて説明します。この拡張機能により、バインドを簡単に function.json ファイルに追加できます。

1. バインドを作成するには、`HttpTrigger`フォルダー内の`function.json`ファイルを右クリックして、[バインドの追加] を選択します。プロンプトに従って、次のバインド プロパティを定義します。

    |  Prompt  |  値  |
    | ---- | ---- |
    |  **Select binding direction (バインド方向を選択する)**  |  `out`  |
    |  **Select binding with direction "out" ("外" 方向のバインドを選択する)**  |  `Azure Cosmos DB`  |
    |  **コードでこのバインドの特定に使用する名前**  |  `outputDocument`  |
    |  **データを書き込む Azure Cosmos DB データベース**  |  `my-database`  |
    |  **データが書き込まれるデータベース コレクション**  |  `my-container`  |
    |  **データが書き込まれるデータベース コレクション**  |  `false`  |
    |  **データが書き込まれるデータベース コレクション**  |  `CosmosDbConnectionString`  |
    |  **パーティション キー (省略可能)**  |  空白のまま  |
    |  **コレクションのスループット (省略可能)**  |  空白のまま  |

　　バインドは、`function.json`の`bindings`配列に追加されます。このファイルは、存在する`undefined`値をすべての削除した後、次のようになります。

```JSON
    {
    "type": "cosmosDB",
    "direction": "out",
    "name": "outputDocument",
    "databaseName": "my-database",
    "collectionName": "my-container",
    "createIfNotExists": "false",
    "connectionStringSetting": "CosmosDbConnectionString"
    }
```

2. 出力バインディングを追加したら`index.js`に移動し、`context.bindings`で`outputDocument`出力バインド オブジェクトを使用して JSON ドキュメントを作成するコードを追加します。このコードを`context.res`ステートメントの前に追加します。
    
    ```JavaScript
    if (name) {
        context.bindings.outputDocument = JSON.stringify({
            // create a random ID
            id: new Date().toISOString() + Math.random().toString().substring(2, 10),
            name: name
        });
    }
    ```
    
    この時点で、関数は次のようになります。
        
    ```JavaScript
    module.exports = async function (context, req) {
        context.log('JavaScript HTTP trigger function processed a request.');

        const name = (req.query.name || (req.body && req.body.name));
        const responseMessage = name
            ? "Hello, " + name + ". This HTTP triggered function executed successfully."
            : "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.";

        if (name) {
            context.bindings.outputDocument = JSON.stringify({
                // create a random ID
                id: new Date().toISOString() + Math.random().toString().substring(2, 10),
                name: name
            });
        }

        context.res = {
            // status: 200, /* Defaults to 200 */
            body: responseMessage
        };
    }
    ```
    
    このコードは、ドキュメントと HTTP 応答の両方を含む`MultiResponse`オブジェクトを返すようになりました。
    
## 関数をローカルで実行する
Visual Studio Code を Azure Functions Core Tools と統合することで、このプロジェクトをローカルの開発用コンピューター上で実行してから、Azure に発行することができます。

1. 関数をローカルで開始するには、左側のアクティビティ バーの [実行とデバッグ] アイコンを押します。 ターミナルパネルに、Core Tools からの出力が表示されます。アプリがターミナルパネルで起動します。 HTTP によってトリガーされる関数の URL エンドポイントがローカルで実行されていることを確認できます。
![image](https://user-images.githubusercontent.com/116857296/216887314-f6ff5601-c715-4aff-91ae-ee9eca5864a2.png)
    Windows での実行に問題がある場合、Visual Studio Code の既定のターミナルが WSL Bash に設定されていないことをご確認ください。
1. Core Tools がターミナルでまだ実行されている状態で、アクティビティ バーの Azure アイコンを選択します。 [ワークスペース] 領域で、[ローカル プロジェクト]>[関数] を展開します。HttpExample 関数を右クリックし、[Execute Function Now] (今すぐ関数を実行) を選択します。
![image](https://user-images.githubusercontent.com/116857296/216887725-a1d7f537-5593-402c-b6c8-b3b0ea860d53.png)
1. プロンプトが表示されたら [Enter request body] (要求本文を入力してください) に、要求メッセージ本文の値が表示されます。 Enter キーを押して、この要求メッセージを関数に送信します。
1. 応答が返されたら、Azure portal を開き Azure Cosmos DB アカウントで、 [データ エクスプローラー] を選択します。
1. データベースとコンテナーを展開し、 [項目] を選択して、コンテナー内に作成されたドキュメントを一覧表示します。
1. 出力バインドによって新しい JSON ドキュメントが作成されたことを確認します。
![image](https://user-images.githubusercontent.com/116857296/216887871-7bdd29e1-cc02-4d78-8ab6-3d6fc9a5dbe3.png)
1. Visual Studio Code に戻り、メニューの [実行] (R)>[デバッグの停止] を押して Core Tools を停止し、デバッガーの接続を解除します。

　　関数がローカル コンピューター上で正常に動作することを確認したら、Visual Studio Code を使用してプロジェクトを直接 Azure に発行します。
  
## アプリをデプロイして検証する
アプリを発行するには、Azure にサインインしておく必要があります。

> **重要**
> 
> 既存の関数アプリにデプロイすると、Azure にあるそのアプリの内容が常に上書きされます。

1.アクティビティ バーの Azure アイコンを選択し、[ワークスペース] 領域でプロジェクト フォルダーを選択して、[デプロイ] ボタンを選択します。

![image](https://user-images.githubusercontent.com/116857296/216890224-7a7a8e93-3845-4ab0-8957-2dabb4bddb0e.png)
1. [Deploy to Function App] (関数アプリへのデプロイ) を選択し、プロンプトで先ほど作成した関数アプリを選び、メッセージが表示されたら [Deploy] (デプロイ) を選択します。
1. デプロイの完了後、[View Output] (出力の表示) を選択すると、作成済みの Azure リソースなど、作成とデプロイの結果が表示されます。 通知を見逃した場合は、右下隅にあるベル アイコンを選択して、再度確認します。
![image](https://user-images.githubusercontent.com/116857296/216890286-e3b365ab-c67f-4139-af2e-15ae5aea21e3.png)
1. サイド バー内の[リソース] 領域に戻り、サブスクリプション>[Funcsion APP]>[Azure に関数アプリを作成する] の記事で作成した関数アプリ>[Functions] にデプロイした関数アプリができていることを確認し、デプロイした関数アプリを右クリックして、[Execute Function Now] (今すぐ関数を実行) を選択します。
![image](https://user-images.githubusercontent.com/116857296/216890441-962532d1-5ab2-409a-bf37-5799671aa8d9.png)
1. プロンプトが表示されたら [Enter request body] (要求本文を入力してください) に、要求メッセージ本文の値が表示されます。`Azure`の内容を任意の文字に変更し、Enter キーを押してこの要求メッセージを関数に送信します。
1. 先のローカル実行時と同様に、Azure portal で Azure Cosmos DB コンテナーに作成されたドキュメントを確認し、出力バインドによって再び新しい JSON ドキュメントが生成されていることを確認します。

## 次のステップ
お疲れさまでした。これで、Azure Function 上に Azure Cosmos DB を使用したサーバーレスアプリケーションが作成されました。
次章では Static Web Apps で SPA 開発を行います。

----

**[Home](./README.md)** 
