https://blog.csdn.net/qianqing13579/article/details/45318279

void Learn_Mat_Definiton() //测试一下step[]的各个维度大小
{

    //////////////////Demo1(3维矩阵)///////////////////////////////////////////
    printf("//////////////////////Demo1(3维矩阵)////////////////////////\n");
    //最后面的两个数：(行，列),确定了一个面
    //是一个依次降维的过程
    //8,10组成了面，5个面，组成了立方体
    int matSize[] = {5, 8, 10}; //每一维元素的个数：8：行，10：列
    Mat mat1(3, matSize, CV_16UC3, Scalar::all(0));

    //求step[i]的大小:每一维元素的大小(单位字节)
    printf("\n///////step[i]的大小//////////\n");
    printf("step[0]:%d\n", mat1.step[0]); //480：面的大小(第一维)
    printf("step[1]:%d\n", mat1.step[1]); //60：线的大小(第二维)
    printf("step[2]:%d\n", mat1.step[2]); //6：点的大小(第三维)

    //求size[i]：每一维元素的个数
    printf("\n///////size[i]的大小///////\n");
    printf("size[0]:%d\n", mat1.size[0]); //5：面
    printf("size[1]:%d\n", mat1.size[1]); //8：线
    printf("size[2]:%d\n", mat1.size[2]); //10：点

    //求step1(i)：每一维元素的通道数
    printf("\n///////step1(i)的大小///////\n");
    printf("step1(0):%d\n", mat1.step1(0)); //240:面
    printf("step1(1):%d\n", mat1.step1(1)); //30:线
    printf("step1(2):%d\n", mat1.step1(2)); //3:点

    //求elemSize：每个元素的大小(单位字节)
    printf("\n///////elemSize的大小///////\n");
    printf("elemSize:%d\n", mat1.elemSize()); //6：每个元素的大小

    //求elemSize1：每个通道的大小(单位字节)
    printf("\n///////elemSize1的大小///////\n");
    printf("elemSize1:%d\n", mat1.elemSize1()); //2：每个通道的大小
}