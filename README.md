# grafana-validator
[![GoDoc](https://godoc.org/github.com/christianwoehrle/grafana-validator?status.svg)](https://godoc.org/github.com/christianwoehrle/grafana-validator)
[![CircleCI](https://img.shields.io/circleci/project/github/christianwoehrle/grafana-validator.png)](https://circleci.com/gh/christianwoehrle/grafana-validator)
[![Go Report Card](https://goreportcard.com/badge/github.com/christianwoehrle/grafana-validator)](https://goreportcard.com/report/github.com/christianwoehrle/grafana-validator)


Simple test for grafana

When we deploy our K8S CLuster we want to test if all components are working.

For the prometeheus stack we test is Grafana is available and if it can access its datasources.


Test if grafana is available and cann access its datasources
Tests if 
GET /api/datasources
https://grafana.com/docs/http_api/data_source/

https://grafana.com/docs/http_api/data_source/#data-source-proxy-calls
Data source proxy calls
GET /api/datasources/proxy/:datasourceId/*

{app="loki"}



Alert eintragen und schauen ob das triggert



