# 2. Upload package ada dienpoint berbeda

Date: 2018-03-25

## Context

Sebagai user dapat menginput foto produk. 

## Decision

Kenapa upload dipisah, tidak ada didalam package produk. Karena fungsi upload itu sendiri seharusnya independent. nantinya yang menggunakan fungsi upload bukan hanya package product saja. Bisa saja user juga bisa menggunakan package upload ketika package user membutuhkan upload misal data KTP atau foto profilenya.

Desain Endpoint upload

- Request

```bash

    curl -X POST \
        http://localhost:8080/api/upload \
        -H 'Accept: application/json' \
        -H 'Cache-Control: no-cache' \
        -H 'Content-Type: form-data' \
        -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
        -F 'files[]=@C:\Users\screa\OneDrive\Foto\walpaper\11.png' \
        -F userId=21501

```

- Response

```json

    {
        "url": {
            "http://localhost:8080/img/76ee3de97a1b8b903319b7c013d8c877.png"
        }
    }

```

hasil dari url yang akan ditembakan ketika Create atau Update Produk

## Consequences