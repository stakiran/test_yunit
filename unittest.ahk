#SingleInstance FORCE
SetWorkingDir %A_ScriptDir%

#Include <Yunit/Yunit>
#Include <Yunit/Window>
#Include stack.ahk

Tester := Yunit.Use(YunitWindow).Test(StackTest)

class StackTest {
    Begin(){
      ; 各テストケース毎に呼ばれる
    }
    
    End(){
      ; 各テストケース毎に呼ばれる
    }

    ; テストケース1
    test_push_and_pop(){
        s1 := new Stack()

        s1.push("hoge")
        s1.push("fuga")

        v := s1.pop()
        Yunit.assert(v == "fuga")

        v := s1.pop()
        Yunit.assert(v == "hoge")

        Yunit.assert(s1.len() == 0)

        Yunit.assert(s1.is_empty())

    }

    test_empty_pop(){
        s1 := new Stack()
        s1.push("hoge")

        ; 例外が出たかどうかを直接調べる手段は無いので,
        ; try-catch で例外発生有無を調べてフラグに入れた上で
        ; そのフラグを assert する.

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
