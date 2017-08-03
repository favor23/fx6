package com.choa.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class CartDAO {

	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="CartMapper.";
	
	
	public int cartWrite(CartDTO cartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"write", cartDTO);
	}
	
	public List<CartDTO> cartList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
		
	}
	
	public int cartCount(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	
	public int cartDelete(int cart_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", cart_num);
		
	}
}
