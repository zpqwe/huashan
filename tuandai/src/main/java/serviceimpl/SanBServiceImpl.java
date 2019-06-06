package serviceimpl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;

import service.SanBService;
import util.RedisConstant;
import util.RedisTemplateUtil;
import util.SerializeUtil;
import dao.SanBMapper;
import entity.TSiItem;
import entity.TTitem;
import entity.TUserData;
@Service("sanBService")
public class SanBServiceImpl implements SanBService{
	
	@Resource
	@Qualifier("sanBMapper")
	private SanBMapper sanb;
	@Resource
	@Qualifier("redisTemplateUtil")//加载缓存
	private RedisTemplateUtil redisTemplateUtil;
	
	//查询散标
	@Override
	public List<TSiItem> TIlist() {
		List<TSiItem> list=null;
		JSONArray json;
		String key = RedisConstant.SANB + "1";
		Object value = redisTemplateUtil.get(key);
		redisTemplateUtil.set(key, value);
		if(value==null){
			list=sanb.TIlist();
			//redisTemplateUtil.set(key, SerializeUtil.serialize(list));
			json=JSONArray.fromObject(list);
			redisTemplateUtil.set(key, json.toString());
		}else{
			System.out.println("***从缓存中查询house对象****");
			//取出缓存中的对象序列化后的字节数组
			//byte[] houseBytes = (byte[]) redisTemplateUtil.get(key);
			json = JSONArray.fromObject(value);//userStr是json字符串
			list = (List<TSiItem>) json.toList(json,TSiItem.class);
			System.out.println(list);
			redisTemplateUtil.expire(key, 1);//设置redis失效时间
			//进行反序列化
			//list =  SerializeUtil.unserializeForList(houseBytes);
		}
		return list;
	}
	//查询债权转让列表
	@Override
	public List<TTitem> ttlist() {
		List<TTitem> list=null;
		/*
		JSONArray json;
		String key = RedisConstant.ZHAIQ + "1";
		Object value = redisTemplateUtil.get(key);
		redisTemplateUtil.set(key, value);
		if(value==null){*/
			list=sanb.ttlist();
			//redisTemplateUtil.set(key, SerializeUtil.serialize(list));
			/*json=JSONArray.fromObject(list);
			redisTemplateUtil.set(key, json.toString());
		}else{
			System.out.println("***从缓存中查询house对象****");
			//取出缓存中的对象序列化后的字节数组
			//byte[] houseBytes = (byte[]) redisTemplateUtil.get(key);
			json = JSONArray.fromObject(value);//userStr是json字符串
			list = json.toList(json,TTitem.class);
			System.out.println(list);
			//进行反序列化
			//list =  SerializeUtil.unserializeForList(houseBytes);
		}*/ 
		return list;
	}
	//查询微团贷列表
	@Override
	public List<TSiItem> TIlistwtd() {
		List<TSiItem> list=null;
		JSONArray json;
		String key = RedisConstant.WRITD + "1";
		Object value = redisTemplateUtil.get(key);
		redisTemplateUtil.set(key, value);
		if(value==null){
			list=sanb.TIlistwtd();
			//redisTemplateUtil.set(key, SerializeUtil.serialize(list));
			json=JSONArray.fromObject(list);
			redisTemplateUtil.set(key, json.toString());
		}else{
			System.out.println("***从缓存中查询house对象****");
			//取出缓存中的对象序列化后的字节数组
			//byte[] houseBytes = (byte[]) redisTemplateUtil.get(key);
			json = JSONArray.fromObject(value);//userStr是json字符串
			list = (List<TSiItem>) json.toList(json,TSiItem.class);
			System.out.println(list);
			redisTemplateUtil.expire(key, 1);
			//进行反序列化
			//list =  SerializeUtil.unserializeForList(houseBytes);
		}
		return list;
	}
	//查询分期宝列表
	@Override
	public List<TSiItem> TIlistfqb() {
		List<TSiItem> list=null;
		JSONArray json;
		String key = RedisConstant.FENQIB + "1";
		Object value = redisTemplateUtil.get(key);
		redisTemplateUtil.set(key, value);
		if(value==null){
			list=sanb.TIlistfqb();
			//redisTemplateUtil.set(key, SerializeUtil.serialize(list));
			json=JSONArray.fromObject(list);
			redisTemplateUtil.set(key, json.toString());
		}else{
			System.out.println("***从缓存中查询house对象****");
			//取出缓存中的对象序列化后的字节数组
			//byte[] houseBytes = (byte[]) redisTemplateUtil.get(key);
			json = JSONArray.fromObject(value);//userStr是json字符串
			list = (List<TSiItem>) json.toList(json,TSiItem.class);
			System.out.println(list);
			redisTemplateUtil.expire(key, 1);
			//进行反序列化
			//list =  SerializeUtil.unserializeForList(houseBytes);
		}
		return list;
	}
	//查询供应链列表
	@Override
	public List<TSiItem> TIlistgyl() {
		List<TSiItem> list=null;
		JSONArray json;
		String key = RedisConstant.GONGYL + "1";
		Object value = redisTemplateUtil.get(key);
		redisTemplateUtil.set(key, value);
		if(value==null){
			list=sanb.TIlistgyl();
			//redisTemplateUtil.set(key, SerializeUtil.serialize(list));
			json=JSONArray.fromObject(list);
			redisTemplateUtil.set(key, json.toString());
		}else{
			System.out.println("***从缓存中查询house对象****");
			//取出缓存中的对象序列化后的字节数组
			//byte[] houseBytes = (byte[]) redisTemplateUtil.get(key);
			json = JSONArray.fromObject(value);//userStr是json字符串
			list = (List<TSiItem>) json.toList(json,TSiItem.class);
			System.out.println(list);
			redisTemplateUtil.expire(key, 1);
			//进行反序列化
			//list =  SerializeUtil.unserializeForList(houseBytes);
		}
		return list;
	}
	
	//查询注册人数
	@Override
	public long userCount() {
		Long count=null;
		String key = RedisConstant.ZHUCE + "1";
		Object value = redisTemplateUtil.get(key);
		redisTemplateUtil.set(key, value);
		if(value==null){
			count=sanb.userCount();
			redisTemplateUtil.set(key, SerializeUtil.serialize(count));
		}else{
			System.out.println("***从缓存中查询house对象****");
			//取出缓存中的对象序列化后的字节数组
			byte[] houseBytes = (byte[]) redisTemplateUtil.get(key);
			//进行反序列化
			count = (Long) SerializeUtil.unserialize(houseBytes);
			redisTemplateUtil.expire(key, 1);
		}
		return count;
	}
	//查询散标数量
	@Override
	public Integer countSanb() {
		return sanb.countSanb();
	}
	//查询散标数量
	@Override
	public Integer countZh() {
		return sanb.countZh();
	}
	//查询其他数量
	@Override
	public Integer countType(String siitype) {
		return sanb.countType(siitype);
	}

	
}
