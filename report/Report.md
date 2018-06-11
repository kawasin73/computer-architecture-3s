# コンピュータアーキテクチャレポート

## 課題1

> この授業で設計したプロセッサのアセンブラをPerlで実装せよ

Go言語で実装した。ソースコードは、[https://github.com/kawasin73/computer-architecture-3s](https://github.com/kawasin73/computer-architecture-3s)にアップロードしている。

## 課題2

> 1 + 1 = 2 などをアセンブルする

アセンブリコードは以下の通り

```:sample.asm
addi r1, r0, 1
addi r2, r0, 1
add r3, r1, r2
```

以下のコマンドでマシン語の変換を行う

```
go run main.go report/sample.asm > report/sample.bin
```

出力された0,1のコードは以下の通り

```:sample.bin
000001_00000_00001_0000000000000001_
000001_00000_00010_0000000000000001_
000000_00001_00010_00011_00000000000_

```

