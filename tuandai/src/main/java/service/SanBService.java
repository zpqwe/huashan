package service;

import java.util.List;

import entity.TSiItem;
import entity.TTitem;

public interface SanBService {
	//查询散标标数量
	public Integer countSanb();
	//查询转让标数量
	public Integer countZh();
	//查询其他类型
	public Integer countType(String siitype);
	
	//查询注册人数
	public long userCount();
	
	//查询散标列表
	public List<TSiItem> TIlist();
	//查询债权转让列表
	public List<TTitem> ttlist();
	//查询微团贷
	public List<TSiItem> TIlistwtd();
	//查询分期宝
	public List<TSiItem> TIlistfqb();
	//查询供应链
	public List<TSiItem> TIlistgyl();
}
