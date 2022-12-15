# 演習 - GitHub Actions を使用して API を発行する

**[Home](./README.md)** 

Web アプリと API の両方がローカルで実行されています。 次は、Web アプリと API を Azure Static Web Apps に発行します。

> **注意**  
> 本演習は GitHub へのアクセス (リポジトリの作成やコミット/プル リクエスト等のリポジトリに対する作業) が必要になります。  
GitHub へのアクセスに制限のある環境で実施する場合は、[こちら](./3-6-exercise-action-with-swacli.md)の手順を使用して演習を進めてください。

## GitHub に変更をプッシュする
前の演習では API を変更しました。 それらの変更を **api** ブランチにコミットし、これらの手順に従って GitHub にプッシュします。

  1. `F1` キーを選択して、Visual Studio Code コマンド パレットを開きます。
  1. 「**Git: Commit All**」と入力して選択します。
  1. ファイルの先頭に「**api changes**」などのコミット メッセージを入力します。
  1. Git コミット メッセージ ファイルを保存して閉じます。  
  1. `F1` キーを押し、コマンド パレットを開きます。
  1. 「**Git: Push**」と入力して選択します
  1. "**'api' ブランチに上流ブランチはありません。このブランチを公開しますか?**" というメッセージが表示された場合は、[**OK**] ボタンを押します

## pull request を作成する

**api** ブランチを GitHub にプッシュしました。 次は、GitHub アクションで、Web アプリと API をプレビュー URL で発行する必要があります。 したがって、次の手順では、**main** ブランチに対する pull request を作成します。

  1. ブラウザーを開きます
  1. リポジトリに移動します  
     `https://github.com/<YOUR_GITHUB_USERNAME>/my-static-web-app-and-api`

  1. [**Pull requests**] リンクをクリックします
  1. [**New pull request**] ボタンをクリックします
  1. [**base**] ドロップダウンから [**main**] ブランチを選択します
  1. [**compare**] ドロップダウンから [**api**] ブランチを選択します
  1. [**Create pull request**] ボタンをクリックします
  1. ここでも、2 つ目の [**Create pull request**] ボタンをクリックします

これで GitHub アクションがトリガーされました。

## GitHub アクションのビルドと発行を監視する
ブラウザーでリポジトリを開いたまま、GitHub アクションの進行状況を監視することができます。 進行状況を表示するには、これらの手順に従います。

  1. [**Actions**] メニューをクリックします
  1. 画面左のメニューの [**Azure Static Web Apps CI/CD**] ワークフロー項目をクリックします
  1. 右側のアクションの実行の最新 (一番上) のリンクを選びます
  1. [**Build and Deploy Job**] リンクをクリックします

Web アプリと API をビルドして発行するときに、GitHub アクションの進行状況を確認することができます。

## プレビュー URL を参照する
GitHub アクションが正常に完了したら、実行中のアプリをブラウザーで表示できます。

  1. [**Pull requests**] メニューをクリックします
  1. pull request を選択します
  1. リンクをクリックします。これは、[**Azure Static Web Apps: Your stage site is ready! Visit it here**] というメッセージに続いて表示されます

プレビュー URL には、後に数字が続くハイフンが含まれていることに注目してください。 この数字は、作成した pull request の pull request 番号と一致します。 作成するすべての pull request について、一意の反復可能なプレビュー URL を取得します。 また、リージョンはプレビュー URL の形成にも使用されます

## 次のステップ
お疲れさまでした。これで、Web アプリと API で最初の Azure Static Web Apps インスタンスが作成されました。

----

**[Home](./README.md)** 