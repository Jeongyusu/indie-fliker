package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
import com.tenco.indiepicter.scrab.response.ToggleResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
public class ScrabRestController {

    @Autowired
    private ScrabService scrabService;

    @GetMapping("/api/scrabs/view")
    public ResponseEntity<?> scrabview(@RequestParam Integer fundingId) {
        List<ScrabResponseDTO> scrabs = scrabService.scrabview(fundingId);
        return ResponseEntity.ok().body(ApiUtils.success(scrabs));
    }

    @PostMapping("/api/scrabs/toggle")
    public ResponseEntity<?> toggleScrab(@RequestBody Scrab scrab) {
        boolean scrabs = scrabService.toggleScrab(scrab.getUserId(), scrab.getFundingId());
        ToggleResponseDTO toggleResponseDTO = new ToggleResponseDTO(true);
        return ResponseEntity.ok().body(ApiUtils.success(new ToggleResponseDTO(scrabs)));

    }
}
