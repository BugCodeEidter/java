package com.ljl.service;

import com.ljl.pojo.Book;
import com.ljl.pojo.PageUtils;

import java.util.List;

public interface BookService {
    //更新一本书
    void updateBook(Book book);
    //删除一本书
    void deleteBookById(Integer bookID);
    //增加一本书
    void addBook(Book book);
    //查询一本书
    Book queryBookById(Integer bookID);
    //查询全部的书
    List<Book> queryAllBook();

    List<Book> queryBookName(String queryBookName);

    int toTalCounts();

    PageUtils findPageBook(Integer currentPage, Integer rowPage);

    int toTalQueryCounts(String queryBookName);

    PageUtils findPageBookByBookName(String queryBookName, Integer currentPage,Integer rowPage);
}
