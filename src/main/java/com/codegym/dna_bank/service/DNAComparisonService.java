package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.ComparisonLocusResult;
import com.codegym.dna_bank.entity.ComparisonResult;
import com.codegym.dna_bank.entity.DNALocusResult;
import com.codegym.dna_bank.repository.AlleleFrequencyRepository;
import com.codegym.dna_bank.repository.DNALocusResultRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

/**
 * Service so sánh DNA và tính toán PI/CPI
 * Thuật toán dựa trên Paternity Testing Formula
 */
public class DNAComparisonService {

    private final DNALocusResultRepository dnaLocusRepo = new DNALocusResultRepository();
    private final AlleleFrequencyRepository alleleFreqRepo = new AlleleFrequencyRepository();

    /**
     * So sánh 2 mẫu DNA và tính CPI
     * @param sample1Id ID mẫu DNA 1 (giả định là "cha")
     * @param sample2Id ID mẫu DNA 2 (giả định là "con")
     * @return ComparisonResult chứa CPI, probability, relationship
     */
    public ComparisonResult compareDNA(int sample1Id, int sample2Id) {
        // Lấy dữ liệu DNA của 2 mẫu
        List<DNALocusResult> sample1Loci = dnaLocusRepo.findBySampleId(sample1Id);
        List<DNALocusResult> sample2Loci = dnaLocusRepo.findBySampleId(sample2Id);

        if (sample1Loci.isEmpty() || sample2Loci.isEmpty()) {
            throw new RuntimeException("Không tìm thấy dữ liệu DNA của 1 trong 2 mẫu");
        }

        // Tính PI cho từng locus
        List<ComparisonLocusResult> locusResults = new ArrayList<>();
        BigDecimal cpi = BigDecimal.ONE; // CPI = tích của tất cả PI
        int matchedLoci = 0;

        for (DNALocusResult locus1 : sample1Loci) {
            // Tìm locus tương ứng ở mẫu 2
            DNALocusResult locus2 = findLocusById(sample2Loci, locus1.getLocusId());

            if (locus2 != null && locus1.getLocusId() != 14) { // Bỏ qua AMEL (locus 14)
                // Tính PI cho locus này
                BigDecimal pi = calculatePI(locus1, locus2);

                // Tạo kết quả chi tiết
                ComparisonLocusResult locusResult = new ComparisonLocusResult();
                locusResult.setComparisonId(null); // Sẽ set sau khi save comparison_result
                locusResult.setLocusId(locus1.getLocusId());
                locusResult.setPiValue(pi);
                locusResults.add(locusResult);

                // Nhân vào CPI
                cpi = cpi.multiply(pi);

                // Đếm locus khớp (PI > 0)
                if (pi.compareTo(BigDecimal.ZERO) > 0) {
                    matchedLoci++;
                }
            }
        }

        // Tính probability từ CPI
        // P = CPI / (CPI + 1) × 100%
        BigDecimal probability = cpi.divide(
                cpi.add(BigDecimal.ONE),
                10,
                RoundingMode.HALF_UP
        ).multiply(new BigDecimal("100"));

        // Xác định mối quan hệ
        String relationship = determineRelationship(cpi, matchedLoci, locusResults.size());

        // Tạo kết quả tổng hợp
        ComparisonResult result = new ComparisonResult();
        result.setSample1Id(sample1Id);
        result.setSample2Id(sample2Id);
        result.setMatchedLocus(matchedLoci);
        result.setSimilarityPercent(probability.floatValue());
        result.setPaternityIndex(cpi);
        result.setRelationship(relationship);

        return result;
    }

    /**
     * Tính PI (Paternity Index) cho 1 locus
     *
     * CÔNG THỨC:
     * - Nếu con heterozygous (11-12): PI = 1 / (2 × p)
     * - Nếu con homozygous (11-11): PI = 1 / p
     * - Nếu không khớp: PI = 0
     *
     * @param parentLocus DNA của "cha"
     * @param childLocus DNA của "con"
     * @return PI value
     */
    private BigDecimal calculatePI(DNALocusResult parentLocus, DNALocusResult childLocus) {
        String parentAllele1 = parentLocus.getAllele1();
        String parentAllele2 = parentLocus.getAllele2();
        String childAllele1 = childLocus.getAllele1();
        String childAllele2 = childLocus.getAllele2();

        // Kiểm tra xem con có nhận allele nào từ cha không
        String sharedAllele = null;

        if (parentAllele1.equals(childAllele1) || parentAllele1.equals(childAllele2)) {
            sharedAllele = parentAllele1;
        } else if (parentAllele2.equals(childAllele1) || parentAllele2.equals(childAllele2)) {
            sharedAllele = parentAllele2;
        }

        // Nếu không có allele chung → PI = 0 (không phải cha con)
        if (sharedAllele == null) {
            return BigDecimal.ZERO;
        }

        // Lấy tần suất của allele chung
        double frequency = alleleFreqRepo.getFrequency(childLocus.getLocusId(), sharedAllele);

        // Tính PI dựa trên kiểu gen của con
        boolean childIsHomozygous = childAllele1.equals(childAllele2);

        if (childIsHomozygous) {
            // PI = 1 / p
            return BigDecimal.ONE.divide(
                    BigDecimal.valueOf(frequency),
                    8,
                    RoundingMode.HALF_UP
            );
        } else {
            // PI = 1 / (2 × p)
            return BigDecimal.ONE.divide(
                    BigDecimal.valueOf(2 * frequency),
                    8,
                    RoundingMode.HALF_UP
            );
        }
    }

