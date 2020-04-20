## Curlerio - Running Selenium Scripts using curl

Provides solution for running selenium scripts using curl on **local** & **browserstack**

### How to run on local

#### Start selenium grid (Selenium HUB + Selenium Node)

`./script.sh`

#### Executing Script

IP Check : `./run.sh --ip-check --parallel-threads 3`
Opening Chrome : `./run.sh --parallel-threads 3`

### How to run on browserstack

IP Check : `./run.sh --ip-check --parallel-threads 3 --browserstack`
Opening Chrome : `./run.sh --parallel-threads 3 --browsertack`
