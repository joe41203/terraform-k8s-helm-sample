# GCP 上にクラスタを作成

まずは config.tfvar や k8s-gcp-account.json の準備をする。

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