    /**
     * Xác định mối quan hệ dựa trên CPI và số locus khớp
     *
     * NGƯỠNG:
     * - CPI > 10,000: Cha-Con
     * - CPI > 100: Có thể có quan hệ
     * - Matched > 50%: Anh chị em
     * - Matched < 50%: Không có quan hệ
     */
    private String determineRelationship(BigDecimal cpi, int matchedLoci, int totalLoci) {
        if (cpi.compareTo(new BigDecimal("10000")) > 0) {
            return "Cha-Con";
        } else if (cpi.compareTo(new BigDecimal("100")) > 0) {
            return "Có thể có quan hệ";
        } else {
            double matchPercent = (double) matchedLoci / totalLoci;
            if (matchPercent > 0.5) {
                return "Anh chị em";
            } else {
                return "Không có quan hệ";
            }
        }
    }

    /**
     * Tìm locus theo ID trong list
     */
    private DNALocusResult findLocusById(List<DNALocusResult> loci, int locusId) {
        for (DNALocusResult locus : loci) {
            if (locus.getLocusId() == locusId) {
                return locus;
            }
        }
        return null;
    }

    /**
     * So sánh 1 mẫu DNA với tất cả mẫu trong hệ thống
     * Tìm kiếm người thân tự động
     *
     * @param userId ID của user cần tìm kiếm
     * @return List các kết quả so sánh có CPI > 100
     */
    public List<ComparisonResult> findRelatives(int userId) {
        List<ComparisonResult> relatives = new ArrayList<>();

        // Import repositories
        com.codegym.dna_bank.repository.DNASampleRepository sampleRepo =
                new com.codegym.dna_bank.repository.DNASampleRepository();
        com.codegym.dna_bank.repository.ComparisonResultRepository comparisonRepo =
                new com.codegym.dna_bank.repository.ComparisonResultRepository();

        // Lấy DNA sample của user hiện tại
        com.codegym.dna_bank.entity.DNASample mySample = sampleRepo.findByUserId(userId);
        if (mySample == null) {
            System.out.println("User " + userId + " chưa có DNA sample");
            return relatives;
        }

        // Lấy tất cả DNA samples khác
        List<com.codegym.dna_bank.entity.DNASample> otherSamples = sampleRepo.findAllExcept(userId);

        System.out.println("Bắt đầu so sánh DNA của user " + userId + " với " + otherSamples.size() + " mẫu khác...");

        // Loop qua từng mẫu và so sánh
        for (com.codegym.dna_bank.entity.DNASample otherSample : otherSamples) {
            try {
                // Kiểm tra đã so sánh chưa
                if (comparisonRepo.isCompared(mySample.getSampleId(), otherSample.getSampleId())) {
                    System.out.println("Đã so sánh rồi: Sample " + mySample.getSampleId() + " vs " + otherSample.getSampleId());
                    continue;
                }

                // So sánh DNA
                ComparisonResult result = compareDNA(mySample.getSampleId(), otherSample.getSampleId());

                // Lưu kết quả vào DB
                int comparisonId = comparisonRepo.save(result);

                // Nếu có quan hệ huyết thống (CPI > 100)
                if (result.getPaternityIndex().compareTo(new BigDecimal("100")) > 0) {
                    result.setComparisonId(comparisonId);
                    relatives.add(result);
                    System.out.println("✓ Tìm thấy người thân! User " + otherSample.getUserId() +
                            " - CPI: " + result.getPaternityIndex() +
                            " - " + result.getRelationship());
                }

            } catch (Exception e) {
                System.out.println("Lỗi khi so sánh với sample " + otherSample.getSampleId() + ": " + e.getMessage());
            }
        }

        System.out.println("Hoàn thành! Tìm thấy " + relatives.size() + " người thân.");
        return relatives;
    }
}