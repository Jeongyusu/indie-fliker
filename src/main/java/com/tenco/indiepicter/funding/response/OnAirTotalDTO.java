package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter.theater.response.TheaterListDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class OnAirTotalDTO {
    List<OnAirMovieDTO> onAirMovieDTOs;
    List<OnAirMovieRankingDTO> onAirMovieRankingDTOs;
    List<TheaterListDTO> theaterListDTOs;
}
