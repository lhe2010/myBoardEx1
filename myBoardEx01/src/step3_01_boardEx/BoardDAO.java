package step3_01_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		String jdbc = "jdbc:mysql://localhost:3306/BOARD_EX1?serverTimezone=UTC";
		String dbId = "root";
		String dbPw = "1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbc, dbId, dbPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public Vector<BoardDTO> getAllBoard() {
		Vector<BoardDTO> vec = new Vector<BoardDTO>();
		BoardDTO dto = null;//*****
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new BoardDTO(); //*****
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setPassword(rs.getString(5));
				dto.setReg_date(rs.getDate(6).toString());
				dto.setRead_count(rs.getInt(7));
				dto.setContent(rs.getString(8));
				
				vec.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}		
		return vec;
	}
	
	public BoardDTO getOneBoard(int num) {
		BoardDTO dto = null;
		
		
	}

}
