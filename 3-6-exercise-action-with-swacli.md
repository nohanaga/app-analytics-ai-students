# 演習 - GitHub Actions を使用して API を発行する

**[Home](./README.md)** 

Web アプリと API の両方がローカルで実行されています。 次は、Web アプリと API を Azure Static Web Apps に発行します。

## 静的 Web アプリへのアプリケーション、および、API の展開
GitHub アクションが正常に完了したら、実行中のアプリをブラウザーで表示できます。

  1. 静的 Web アプリに `react-app/build` 内のコンテンツ、および `api` 内の関数コードを展開します。

     ```bash
     npx --package @azure/static-web-apps-cli swa deploy react-app/build --env Production --swa-config-location react-app --deployment-token <デプロイ トークン> --api-location ./api
     ```

  1. コマンドが正常に終了すると、`√ Project deployed to <サイトの URL> 🚀` というメッセージが表示されるので、ブラウザーのアドレス バーに URL を入力して、展開したシングル ページ アプリケーションを表示します。  

## 次のステップ
お疲れさまでした。これで、Web アプリと API で最初の Azure Static Web Apps インスタンスが作成されました。

----

**[Home](./README.md)** 