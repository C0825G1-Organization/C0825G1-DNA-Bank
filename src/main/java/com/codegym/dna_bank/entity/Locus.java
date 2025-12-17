package com.codegym.dna_bank.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "locus")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Locus {

    @Id
    @Column(name = "locus_id")
    private Integer locusId;

    @Column(name = "locus_name", unique = true, nullable = false, length = 50)
    private String locusName;
}