package com.dhb.springapp.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "bacsi")
public class BacSi implements Serializable {
    @Id
    @Column(name = "id", length = 36)
    private String id;
    @Column(name = "Ho", length = 10, nullable = false)
    private String ho;
    @Column(name = "Ten", length = 45, nullable = false)
    private String ten;
    @Column(name = "GioiTinh", length = 10, nullable = false)
    private String gioiTinh;
    @Column(name = "NgaySinh", nullable = false)
    private Date ngaySinh;
    @Column(name = "DienThoai", length = 10, nullable = false)
    private String dienThoai;
    @Column(name = "Image", length = 100)
    private String image;
    @OneToMany(mappedBy = "bacSi", fetch = FetchType.LAZY)
    private Set<ToaThuoc> dsToaThuoc;
    @OneToOne
    @MapsId
    @JoinColumn(name = "id")
    public TaiKhoan taiKhoan;
    @OneToMany(mappedBy = "bacSi", fetch = FetchType.LAZY)
    private Set<ChiTietCaKhamBenh> dsChiTietCaKhamBenh;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHo() {
        return ho;
    }

    public void setHo(String ho) {
        this.ho = ho;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    public Set<ToaThuoc> getDsToaThuoc() {
        return dsToaThuoc;
    }

    public void setDsToaThuoc(Set<ToaThuoc> dsToaThuoc) {
        this.dsToaThuoc = dsToaThuoc;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set<ChiTietCaKhamBenh> getDsChiTietCaKhamBenh() {
        return dsChiTietCaKhamBenh;
    }

    public void setDsChiTietCaKhamBenh(Set<ChiTietCaKhamBenh> dsChiTietCaKhamBenh) {
        this.dsChiTietCaKhamBenh = dsChiTietCaKhamBenh;
    }
}
