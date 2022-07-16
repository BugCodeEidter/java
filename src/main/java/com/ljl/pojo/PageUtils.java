package com.ljl.pojo;


import com.ljl.pojo.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageUtils {
    private Integer rowPage;
    private Integer currentPage;
    private Integer toTalPage;
    private Integer toTalCounts;
    private Integer rowsCurrent;
    private String queryBookName;
    private List<Book> bookList;
    private Integer start;
    private Integer end;
}
