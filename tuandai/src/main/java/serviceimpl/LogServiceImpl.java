package serviceimpl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import service.LogService;
import dao.LogMapper;
@Service("logService")
public class LogServiceImpl implements LogService {
	@Resource
	@Qualifier("logMapper")
	private LogMapper lm;
	@Override
	public int getuser() {
		return lm.getuser();
	}
	
}
