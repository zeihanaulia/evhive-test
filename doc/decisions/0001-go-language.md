# 1. Go Language for this test

Date: 2018-03-25

## Context

Untuk menyesaikan test dengan persyaratan mengharuskan menggunakan GO Language.

## Decision

- GO adalah bahasa yang cukup sering saya gunakan pekerjaan harian saya 
- Beberapa bahasa pemrograman GO tahun belakangan ini popularitasnya sedang naik, dengan dukungan komunitas yang semakin besar juga
- Selain itu GO juga memiliki reputasi yang baik sebagai bahasa pemrograman yang memiliki performa yang tinggi
- GO juga sangat baik menangani concurrent server application dengan adanya native multi-threading, async dan multi-processing
- Bahasa GO sendiri memiliki paradigma imperative dan ada juga yang seperti Object Oriented dimana go memiliki type dan method
- Sedang object dalam GO disebut dengan Struct

## Consequences

- GO memiliki masalah pada versioning control
- Tapi seharusnya di standard library baru [dep](https://github.com/golang/dep) seharusnya sudah selesai masalah versioning
