package com.ljl.mapper;

import com.ljl.pojo.Book;
import com.ljl.pojo.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    //更新一本书
    void updateBook(Book book);
    //删除一本书
    void deleteBookById(@Param("bookID") Integer bookID);
    //增加一本书
    void addBook(Book book);
    //查询一本书
    Book queryBookById(@Param("bookID") Integer bookID);
    //查询全部的书
    List<Book> queryAllBook();

    List<Book> queryBookName(@Param("bookName") String queryBookName);

    int toTalCounts();

    List<Book> findPageBook(PageUtils pageUtils);

    int toTalQueryCounts(@Param("bookName") String queryBookName);

    List<Book> findPageBookByBookName(PageUtils pageUtils);
}
