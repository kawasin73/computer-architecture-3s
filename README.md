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

## テストの実行

1. テストコードをアセンブル
    ```
    go run main.go computer/test.asm > computer/test.bnr
    ```
2. ModelSimで全てのVerilogコードをコンパイル
3. ModelSimでシミュレーションの実行 + 出力
    ```
    vsim work.test_computer
    run 6000
    mem save -o sample.mem -f mti -data symbolic -addr hex /test_computer/computer_body/rf_body/rf
    ```
4. 出力を検証する
    ```
    diff computer/test.mem computer/sample.mem
    ```
5. 差分がなかった場合はテスト完了
