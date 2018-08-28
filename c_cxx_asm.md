int snprintf(char *str, size_t size, const char *format, ...)
(1) 如果格式化后的字符串长度 < size，则将此字符串全部复制到str中，并给其后添加一个字符串结束符('\0')
(2) 如果格式化后的字符串长度 >= size，则只将其中的(size-1)个字符复制到str中，并给其后添加一个字符串结束符('\0')，返回值为欲写入的字符串长度

void *memcpy(void *dest, const void *src, size_t n);
从源src所指的内存地址的起始位置开始拷贝n个字节到目标dest所指的内存地址的起始位置中


任务对象:

(k-v)多个消息队列
msg_queue_->message_count()
Message_Block[]
    release

    m_pVoiceBuff

    Message_Block

SendVoiceToTaskQue(m_pVoiceBuff, nActualVoiceBufLen);

while(isRun){

}

单元测试很重要

static std::string UrlEncode(const std::string &str)
{
    std::string strTemp = "";
    size_t length = str.length();
    for (size_t i = 0; i < length; i++)
    {
        if (isalnum((unsigned char)str[i]) ||
            (str[i] == '-') ||
            (str[i] == '_') ||
            (str[i] == '.') ||
            (str[i] == '~') ||
            (str[i] == '=') ||
            (str[i] == '&'))
        {
            strTemp += str[i];
        }
        else if (str[i] == ' ')
            strTemp += "+";
        else
        {
            strTemp += '%';
            strTemp += ToHex((unsigned char)str[i] >> 4);
            strTemp += ToHex((unsigned char)str[i] % 16);
        }
    }
    return strTemp;
}

static std::string UrlDecode(const std::string &str)
{
    std::string strTemp = "";
    size_t length = str.length();
    for (size_t i = 0; i < length; i++)
    {
        if (str[i] == '+')
            strTemp += ' ';
        else if (str[i] == '%')
        {
            assert(i + 2 < length);
            unsigned char high = FromHex((unsigned char)str[++i]);
            unsigned char low = FromHex((unsigned char)str[++i]);
            strTemp += high * 16 + low;
        }
        else
            strTemp += str[i];
    }
    return strTemp;
}


## 正则使用

    单个字符

    [abc] 匹配 a, b 或 c.
    [^xyz] 匹配任何非 x, y, z的字符

    组（用以匹配连续的多个字符）

    (a+).*

    example:
    
    "/topic/voice/tts/in/topic_id" ---> regex reg("^(/topic).*(/topic_id)$", regex::icase);

### 使用c++11计时

```c++
    auto start = chrono::system_clock::now();
    sleep(1);
    auto end = chrono::system_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(end - start);
    printf("%ld\n", duration.count());
```
