package fu.edu.library.DAOs;

import fu.edu.library.BO.CategoryBO;
import fu.edu.library.BO.ReaderBO;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import fu.edu.library.Models.Book;
import fu.edu.library.Models.Category;
import java.util.List;

public class BookDAO {

    Connection conn = null;
    Statement st = null;
    PreparedStatement preSt = null;
    CategoryBO categoryBO = new CategoryBO();
    ReaderBO readerBO = new ReaderBO();

    public Book findBook(String id) throws SQLException, ClassNotFoundException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "Select * from Book where id=?";

        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setString(1, id);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            String category_id = rs.getString("category_id");
            Date date = rs.getDate("create_day");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String strDate = dateFormat.format(date);
            Category category = new Category();
            try {
                category = categoryBO.findCategory(category_id);
            } catch (ClassNotFoundException | SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            String amount = rs.getString("amount");
            String image = rs.getString("image");
            Book book = new Book();
            book.setId(id);
            book.setName(name);
            book.setCategory(category);
            book.setAmount(amount);
            book.setImage(image);
            book.setDay(strDate);
            return book;
        }
        return null;
    }

    public int insertBook(Book book) throws SQLException, ClassNotFoundException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        try {
            st = (Statement) conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int result = 0;
        String insert = "INSERT INTO Book (name, category_id, amount, image) VALUES (?,?, ?, ?)";
        preSt = (PreparedStatement) conn.prepareStatement(insert);
        preSt.setString(1, book.getName());
        preSt.setString(2, Integer.toString(book.getCategory().getId()));
        preSt.setString(3, book.getAmount());
        preSt.setString(4, book.getImage());
        result = preSt.executeUpdate();
        System.out.println("Ketqua" + result);
        return result;
    }

    public ArrayList<Book> getAllBook() throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        ArrayList<Book> list = new ArrayList<Book>();
        String sql = "Select * from Book ORDER BY create_day DESC";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String id = rs.getString("id");
            String name = rs.getString("name");
            String category_id = rs.getString("category_id");
            Date date = rs.getDate("create_day");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String strDate = dateFormat.format(date);
            Category category = new Category();
            try {
                category = categoryBO.findCategory(category_id);
            } catch (ClassNotFoundException | SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            String amount = rs.getString("amount");
            String image = rs.getString("image");
            Book book = new Book();
            book.setId(id);
            book.setName(name);
            book.setCategory(category);
            book.setAmount(amount);
            book.setImage(image);
            book.setDay(strDate);
            list.add(book);
        }
        return list;
    }

    public ArrayList<Book> getSearchBook(String name_search) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        System.out.println("Day" + name_search);
        ArrayList<Book> list = new ArrayList<Book>();
        String sql = "Select * from Book where name like '%" + name_search + "%';";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String id = rs.getString("id");
            String name = rs.getString("name");
            String category_id = rs.getString("category_id");
            Date date = rs.getDate("create_day");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String strDate = dateFormat.format(date);
            Category category = new Category();
            try {
                category = categoryBO.findCategory(category_id);
            } catch (ClassNotFoundException | SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            String amount = rs.getString("amount");
            String image = rs.getString("image");
            Book book = new Book();
            book.setId(id);
            book.setName(name);
            book.setCategory(category);
            book.setAmount(amount);
            book.setImage(image);
            book.setDay(strDate);
            list.add(book);
        }
        System.out.println(list);
        return list;
    }

    public int updateBook(Book book) throws SQLException, ClassNotFoundException {

        int result = 0;
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "Update Book set name =?,category_id =?,amount =?,image =?  where id=? ";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

        pstm.setString(1, book.getName());
        pstm.setString(2, Integer.toString(book.getCategory().getId()));
        pstm.setString(3, book.getAmount());
        pstm.setString(4, book.getImage());
        pstm.setString(5, book.getId());
        result = pstm.executeUpdate();
        return result;
    }

    public int deleteAllBook() throws ClassNotFoundException, SQLException {
        int result = 0;
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        readerBO.deleteAllReader();
        String sql = "Delete From Book";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        result = pstm.executeUpdate();
        return result;
    }

    public int deleteBook(String id) throws ClassNotFoundException, SQLException {
        int result = 0;
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }

        readerBO.deleteBookReader(id);
        String sql = "Delete From Book where id= ?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setString(1, id);
        result = pstm.executeUpdate();
        return result;
    }

    public int deleteBookCategory(String category_id) throws ClassNotFoundException, SQLException {
        int result = 0;
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        readerBO.deleteBookReaderCategory(category_id);
        String sql = "Delete From Book where category_id= ?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setString(1, category_id);
        result = pstm.executeUpdate();
        return result;
    }

    public int totalPage() throws ClassNotFoundException, SQLException {
        int result = 0;
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "SELECT COUNT(*) AS total FROM book";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            int totalBooks = rs.getInt("total");
            result = (int) Math.ceil(totalBooks / 4.0); // Using 4 as the number of books per page
        }
        return result;
    }

    public ArrayList<Book> getBooks(int index) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        ArrayList<Book> list = new ArrayList<>();
        int booksPerPage = 8; 
        String sql = "SELECT * FROM book ORDER BY id DESC LIMIT ? OFFSET ?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setInt(1, booksPerPage);
        pstm.setInt(2, (index - 1) * booksPerPage); 
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String name = rs.getString("name");
            String category_id = rs.getString("category_id");
            Date date = rs.getDate("create_day");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String strDate = dateFormat.format(date);
            Category category = categoryBO.findCategory(category_id);
            String amount = rs.getString("amount");
            String image = rs.getString("image");
            Book book = new Book();
            book.setId(id);
            book.setName(name);
            book.setCategory(category);
            book.setAmount(amount);
            book.setImage(image);
            book.setDay(strDate);
            list.add(book);
        }
        return list;
    }

}
