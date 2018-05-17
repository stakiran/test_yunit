# Test Yunit
AutoHotkey の Unittest Framework [YUnit](https://github.com/Uberi/Yunit) を使ってみた。

サンプルではデータ構造のスタックを実装したクラス Stack を簡単にユニットテストしてます。

## Requirement
- AutoHotkey v1.1.x
  - **1.1.10.1 だと YUnit が動作しなかった** (ObjDelete 関数が Call to nonexistent function エラーになる)
  - [1.1.28.02](https://www.autohotkey.com/download/1.1/AutoHotkey_1.1.28.02.zip) だと動作した

## Installation

```
$ git clone https://github.com/stakiran/test_yunit
$ cd test_yunit
$ mkdir lib
$ cd lib
$ git clone https://github.com/Uberi/Yunit
$ cd ..
$ unittest.ahk
```

## Yunit の使い方

```ahk
; 必要なら適宜設定する
#SingleInstance FORCE         ; 複数起動してもインスタンスは一つにする
SetWorkingDir %A_ScriptDir%   ; 相対パスの基準をこのスクリプトベースに

; ★YUnit を Include
#Include <Yunit/Yunit>
#Include <Yunit/Window>  ; 結果をウィンドウで表示する追加モジュール

; ★テスト対象を Include
#Include stack.ahk

; ★Use にて YUnit の追加モジュールを指定(Includeしたやつ)
; Test にて下記のテストスイートを指定
Tester := Yunit.Use(YunitWindow).Test(StackTest)

; ★テストスイート. ここにテストケースを書いていく.
class StackTest {
    Begin(){
      ; 各テストケース毎に呼ばれる
    }
    
    End(){
      ; 各テストケース毎に呼ばれる
    }

    ; ★テストケース1
    ; メソッド名は何でもいい.
    test_push_and_pop(){
        s1 := new Stack()

        s1.push("hoge")
        s1.push("fuga")

        v := s1.pop()

        ; ★アサーションは Yunit.assert のみ
        Yunit.assert(v == "fuga")

        v := s1.pop()
        Yunit.assert(v == "hoge")

        Yunit.assert(s1.len() == 0)

        Yunit.assert(s1.is_empty())

    }

    test_empty_pop(){
        s1 := new Stack()
        s1.push("hoge")

        ; ★例外が出たかどうかを直接調べる手段は無いので,
        ;   ここでは try-catch で例外発生有無を調べてフラグに入れた上で
        ;   そのフラグを assert することで実現した.

        be_not_thrown := true
        try {
          s1.pop()
        } catch e {
          be_not_thrown := false
        }
        Yunit.assert(be_not_thrown)

        be_thrown := false
        try {
          s1.pop()
        } catch e {
          be_thrown := true
        }
        Yunit.assert(be_thrown)
    }
}
```

## スクリーンショット
テスト結果はこんな感じ。

成功時:

![succeeded](https://user-images.githubusercontent.com/23325839/40174018-b5b9507a-5a0e-11e8-8857-7d947a825dd2.jpg)

失敗時:

![failed](https://user-images.githubusercontent.com/23325839/40174019-b5e3209e-5a0e-11e8-916e-d8373abf9963.jpg)

## License
[MIT License](LICENSE)

## Author
[stakiran](https://github.com/stakiran)
