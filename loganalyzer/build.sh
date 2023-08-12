# wget https://download.adiscon.com/loganalyzer/loganalyzer-4.1.13.tar.gz
tar -zxvf loganalyzer-4.1.13-src.tar.gz
docker buildx build -t liuyunwuhen/loganalyzer:alpine --platform=linux/arm64,linux/amd64 . --push
