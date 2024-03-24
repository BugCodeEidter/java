package com.ljl.controller;



import com.ljl.pojo.Book;
import com.ljl.service.BookService;
import com.ljl.pojo.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


//你写的代码真的垃圾，垃圾中的垃圾，回去再修炼几年吧
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/pageBook")
    public String list(Integer currentPage,Model model){
        if(currentPage==null){
            currentPage=1;
        }
        Integer rowPage=10;
        PageUtils<Book> bookPage=bookService.findPageBook(currentPage,rowPage);
        PageUtils<Book> page = getPage(bookPage);
        model.addAttribute("bookPage",page);
        return "allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddPaper(){
        return "addBook";
    }

    @RequestMapping("/addBook")
    public String addBook(Book book){
        System.out.println(book);
        bookService.addBook(book);
        return "redirect:/book/pageBook";
    }

    @RequestMapping("/toUpdateBook")
    public String toUpdatePaper(Integer bookID,Model model){
        Book book = bookService.queryBookById(bookID);
        model.addAttribute("book",book);
        return "updateBook";
    }

    @RequestMapping("updateBook")
    public String updateBook(Book book){
        System.out.println(book);
        bookService.updateBook(book);
        return "redirect:/book/pageBook";
    }

    @RequestMapping("/deleteBook/{bookID}")
    public String deleteBook(@PathVariable("bookID") Integer bookID){
        bookService.deleteBookById(bookID);
        return "redirect:/book/pageBook";
    }

    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName,Integer currentPage,Model model){
        if(currentPage==null){
            currentPage=1;
        }
        System.out.println(queryBookName+","+currentPage);
        Integer rowpage=10;
        PageUtils<Book> bookPage=bookService.findPageBookByBookName(queryBookName,currentPage,rowpage);
        PageUtils<Book> page = getPage(bookPage);
        if(page.getBookList().isEmpty()){
            model.addAttribute("errorMessage",false);
        }else{
            model.addAttribute("errorMessage",true);
        }
        System.out.println(page);
        model.addAttribute("bookQueryPage",page);
        return "queryBook";
    }

    public PageUtils<Book> getPage(PageUtils<Book> bookPage){
        Integer start=null;
        Integer end=null;
        Integer totalPage=bookPage.getToTalPage();
        Integer currentPage = bookPage.getCurrentPage();
        if(totalPage<=5){
            start=1;
            end=totalPage;
        }else {
            if(currentPage<totalPage){
                if(currentPage<=5){
                    start=1;
                    end=5;
                }else {
                    start=1+(currentPage-5);
                    end=currentPage;
                }
            }else {
                start=totalPage-4;
                end=totalPage;
            }
        }
        bookPage.setStart(start);
        bookPage.setEnd(end);
        return bookPage;
    }
}
