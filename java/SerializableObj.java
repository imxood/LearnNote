package mymx.week2.tools;
/**
 * ���л�����
 * 
 * */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

import javax.swing.JOptionPane;

import mymx.week2.system.Account;
import mymx.week2.system.CreditAccount;
import mymx.week2.system.SavingAccount;

public class SerializableObj{

	/*public static void main(String[] args) {
		CreditAccount acc=new CreditAccount("123", "123", "123", "123", "123", 0);
		SavingAccount scc=new SavingAccount("456", "456", "456", "456", "456", 0);
		SerializableObj so=new SerializableObj();
		//String message = so.Write(acc, "aaa.txt");
		CreditAccount message = (CreditAccount) so.Read("aaa.txt");		
		
		JOptionPane.showMessageDialog(null, message, "Tips:", JOptionPane.INFORMATION_MESSAGE);			
	}*/
	//д����Ϣ
	public String Write(Object obj,String filename){
		try {
			FileOutputStream fos=new FileOutputStream(filename);//�������������
			ObjectOutputStream oos=new ObjectOutputStream(fos);//object
			oos.writeObject(obj);
			oos.close();
			fos.close();
			
		} catch (FileNotFoundException e) {
			return ""+e;
		} catch (IOException e) {
			return  ""+e;
		}
		
		return "д��ɹ���";
		
	}
	//��ȡ��Ϣ
	public Object Read(String filename){
			Object obj;
		try {
			FileInputStream fis=new FileInputStream(filename);//����������
			ObjectInputStream ois=new ObjectInputStream(fis);
			obj=(Object)ois.readObject();
			ois.close();
			fis.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			return  ""+e;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return  ""+e;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			return  ""+e;
		}
		
		return obj;
		
	}
}
