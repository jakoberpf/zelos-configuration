# vault storage migration

```bash
vault operator migrate -config migrate.hcl -start "data/logical/fd"
```

## Migrations

### AWS S3 to AWS DynamoDB

- https://developer.hashicorp.com/vault/docs/configuration/storage/s3
- https://developer.hashicorp.com/vault/docs/configuration/storage/dynamodb

```json
storage_source "s3" {
  username = "user1234"
  password = "secret123!"
  database = "vault"
}

storage_destination "dynamodb" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}
```
