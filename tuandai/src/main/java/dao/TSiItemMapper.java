package dao;

import java.util.List;


import query.TSiItemQuery;

import entity.TBorrowerInfo;
import entity.TSiItem;

public interface TSiItemMapper {
	public TSiItem getTSiItemById(Integer siiid);
	public List<TSiItem> getTSiItemList(TSiItemQuery tsiItemQuery);
	public Integer getCounts(TSiItemQuery tsiItemQuery);
	public void updateSiirmoney(TSiItemQuery tsiItemQuery);
	public void updateSiifinishtime(TSiItemQuery tsiItemQuery);
	public void updateSiistate(TSiItemQuery tsiItemQuery);
	public List<TSiItem> getTSiItem();
	public void updateSirstate(TSiItemQuery tsiItemQuery);
}
