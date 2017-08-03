package com.choa.order_rent;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class Order_rentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE ="Order_rentMapper.";
	
	
	public int order_rentInsert(Order_rentDTO order_rentDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", order_rentDTO);
	}
	
	public Order_rentDTO order_rentList(Integer num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"list", num);
		
	}
	
	public int order_rentDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public List<Order_rentDTO> orderList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"check", listInfo);
	}
	
	public int order_rentCount(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
}
