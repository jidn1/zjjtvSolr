package com.htstd.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.lucene.util.BytesRef;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Before;
import org.junit.Test;
import com.htstd.VO.equipmentVO;
import com.htstd.domain.equipmentPojo;

/**
 * 
 * @描述 solr查询
 * @author 吉德宁
 * @日期 2017年7月12日
 *
 */
public class SolrUtil {

	private static final String URL = "http://127.0.0.1:8090/solr/db";

	private HttpSolrClient server = null;

	/**
	 * 添加/更新数据
	 * 
	 * @param items
	 */
	public void addSolrDocument(List<equipmentVO> items) {
		if (server == null) {
			server = new HttpSolrClient(URL);//获取到本地solrURL
		}
		SolrInputDocument[] doc = new SolrInputDocument[items.size()];//创建一个Document  solr保存数据的文档
		try {
			for (int i = 0; i < items.size(); i++) {
				doc[i] = new SolrInputDocument();
				equipmentVO item = items.get(i);//转为为VO
				java.lang.reflect.Field[] fields = item.getClass().getDeclaredFields();//获取VO类中的字段
				for (java.lang.reflect.Field field : fields) {
					String fieldName = field.getName();
					String getMethodName = "get" + toFirstLetterUpperCase(fieldName);//字段首字母转换为大写 并且加上get
					Object obj = item.getClass().getMethod(getMethodName).invoke(item);//把字段和值放入到一起
					doc[i].addField(fieldName, obj );//存放到document集合中
				}
				server.add(doc[i]);//通过server保存到solr缓存中
				// 提交
				server.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 查询
	 * @param keyword
	 * @param pageNow
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> querySolrByKeyWord(String keyword, int pageNow, int pageSize,String starTime,String endTime) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
		Map<String, Object> maps = new HashMap<String, Object>();
		Map<String, String> typeMap = new HashMap<String, String>();
		if (server == null) {
			server = new HttpSolrClient(URL);
		}
		List<equipmentVO> result = new ArrayList<equipmentVO>();
		// 默认搜索的域
		SolrQuery query = new SolrQuery();
		// query.set("df", "keywords");//设置查询范围
		//query.setSort("",ORDER.asc);//设置排序
		if(endTime == null ){
			endTime = sdf.format(new Date());
		}else{
			endTime = endTime+"T00:00:00Z";
		}
		//校检日期
		if(starTime != null && !"".equals(starTime)){
			query.setQuery("*:*");
			starTime = starTime+"T00:00:00Z";
			//verificationDate:[2017-07-01T00:00:00Z TO 2017-07-10T00:00:00Z]
			query.addFilterQuery(new String[]{"validDate:["+starTime+" TO "+endTime+"]"});	
		}
		if(keyword!=null && !"".equals(keyword)){
			query.setQuery(keyword);//设置查询条件
		}
		query.setStart(pageNow);//设置起始行数
		query.setRows(pageSize);//设置查询行数
		
		
		
		try {
			java.lang.reflect.Field[] fields = equipmentVO.class.getDeclaredFields();//获取VO类字段
			int length = fields.length;
			String[] multiFields = new String[length];
			for (int i = 0; i < length; i++) {
				multiFields[i] = fields[i].getName();//把得到的VO类字段放到数组中
				typeMap.put(fields[i].getName(), fields[i].getGenericType().toString());
			}
			
			QueryResponse response = null;
			response = server.query(query);//把query放入 server进行查询
			SolrDocumentList list = response.getResults();//获取查询结果
			int num = (int) list.getNumFound();//获取查询总行数
			for (SolrDocument doc : list) {//遍历
				equipmentVO item = new equipmentVO();
				for (String field : multiFields) {//根据VO字段把值放入到VO类中
					String setMethodName = "set" + toFirstLetterUpperCase(field);//首字母转换为大写  并set值
					if(typeMap.get(field).equals("class java.lang.Double")){
						Double valueOf = Double.valueOf(doc.get(field).toString());
						item.getClass().getMethod(setMethodName, Double.class).invoke(item, valueOf);//set到字段中 并转换为VO类
					}
					if(typeMap.get(field).equals("class java.util.Date")){
						item.getClass().getMethod(setMethodName, Date.class).invoke(item, doc.get(field));//set到字段中 并转换为VO类
					}
					if(typeMap.get(field).equals("class java.lang.String")){
						item.getClass().getMethod(setMethodName, String.class).invoke(item, doc.get(field));//set到字段中 并转换为VO类
					}
				}
				result.add(item);//集合添加
			}
			maps.put("result", result);
			maps.put("num", num);
		} catch (SolrServerException e) {
			System.err.print(e);
		}
		return maps;
	}

	/**
	 * 删除solr索引
	 * 
	 * @param items
	 * @throws Exception
	 * @throws SolrServerException
	 */
	public void deleteSolrDocument(String[] ids) throws SolrServerException, Exception {
		if (server == null) {
			server = new HttpSolrClient(URL);
		}
		for (String id : ids) {
			// 通过id删除
			server.deleteById(id);
			// 提交
			server.commit();
		}
	}

	/**
	 * 首字母转大写
	 * 
	 * @param str
	 * @return
	 */
	public static String toFirstLetterUpperCase(String str) {
		if (str == null || str.length() < 2) {
			return str;
		}
		return str.substring(0, 1).toUpperCase() + str.substring(1, str.length());
	}

}
