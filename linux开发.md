
1、获取文件的flags，即open函数的第二个参数:
    flags = fcntl(fd,F_GETFL,0);
    fcntl(fd,F_SETFL,flags);

3、增加文件的某个flags，比如文件是阻塞的，想设置成非阻塞:

    flags = fcntl(fd,F_GETFL,0);

    flags |= O_NONBLOCK;

    fcntl(fd,F_SETFL,flags);

4、取消文件的某个flags，比如文件是非阻塞的，想设置成为阻塞:

    flags = fcntl(fd,F_GETFL,0);

    flags &= ~O_NONBLOCK;

    fcntl(fd,F_SETFL,flags);

    加锁，
    struct flock file_lock;
    file_lock.l_type = F_WRLCK;
    file_lock.l_whence = SEEK_SET;
    file_lock.l_start = 0;
    file_lock.l_len = 0;
    file_lock.l_pid = getpid();
    fcntl(fd, F_SETLK, &file_lock)

    fd = open("/dev/buttons", O_RDWR );

    fcntl(fd, F_SETFL, 0);

    n_write = write(fd, &key_val, 1);
    n_read = read(fd, &key_val, 1);

    termios.c_cc[VMIN]=10;
    termios.c_cc[VTIME]=10;//1s
    这两行代码指的是:在10个字符或10个十分之一秒的条件下，若满足其中一个,则read返回，
    某一个为0则不考虑那一个条件

    tcsetattr(fd, TCSAFLUSH, &options);//刷新设置




### 移动文件流的读写位置
    int fseek(FILE * stream, long offset, int whence);
    offset 为根据参数whence 来移动读写位置的位移数
    whence 为下列其中一种:
        SEEK_SET 从距文件开头offset位移量为新的读写位置.
        SEEK_CUR 以目前的读写位置往后增加offset 个位移量.
        SEEK_END 将读写位置指向文件尾后再增加offset 个位移量.
        当whence 值为SEEK_CUR 或 SEEK_END 时, 参数offset 允许负值的出现.

### strftime()
    strftime()函数可以把YYYY-MM-DD HH:MM:SS格式的日期字符串转换成其它形式的字符串。
    strftime()的语法是strftime(格式, 日期/时间, 修正符, 修正符, ...)

    它可以用以下的符号对日期和时间进行格式化：
    %d 日期, 01-31
    %f 小数形式的秒，SS.SSS
    %H 小时, 00-23
    %j 算出某一天是该年的第几天，001-366
    %m 月份，00-12
    %M 分钟, 00-59
    %s 从1970年1月1日到现在的秒数
    %S 秒, 00-59
    %w 星期, 0-6 (0是星期天)
    %W 算出某一天属于该年的第几周, 01-53
    %Y 年, YYYY
    %% 百分号

    strftime()的用法举例如下：

    select strftime('%Y.%m.%d %H:%M:%S','now','localtime');
    结果：2006.10.17 21:41:09
    其实更好的用法是这样的,比如统,本月或本年的支出:
    select strftime('%Y-%m',日期) as 月份,sum(支出) as 月支出 from 流水帐 group by 月份;

### 根据文件描述符获取文件名
    char buff[1024];  
    char filepath[1024];  
    memset(buff, 0, 1024);  
    memset(filepath, 0, 1024);  
    sprintf(buff, "/proc/%d/fd/%d", getpid(), fd);  
    readlink(buff, filepath, 1024);  
    basename(filepath); // 这就是文件名了


### 常用的文件操作
    fgets
    popen/pclose
    perror