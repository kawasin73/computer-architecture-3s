# コンピューターアーキテクチャ課題

## アセンブラの実行

```bash
go run main.go sample.asm > sample.bin
```

## ModelSim のインストール

macOS では、[Quartus・ModelSim を macOS で使う環境構築](https://qiita.com/kawasin73/items/f89aba6bc1dee39c3863) に基づいて環境を構築します。

```bash
git clone https://github.com/kawasin73/computer-architecture-3s.git && cd computer-architecture-3s
# download Quartus-lite-18.0.0.614-linux.tar from http://dl.altera.com/?edition=lite
vagrant up
vagrant reload
vagrant scp Quartus-lite-18.0.0.614-linux.tar :/home/vagrant/
vagrant ssh
# login VM with ssh
$ tar -xvf Quartus-lite-18.0.0.614-linux.tar
$ ./setup.sh
$ exit
```
