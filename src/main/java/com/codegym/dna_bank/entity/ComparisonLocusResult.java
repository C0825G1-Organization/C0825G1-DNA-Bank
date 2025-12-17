// ComparisonLocusResult.java (bao gồm inner class ComparisonLocusResultId)

package com.codegym.dna_bank.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.io.Serializable;

@Entity
@Table(name = "comparison_locus_results")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@IdClass(ComparisonLocusResult.ComparisonLocusResultId.class)
public class ComparisonLocusResult {

    @Id
    @ManyToOne
    @JoinColumn(name = "comparison_id", nullable = false)
    private ComparisonResult comparisonResult;

    @Id
    @ManyToOne
    @JoinColumn(name = "locus_id", nullable = false)
    private Locus locus;

    @Column(name = "pi_value", nullable = false, precision = 10, scale = 4)
    private BigDecimal piValue;

    // Composite Key class
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ComparisonLocusResultId implements Serializable {
        private Integer comparisonResult;
        private Integer locus;
    }
}