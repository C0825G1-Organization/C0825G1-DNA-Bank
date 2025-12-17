//DNALocusResult.java (bao gồm inner class DNALocusResultId)

package com.codegym.dna_bank.entity;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;

@Entity
@Table(name = "dna_locus_results")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@IdClass(DNALocusResult.DNALocusResultId.class)
public class DNALocusResult {

    @Id
    @ManyToOne
    @JoinColumn(name = "sample_id", nullable = false)
    private DNASample dnaSample;

    @Id
    @ManyToOne
    @JoinColumn(name = "locus_id", nullable = false)
    private Locus locus;

    @Column(name = "allele_1", nullable = false)
    private byte[] allele1;

    @Column(name = "allele_2", nullable = false)
    private byte[] allele2;

    // Composite Key class
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class DNALocusResultId implements Serializable {
        private Integer dnaSample;
        private Integer locus;
    }
}