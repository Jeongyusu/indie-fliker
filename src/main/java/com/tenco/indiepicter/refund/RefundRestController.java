package com.tenco.indiepicter.refund;

import com.tenco.indiepicter._core.utils.ApiUtils;
import com.tenco.indiepicter.refund.request.SaveRefundDTO;
import com.tenco.indiepicter.refund.response.FindRefundDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/refund")
public class RefundRestController {

    @Autowired
    private RefundService refundService;


    // 환불 등록 요청(POST)
    @PostMapping("/{paymentId}/save")
    public ResponseEntity<?> saveRefund(@PathVariable("paymentId") Integer paymentId, @RequestBody SaveRefundDTO saveRefundDTO) {
        int rowResultCount = refundService.saveRefund(saveRefundDTO);
        return ResponseEntity.ok().body(ApiUtils.success(rowResultCount));
    }

    // 환불 정보 요청(GET)
    @GetMapping("/{paymentId}/find")
    public ResponseEntity<?> findRefund(@PathVariable("paymentId") Integer paymentId) {
        FindRefundDTO findRefundDTO = refundService.findRefund(paymentId);
        return ResponseEntity.ok().body(ApiUtils.success(findRefundDTO));
    }
}
