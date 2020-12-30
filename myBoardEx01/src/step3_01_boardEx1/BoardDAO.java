package step3_01_boardEx1;

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
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("UPDATE BOARD SET READ_COUNT=READ_COUNT+1 WHERE NUM=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "SELECT * FROM BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setPassword(rs.getString(5));
				dto.setReg_date(rs.getDate(6).toString());
				dto.setRead_count(rs.getInt(7));
				dto.setContent(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		return dto;		
	}
	public BoardDTO getOneUpdateBoard(int num) {
		BoardDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setPassword(rs.getString(5));
				dto.setReg_date(rs.getDate(6).toString());
				dto.setRead_count(rs.getInt(7));
				dto.setContent(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		return dto;
	}
	
	public boolean validMemberCheck(BoardDTO dto) {
		boolean isValidMember = false;
		
		try {
			System.out.println(dto);
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM=? AND PASSWORD=?");
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isValidMember = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		return isValidMember;
	}
	
	public boolean updateBoard(BoardDTO dto) {
		boolean isUpdate = false;
		
		try {
			if(validMemberCheck(dto)) {
				conn = getConnection();
				pstmt = conn.prepareStatement("UPDATE BOARD SET SUBJECT=?, CONTENT=? WHERE NUM=?");
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, dto.getNum());
				pstmt.executeUpdate();
				
				System.out.println("테이블이 업데이트 되었습니다. ");
				System.out.println(dto);
				
				isUpdate = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		return isUpdate;		
	}
	
	public boolean deleteBoard(BoardDTO dto) {
		boolean isDelete = false;
		
		try {
			if(validMemberCheck(dto)) {
				conn = getConnection();
				pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE NUM=?");
				pstmt.setInt(1, dto.getNum());
				pstmt.executeUpdate();
				
				System.out.println("레코드 삭제되었습니다. ");
				
				isDelete = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		return isDelete;	
	}
	
	public void insertBoard(BoardDTO dto) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO BOARD (WRITER,EMAIL,SUBJECT,PASSWORD,REG_DATE,READ_COUNT,CONTENT) "
					+ "VALUES(?,?,?,?,NOW(),0,?)");
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getPassword());
			pstmt.setString(5, dto.getContent());
			pstmt.executeUpdate();
			System.out.println("테이블에 추가됨");
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}		
	}

}
