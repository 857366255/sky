package com.sky.smarthonme.po;

public class ProductType {

    private Integer id;
    private String productType;
    private String productKey;
    private String name;
    private String dataPointUnpack;
    private String dataPointName;
    private String technical;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getProductKey() {
        return productKey;
    }

    public void setProductKey(String productKey) {
        this.productKey = productKey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDataPointUnpack() {
        return dataPointUnpack;
    }

    public void setDataPointUnpack(String dataPointUnpack) {
        this.dataPointUnpack = dataPointUnpack;
    }

    public String getDataPointName() {
        return dataPointName;
    }

    public void setDataPointName(String dataPointName) {
        this.dataPointName = dataPointName;
    }

    public String getTechnical() {
        return technical;
    }

    public void setTechnical(String technical) {
        this.technical = technical;
    }

    @Override
    public String toString() {
        return "ProductType{" +
                "id=" + id +
                ", productType='" + productType + '\'' +
                ", productKey='" + productKey + '\'' +
                ", name='" + name + '\'' +
                ", dataPointUnpack='" + dataPointUnpack + '\'' +
                ", dataPointName='" + dataPointName + '\'' +
                ", technical='" + technical + '\'' +
                '}';
    }
}
