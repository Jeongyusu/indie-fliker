package com.tenco.indiepicter.scrab.response;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.yaml.snakeyaml.introspector.Property;

@Data
@AllArgsConstructor
public class ToggleRequestDTO {
        private Integer userId;
        private Integer fundingId;
}
