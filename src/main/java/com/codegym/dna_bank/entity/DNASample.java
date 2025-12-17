package com.codegym.dna_bank.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "dna_samples")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DNASample {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sample_id")
    private Integer sampleId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users user;

    @Column(name = "gender", length = 1)
    private String gender;

    @Column(name = "test_date")
    private LocalDate testDate;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "dnaSample", cascade = CascadeType.ALL)
    private List<DNALocusResult> locusResults;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}