package service;

import java.util.List;



import query.TSiItemQuery;
import entity.Page;
import entity.TSiItem;

public interface TSiItemService {
	public TSiItem getTSiItemById(Integer siiid);
	public List<TSiItem> getTSiItemList(TSiItemQuery tsiItemQuery);
	
	public Page getPage(TSiItemQuery tsiItemQuery);
	public void updateSiirmoney(TSiItemQuery tsiItemQuery);
	public void updateSiifinishtime(TSiItemQuery tsiItemQuery);
	public void updateTSiItem();
	public void updateSiistate(TSiItemQuery tsiItemQuery);
	public List<TSiItem> getTSiItem();
	public void updateSirstate(TSiItemQuery tsiItemQuery);
	
}
