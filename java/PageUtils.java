/*
 * Copyright (c) 2012 DongXiangli.All rights reserved.
 */
 
package com.codeworker.utils.dao;
 
import java.io.Serializable;
import java.util.List;
 
/**
 * User: DongXiangli
 * Date: 12-12-23
 * Time: ����10:48
 */
public class PageUtils<T> implements Serializable {
    public static final String ASC = "asc";
    public static final String DESC = "desc";
 
    protected int pageNo = 1;                //��ǰҳ��
    protected int pageSize = -1;             //ҳ�ڼ�¼��
    protected String orderBy = null;         //�����ֶΣ�����û��ʹ��
    protected String order = ASC;            //������
    protected boolean autoCount = false;     //�Զ������¼��
 
    private List<T> data = null;             //����
    private long totalCount = -1;            //�ܼ�¼��
 
    public PageUtils() {
        this(1, 20);
    }
 
    public PageUtils(int pageIndex) {
        this(pageIndex, 20);
    }
 
    public PageUtils(int pageIndex, int pageSize) {
        if (pageIndex < 1) pageIndex = 1;
        if (pageSize < 1) pageSize = 15;
        this.pageNo = pageIndex;
        this.pageSize = pageSize;
    }
 
    public PageUtils(int pageSize, boolean autoCount) {
        if (pageSize <= 0) {
            pageSize = 20;
        }
        this.pageSize = pageSize;
        this.autoCount = autoCount;
    }
 
    /**
     * ���ÿҳ�ļ�¼����,��Ĭ��ֵ.
     */
    public int getPageSize() {
        return pageSize;
    }
 
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
 
    /**
     * �Ƿ�������ÿҳ�ļ�¼����.
     */
    public boolean isPageSizeSetted() {
        return pageSize > -1;
    }
 
    /**
     * ��õ�ǰҳ��ҳ��,��Ŵ�1��ʼ,Ĭ��Ϊ1.
     */
    public int getPageNo() {
        return pageNo;
    }
 
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
 
    /**
     * ����pageNo��pageSize���㵱ǰҳ��һ����¼���ܽ�����е�λ��,��Ŵ�0��ʼ.
     */
    public int getFirst() {
        if (pageNo < 1 || pageSize < 1)
            return -1;
        else
            return ((pageNo - 1) * pageSize);
    }
 
    /**
     * �Ƿ������õ�һ����¼��¼���ܽ�����е�λ��.
     */
    public boolean isFirstSetted() {
        return (pageNo > 0 && pageSize > 0);
    }
 
    /**
     * ��������ֶ�,��Ĭ��ֵ.
     */
    public String getOrderBy() {
        return orderBy;
    }
 
    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
 
    /**
     * �Ƿ������������ֶ�.
     */
    public boolean isOrderBySetted() {
        if (orderBy != null) {
            orderBy = orderBy.trim();
            return !orderBy.isEmpty();
        }
        return false;
    }
 
    /**
     * ���������,Ĭ��Ϊasc.
     */
    public String getOrder() {
        return order;
    }
 
    /**
     * ��������ʽ��.
     *
     * @param order ��ѡֵΪdesc��asc.
     */
    public void setOrder(String order) {
        if (ASC.equalsIgnoreCase(order) || DESC.equalsIgnoreCase(order)) {
            this.order = order.toLowerCase();
        } else
            throw new IllegalArgumentException("order should be 'desc' or 'asc'");
    }
 
    /**
     * �Ƿ��Զ���ȡ��ҳ��,Ĭ��Ϊfalse.
     * ע�Ȿ���Խ���query by Criteriaʱ��Ч,query by HQLʱ��������Ч.
     */
    public boolean isAutoCount() {
        return autoCount;
    }
 
    public void setAutoCount(boolean autoCount) {
        this.autoCount = autoCount;
    }
 
    /**
     * ȡ�õ�ת��������
     */
    public String getInverseOrder() {
        if (order.endsWith(DESC))
            return ASC;
        else
            return DESC;
    }
 
    /**
     * ҳ�ڵ������б�.
     */
    public List<T> getData() {
        return this.data;
    }
 
    public void setData(List<T> data) {
        this.data = data;
    }
 
    /**
     * �ܼ�¼��.
     */
    public long getTotalCount() {
        return totalCount;
    }
 
    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }
 
    /**
     * ������ҳ��.
     */
    public long getTotalPages() {
        if (totalCount == -1)
            return 1;
 
        long count = totalCount / pageSize;
        if (totalCount % pageSize > 0) {
            count++;
        }
        return count;
    }
 
    /**
     * �Ƿ�����һҳ.
     */
    public boolean isHasNext() {
        return (pageNo + 1 <= getTotalPages());
    }
 
    /**
     * ������ҳ��ҳ��,��Ŵ�1��ʼ.
     */
    public int getNextPage() {
        if (isHasNext())
            return pageNo + 1;
        else
            return pageNo;
    }
 
    /**
     * �Ƿ�����һҳ.
     */
    public boolean isHasPre() {
        return (pageNo - 1 >= 1);
    }
 
    /**
     * ������ҳ��ҳ��,��Ŵ�1��ʼ.
     */
    public int getPrePage() {
        if (isHasPre())
            return pageNo - 1;
        else
            return pageNo;
    }
 
}