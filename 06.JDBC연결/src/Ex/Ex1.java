package Ex;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Ex1 {
    // jdbc 데이터베이스 users 테이블에 INSERT문으로 user 정보를 삽입하는 코드를 작성하세요.
    // 예시 : winter / 한겨울 / 12345 / 25 / winter@abc.com

    public static void main(String[] args) {

        String url = "jdbc:mysql://127.0.0.1:3306/jdbc";
        String user = "root";
        String password = "1234";

        String sql = """
                INSERT INTO users (userId, username,  password, age, email)
                VALUES (?, ?, ?, ?, ?)
                """;

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            // 컬럼 타입에 맞게 값을 지정
            // 예시 : winter / 한겨울 / 12345 / 25 / winter@abc.com
            pstmt.setString(1, "winter"); // Id
            pstmt.setString(2, "한겨울"); // 이름
            pstmt.setString(3, "12345"); // Pw
            pstmt.setInt(4, 25); // 나이
            pstmt.setString(5, "winter@abc.com"); // 이메일

            int rows = pstmt.executeUpdate();

            System.out.println("반영된 행의 수 : " + rows);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
