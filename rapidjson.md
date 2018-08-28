## 常见问题

1. 如何清空并最小化 document 或 value 的容量

    调用 SetXXX() 方法 - 这些方法会调用析构函数，并重建空的 Object 或 Array

    ~~~~~~cpp
    Document d;
    ...
    d.SetObject();  // clear and minimize
    d.SetNull();    //初始状态
    ~~~~~~

