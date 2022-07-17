package com.ljl.service.impl;

import com.ljl.mapper.BookMapper;
import com.ljl.pojo.Book;
import com.ljl.service.BookService;
import com.ljl.pojo.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public void deleteBookById(Integer bookID) {
        bookMapper.deleteBookById(bookID);
    }

    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    @Override
    public Book queryBookById(Integer bookID) {
        return bookMapper.queryBookById(bookID);
    }

    @Override
    public List<Book> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    @Override
    public List<Book> queryBookName(String queryBookName) {
        return bookMapper.queryBookName(queryBookName);
    }

    @Override
    public int toTalCounts() {
        return bookMapper.toTalCounts();
    }

    @Override
    public PageUtils<Book> findPageBook(Integer currentPage, Integer rowPage) {
        int toTalCounts = toTalCounts();
        PageUtils<Book> pageUtils = getPageUtils(currentPage, rowPage, toTalCounts);
        List<Book> bookList=bookMapper.findPageBook(pageUtils);
        pageUtils.setBookList(bookList);
        return pageUtils;
    }

    @Override
    public int toTalQueryCounts(String queryBookName) {
        return bookMapper.toTalQueryCounts(queryBookName);
    }

    @Override
    public PageUtils<Book> findPageBookByBookName(String queryBookName, Integer currentPage,Integer rowPage) {
        int toTalCounts=toTalQueryCounts(queryBookName);
        PageUtils<Book> pageUtils = getPageUtils(currentPage, rowPage, toTalCounts);
        pageUtils.setQueryBookName(queryBookName);
        List<Book> bookList=bookMapper.findPageBookByBookName(pageUtils);
        pageUtils.setBookList(bookList);
        return pageUtils;
    }

    public PageUtils<Book> getPageUtils(Integer currentPage, Integer rowPage,Integer toTalCounts){
        Integer toTalPage=toTalCounts%rowPage==0?toTalCounts/rowPage:toTalCounts/rowPage+1;
        PageUtils<Book> pageUtils=new PageUtils<>();
        pageUtils.setCurrentPage(currentPage);
        pageUtils.setRowPage(rowPage);
        Integer rowsCurrent=(currentPage-1)*rowPage;
        pageUtils.setRowsCurrent(rowsCurrent);
        pageUtils.setToTalCounts(toTalCounts);
        pageUtils.setToTalPage(toTalPage);
        return pageUtils;
    }
}
