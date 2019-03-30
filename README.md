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
