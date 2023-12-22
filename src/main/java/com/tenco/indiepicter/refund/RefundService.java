package com.tenco.indiepicter.refund;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class RefundService {

    @Autowired
    private RefundRepository refundRepository;
}
