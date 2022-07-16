import com.ljl.pojo.Book;
import com.ljl.pojo.PageUtils;
import com.ljl.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class SpringTest {
    @Autowired
    BookService bookService;

    @Test
    public void Test(){
        for (int i = 0; i < 100; i++) {
            Book book=new Book();
            book.setBookName(""+0);
            bookService.addBook(book);
        }
    }


}
