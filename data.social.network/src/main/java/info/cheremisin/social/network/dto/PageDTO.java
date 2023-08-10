package info.cheremisin.social.network.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO<T> {
    public List<T> content;
    public Boolean hasNext;
    public Boolean hasPrevious;
    public Integer totalPages;
    public Integer currentPage;
}
