package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter.scrab.response.ScrabDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScrabRestController {

    @Autowired
    private ScrabService scrabService;

    @PostMapping("/api/scrabs/toggle")
    public ResponseEntity<ScrabDTO.ToggleResponseDTO> toggleScrab(
            @RequestBody  ScrabDTO.ToggleRequestDTO toggleRequestDTO) {
        boolean scrab = scrabService.toggleScrab(toggleRequestDTO.getUserId(), toggleRequestDTO.getFundingId());
        return ResponseEntity.ok(new ScrabDTO.ToggleResponseDTO(scrab));
    }
}
