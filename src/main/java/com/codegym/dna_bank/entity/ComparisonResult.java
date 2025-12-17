package com.codegym.dna_bank.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "comparison_results")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ComparisonResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "comparison_id")
    private Integer comparisonId;

    @ManyToOne
    @JoinColumn(name = "sample_1", nullable = false)
    private DNASample sample1;

    @ManyToOne
    @JoinColumn(name = "sample_2", nullable = false)
    private DNASample sample2;

    @Column(name = "matched_locus", nullable = false)
    private Integer matchedLocus;

    @Column(name = "similarity_percent", nullable = false)
    private Float similarityPercent;

    @Column(name = "paternity_index", nullable = false, precision = 10, scale = 4)
    private BigDecimal paternityIndex;

    @Column(name = "relationship", length = 50)
    private String relationship;

    @Column(name = "compared_at", updatable = false)
    private LocalDateTime comparedAt;

    @OneToMany(mappedBy = "comparisonResult", cascade = CascadeType.ALL)
    private List<ComparisonLocusResult> locusResults;

    @PrePersist
    protected void onCreate() {
        comparedAt = LocalDateTime.now();
    }
}