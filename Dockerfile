# ベースイメージ
FROM node:20.14.0-bookworm-slim as base

# 作業ディレクトリを作成
WORKDIR /app

# npmをインストール
RUN npm install -g npm@10.8.1

# 開発環境用イメージ
FROM base as dev

# package.jsonなどをコンテナ環境にコピーし、installする
COPY ./react/package*.json ./
RUN npm install

# ソースコードをコンテナにコピー
COPY ./react .

# サーバーを起動するコマンド
CMD ["npm", "start"]