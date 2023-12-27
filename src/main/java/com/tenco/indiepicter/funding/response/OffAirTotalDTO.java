package com.tenco.indiepicter.funding.response;

import com.tenco.indiepicter.theater.response.TheaterListDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class OffAirTotalDTO {
    List<OffAirMovieDTO> offAirMovieDTOs;
    List<OffAirMovieRankingDTO> offAirMovieRankingDTOs;
    List<TheaterListDTO> theaterListDTOs;
}
