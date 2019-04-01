# GCP 上にクラスタを作成

まずは config.tfvar や k8s-gcp-account.json の準備をする。以下の記事を参考。

https://techblog.gmo-ap.jp/2017/11/16/terraform%E3%81%A7gcp%E7%92%B0%E5%A2%83%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B/

workspace を移動する

```
$ cd terraform
```

terraform を初期化

```
$ terraform init
```

terraform plan で作成されるクラスタを確認

```
$ terraform plan -var-file="config.tfvars"
```

問題なければクラスタを作成

```
$ terraform apply -var-file="config.tfvars"
```

クラスタを生成し終えたら kubectl で操作できるようにする

```
$ gcloud container clusters get-credentials k8s
```

# GCP 上にアプリケーションをデプロイ

workspace を k8s に移動

```
$ cd k8s
```

db 用のパスワードを追記・暗号化

```
$ kubectl create secret generic db-password --from-file=./db-password.txt
```

secret が生成されているか確認

```
$ kubectl get secrets
```

# 躓いたところ

全てここに解決策が書かれている
https://qiita.com/esplo/items/6a47f635556b085c975c

1. Nginx と Puma の通信は sockets を使うことを知らなかった
2. Pod で複数のコンテナを運用すると一部データが消えることを注意する。例えば myapp/public。rails が親の image で、nginx image で空上書きするため消えてしまう(sockets の通信や、assets precompile で詰まった。死んだ。Nginx と Rails で public を共有しない形にして一旦回避・・)
