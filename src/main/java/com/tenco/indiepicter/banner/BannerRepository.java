package com.tenco.indiepicter.banner;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BannerRepository {
    public List<Banner> findByGenre(String genre);

    public List<Banner> findByAll();

}
