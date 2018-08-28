# c,cxx笔记

### 关于inline
    1.如果将函数的实现放在头文件，并且标记为 inline 那么每一个包含该头文件的cpp文件都将得到一份关于该函数的定义，并且链接器不会报错。
    2.如果将函数的实现放在cpp文件中，并且标记为inline, 那么该函数对其他编译单元不可见，也就是其他cpp文件不能连接该函数库。若链接会出现undefined reference

    a.对于同一个文件来说，inline函数相对于extern函数是建议编译器内联展开；
    b.编译器一定会为该inline函数生成独立汇编代码，让外部文件调用该汇编代码，而不是让外部文件内联展开；
    c.inline函数是全局的，即和普通extern函数全局属性类似；
    d.当外部文件中有同名的非inline函数时，重定义错误；只定义inline函数会有undefined reference错误；

### extern 表明引用外部对象


c++中的vtable
虚函数


c++函数绑定:

1,普通函数
boost::function<int(int, int)> func1;
func1 = fsum;
std::cout << "4 + 5 = " << func1(4, 5) << std::endl;

2,成员函数
boost::function<void(Car*, int)> func2;
func2 = &Car::info;
Car car;
func2(&car, 25);
