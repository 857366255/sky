package com.sky.fitness.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wz on 2018/3/6.
 */
public class Card {

    private Integer id;//唯一标识符
    private Integer cardTypeId;//卡号类型id
    private Integer vipId;//会员id
    private Integer cardNumber;//卡号
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date openedDate;//开卡类型

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCardTypeId() {
        return cardTypeId;
    }

    public void setCardTypeId(Integer cardTypeId) {
        this.cardTypeId = cardTypeId;
    }

    public Integer getVipId() {
        return vipId;
    }

    public void setVipId(Integer vipId) {
        this.vipId = vipId;
    }

    public Integer getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(Integer cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Date getOpenedDate() {
        return openedDate;
    }

    public void setOpenedDate(Date openedDate) {
        this.openedDate = openedDate;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", cardTypeId=" + cardTypeId +
                ", vipId=" + vipId +
                ", cardNumber=" + cardNumber +
                ", openedDate=" + openedDate +
                '}';
    }
}
