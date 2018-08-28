
/* 1,���ִ���
	ORA-01034: ORACLE not available 
    ORA-27101: shared memory realm does not exist
  ����취: */
		

show user;--��ʾ��ǰ
conn username/password as sysdba;(��sysoper)--����һ���û� ӵ�����ݿ�dba�Ľ�ɫ
disc;			--�Ͽ�����
clear screen;	--����
start xxxx.sql;	--ִ��sql����
@ xxx.sql;		----ִ��sql����
desc ����		--�鿴һ����Ľṹ
spool  filename --��ʱ�ģ�ԭ���������ǲ����ڵģ��൱�½�һ���ļ�---��ʼ
spool off	 	---����
edit xxxx.sql 	--�༭sql����

--�û������һЩ����:
	--dba���д����û���Ȩ��,������û��ɲ��������û�,������ɫ--dba
		--�����û�,���벻�������ֿ�ͷ,�մ���ʱû���κ�Ȩ��
			create user username identified by password;
		--���Ȩ��
			--Ȩ�޶�����:
			dba ����ԱȨ��,ӵ�����ݿ�����Ȩ��,ȫ��Ȩ��
			connect ���ݿ������Ȩ��
			resource ʵ��Ȩ��
			
			������ͨ�û���connect resource
			����Ա�û�
			
			grant Ȩ�޶��� [on tablename] to username [with grant option](username���Լ�����������Ȩ);
			
		--�޸�����
			(1)PASSWORD username; 
			(2)PASSWORD;
		--�޸�����(����Ա������)
			alter user username identified by password;
		--ɾ���û�
			drop user username [cascade]--(����ɾ��)	
	
linesize:
	show linesize;	 --�鿴��ǰ��ʾ�Ŀ��
	set linesize num;--���õ�ǰ��ʾ�Ŀ��
		
pagesize
	show linesize;	 --��ʾÿҳ��ʾ������
	set linesize;	 --����ÿҳ��ʾ������
		
--���ݿ����õ������Է���:
	--���ݶ�������(DDL):
		create	alter	drop
	--���ݲ�������(DML)
		insert	delete	update 	select
	--�����������(TCL)
		commit(����)	savepoint(�����)	rollback(�ع�)
	--���ݿ�������(DCL)
		grant(��Ȩ)		revoke(����Ȩ��)
		
		
--select
	(1)ѡ�����:�鿴�ֶ����ض���Ϣ
	(2)ͶӰ����:�鿴�ض��ֶ�
	(3)���Ӳ���:������
	--����
		select fieldname "alias" from tablename;
	
	--���������ֶ�
		select fieldname1||fieldname2 from tablename;
		select fieldname1||'���ӷ���'||fieldname2 from tablename;
	
	--�����ؼ���:
		--��nullΪָ��ֵ
		nvl(fieldname,ֵ) --eg:select nvl(fieldname,0) "age" from users;���ageΪnull��ageΪ0
		--ȥ�ظ�
		distinct --eg:select distinct fieldname1,fieldname2 from tablename;
		
	--�񶨱��ʽ
	!=    <>   ^=
	not between  and  --��������֮��
	is not null --��Ϊ��
	is null --�ǿ�ֵ
	
	--like
		%��ʾ0�����ַ� --eg:like 's\_%' ,\��ת���ַ�
		
	order by --���� Ĭ��������asc,������desc
			 --eg:select * from user order by username desc;
	
	--ע��: ��Ҫ�����ֶ��ﺬ�п�ֵʱ,����ʱ����ֵ��ĩβ,����ʱ����ֵ���ڿ�ͷ
		--(ԭ��:�����ݿ��д�ֵʱ,��ֵ��ʾ�����)
		--�ڳ�����,������ֿ�ֵ,���ײ���NullPointException
		
	--�ַ���:
		varchar2   	--�ɱ䳤�ȵ��ַ���	1-4000byte
		char		--�̶�����			1-2000byte
		long		--�ɱ䳤�ȵ��ַ���	��ɴ�2gb
		
	--��ֵ����:
		number		--�ȿ�������Ҳ������С��
	--��������
		date		--�洢���ں�ʱ�䣬��ȷ����
		timestamp	--�洢���ڣ���ʱ�䣬���Ծ�ȷ��С�������λ
	--�����ݶ�������
		blob		--�洢�����ƶ���һ��洢�ϴ�ģ�����:��Ƶ��ͼƬ
		bfile		--�Զ����Ƶ���ʽ�洢һЩ�ϴ���ļ�
		
	--���ݿ�����ĳ��ú���
		--(1)�ַ�������
			lower(fieldname) --ת����Сд
			upper(fieldname) --ת���ɴ�д
			initcap(fieldname) --������ĸת���ɴ�д
			concat(fieldname1,fieldname2) --���������ַ���
			substr(fieldname,startIndex,length) --��ȡ�ַ���,startIndexȡ����������ң�ȡ�����������
			
		--��oracle���ṩ��һ�����dual �������Ժ�����������
		
		--(2)��ֵ����
			round(num,bit) --��������,bit��ʾС�����λ,��Ϊ����,0Ϊ��λ
			trunc(num,bit) --��ȡ
			
		--(3)���ں���
			--ȫ���Ƹ�ʽ:��,��,��,ʱ����
			--ȱʡ��ʽ:		��-��-��,dd-mon-rr
			--���ص�ǰ���� sysdate
			--������������� sysdate+1
			--ʮ���Ӻ�����ڣ�����������
			
			months_between(to_date(strDate1,formate),to_date(strDate2,formate));--���·ݲ�
			next_day(to_date(strDate1,formate),"MONDAY"); --�¸����ڵ�����
			last_day(date);--����µ����һ��
			trunc(����,)
			
		--(4)ת������
			--��ʽת�������ַ���ȫ��0-9����ʱ�ᷢ����ʽת��
			to_number(str); --�ַ���ת������
			to_char(num,format); --��ת�����ַ���
			
		--(5)�麯��
			avg()
			max()
			min()
			sum()
			count()
			stddev() --��׼��
			
		--������
			(1)��˫����
			(2)ֱ�� �޷�����ո� eg:firstname lastname
			(3)as aliasname;
			
			
		having����group by֮�󣬶Է�������ݽ��й��ˣ�where����group by֮ǰ
		
		
	--����
		(1)--������
			--�������������ݱ���,�������ȫ������
		(2)--������:
			��������(left outer join):ȷ������:������left outer joinǰ����Ǹ���,Ҳ��������
			��������(right outer join):���ұߵ�Ϊ����
			ȫ����(full outer join):���������е�ƥ�����Ϣ�Ͳ�ƥ�����Ϣ����ʾ����
			
			�������������ӻ����������ӵõ��������������������Ӳ�ѯ����������������û��ƥ�������
			
			�����������ӻ���һ�ֱ�ʾ��ʽ��(+) (��)
				��where�����������(+)��(��):
					eg:select * from tablename1,tablename2 where tablename1.fieldname1 = tablename2.fieldname3(+)
					eg��ʾtablename1������,(+)�Ķ���������;
	
	--�Ӳ�ѯ
		���в�ѯ
		���в�ѯ
		
	SELECT *

	FROM (SELECT ROWNUM AS rowno, t.* FROM emp t WHERE hire_date BETWEEN TO_DATE ('20060501', 'yyyymmdd') AND TO_DATE ('20060731', 'yyyymmdd') AND ROWNUM <= 20)
		table_alias

	WHERE table_alias.rowno >= 10;
	
	
	select * from  
	(select rownum,tablename.* as rown from tablename where rown<20) alias
	where alias.rown>=10;
		
