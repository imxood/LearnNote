1,IO������









2,�̲߳���:











3,property�ļ������ã�

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

/**
 * @author zxw
 * 
 */
public class GetSaveProp {

	private void saveProperty() {
		// �����ļ�
		Properties propertie = new Properties();
		String characterString = "1�й���";
		propertie.setProperty("character", characterString);
		propertie.setProperty("date", new Date().toString());

		String fileName = "savetest.properties";
		String description = "CharaterTest";
		try {
			FileOutputStream outputFile = new FileOutputStream(fileName);
			propertie.store(outputFile, description);// property��ؼ���store����
			outputFile.close();
			// propertie.list(System.out);
			System.out.println("File was saved!");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new GetSaveProp().saveProperty();//save file

		// read from property
		Properties readProps = new Properties();
		FileInputStream inStream;
		try {
			inStream = new FileInputStream("savetest.properties");
			readProps.load(inStream);
			// props.list(System.out);
			if (readProps.get("character") != null) {
				System.out.println("character="
						+ new String(readProps.getProperty("character")
								.getBytes("ISO-8859-1"), "UTF-8"));
				System.out.println("character="
						+ new String(readProps.getProperty("character")
								.getBytes("UTF-8"), "UTF-8"));

			} else {
				System.out.println(readProps.get("character"));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}







4,HashMap��HashTable




5,ʲô��java���л������ʵ��java���л���

Java ���л���������ʹ�㽫һ�������״̬д��һ��Byte ���
���ҿ��Դ������ط��Ѹ�Byte ��������ݶ����������¹���һ����ͬ�Ķ���.
���ֻ��������㽫����ͨ��������д�������������ʱ�Ѷ���־û������ݿ⡢�ļ���ϵͳ�
Java�Ĵ��л�������RMI��EJB�ȼ����ļ���������
��;�����ö���Ĵ��л�ʵ�ֱ���Ӧ�ó���ĵ�ǰ����״̬���´���������ʱ���Զ��ػָ����ϴ�ִ�е�״̬��

http://blog.csdn.net/yakihappy/article/details/3979373


6,oracal�İ�װ


HKEY_LOCAL_MACHINE		
		
		SOFTWARE
			ORACAL(ɾ��)
		SYSTEM
			ORACAL(�������ͷ��ȫɾ��)
			CURRENTVONTROL_SET

7,ʱ��ת��:
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��



create trigger triggerName

after/before insert/update/delete on ����

for each row   #��仰��mysql�ǹ̶���

begin

sql���;

end;