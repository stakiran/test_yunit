class Stack{
  __New(){
    this._stack := Object()
    this._stack.SetCapacity(0)
  }

  is_empty(){
    l := this.len(this._stack)
    Return l==0
  }

  len(){
    l := this._stack.GetCapacity()
    Return l
  }

  push(data){
    l := this.len(this._stack)
    new_length := l + 1
    this._stack.SetCapacity(new_length)
    this._stack.Insert(data)
  }

  pop(){
    if(this.len(this._stack)==0){
      Throw "EmptyStackPopError"
    }

    l := this.len(this._stack)
    new_length := l - 1
    data := this._stack[l]
    this._stack.Remove()
    this._stack.SetCapacity(new_length)
    return data
  }
}
