package com.tenco.indiepicter.scrab;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter._core.utils.Define;
import com.tenco.indiepicter.scrab.response.ScrabResponseDTO;
import com.tenco.indiepicter.scrab.response.ToggleResponseDTO;
import com.tenco.indiepicter.user.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
public class ScrabRestController {

    @Autowired
    private ScrabService scrabService;
    @Autowired
    private HttpSession session;

    // 좋아요 목록 api
    @GetMapping("/api/scrabs/view")
    public ResponseEntity<?> scrabview() {
        User pricipal = (User) session.getAttribute(Define.PRINCIPAL);
        List<ScrabResponseDTO> scrabs = scrabService.scrabview(pricipal.getId());
        return ResponseEntity.ok().body(ApiUtils.success(scrabs));
    }

    // 좋아요 기능 api
    @PostMapping("/api/scrabs/toggle")
    public ResponseEntity<?> toggleScrab(@RequestBody Scrab scrab) {
        User pricipal = (User) session.getAttribute(Define.PRINCIPAL);
        boolean scrabs = scrabService.toggleScrab(pricipal.getId(), scrab.getFundingId());
        return ResponseEntity.ok().body(ApiUtils.success(new ToggleResponseDTO(scrabs)));

    }

    // 좋아요 목록 삭제
    @PostMapping("/api/scrabs/delete")
    public ResponseEntity<?> deleteListScrab(@RequestBody Scrab scrab) {
        User pricipal = (User) session.getAttribute(Define.PRINCIPAL);
        boolean scrabs = scrabService.deleteListScrab(pricipal.getId(), scrab.getFundingId());
        return ResponseEntity.ok().body(ApiUtils.success(new ToggleResponseDTO(scrabs)));
    }


}