DML select:

		insert into tablename[(fieldnameList)] values(valueList);
		
		update s_dept set region_id=3 where Condition;
		
		delete from tablename where Condition;
		
�����ݿ��еı�Ĳ���
		create table tablename(fieldname varchar2 not null,...);  	--������
		alter table tablename add(fieldname type);					--�����
		alter table tablename drop(fieldname);						--ɾ����
		
		savepoint ss;
			...
		rollback to ss;
		
		ɾ��������ַ���
			delete ��ɾ����ʱ��,������unused,���ݻ��ڻ�������
			truncate table tablename [cascade contraints];ֱ��ɾ����������(�޷�rollback,Ĭ����commit;����)
			drop table tablename;(����ɾ��)
E-Rͼ
	ʵ����ϵͼ ʵ���ϵͼ
	
	����Щʵ��?
	ʵ�� --һ������ ѧ�� ���� Ա��				------����
	���� --ѧ��:ѧ��,����,����,רҵ				------��Բ
	��ϵ --ʵ��������֮�����ϵ	ʵ����ʵ��		------����
	
	����֮���� ������ ����
	
	����Щ��ϵ:
	һ��һ
	һ�Զ�
	��Զ�
		--����:һ��������ִ�е�Ԫ,������commit����rollback֮��Ĳ���(DML)��Ϊһ������
		--ǰһ������Ľ�������һ������Ŀ�ʼ:
			1,commit:���ݿ������ύ,���仯д�����ݿ�
			  rollback:���ݿ��������,���������ݵ��޸�(rollback;rollback to savepoint_name)
			2,DDL,DCL,һ������,������Զ��ύ
			3,
			
	����Լ�������ݱ�֤�����ظ�,���Ҳ���Ϊ��ֵ---Ψһ��
	�������Բ�ֻһ��
	alter table tablename add primary key(fieldlist...)
	alter table tablename drop primary key(fieldlist...)
	alter table tablename rename constraint old������ to new������(fieldlist...)
	
	uniqueΨһԼ��,����Ϊ��
	
	create table tablename(
		fieldname type .. foreign key(fieldname) references tablename1(fieldname1) no delete [cascade]||[set null]
	)
	
	no delete --�趨�����������������ɾ��ʱ,����������Ƿ�ɾ��,�����cascade,����ɾ��,��set nullɾ�������Ϊnull
	
	ע��:������ò�������
	
	ORA-02270:�����б��Ψһ��������ƥ��
	
	���Լ�� ���˿��Բ���Լ�������ڵ�����,�����Բ���null
	
	alter table tablename add constraint Լ���� check(fieldname ����� ֵ)
	
	--��������
	create [unique] index indexname on tablename(fieldlist);
	
	create [or replace] [force ���� noforce] view viewname [aliasname] as ��ѯ���
	
	or replace:�����ͼ�Ѿ�����,oracle�����´�������ͼ
	
plSQL ��һ�Ź��̻�����
	��------>����		����------>��(��ͷ,����)
	
���ݵĴ���
	������:
		if then else end if;
		loop    end loop;
	
	��̷�Ϊ��������:
		���岿��,ִ�в���,���ⲿ��
		
		declare --����
		
		create [or replace] procedure procInsert [name in[or out] varchar(20)] is --in/out ����/���
		begin
			insert ....
		end
		
		exec procInsert;--ִ��
		
		show error;--��ʾ����
		
		name varchar2(20):='maxu'; ----���峣��
		
		
	update tablename set fieldname=value;
	delete from tablename where fieldname=value;
	
