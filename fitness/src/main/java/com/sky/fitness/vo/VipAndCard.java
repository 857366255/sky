package com.sky.fitness.vo;

import com.sky.fitness.po.Card;
import com.sky.fitness.po.Vip;

/**
 * Created by wz on 2018/3/6.
 */
public class VipAndCard {
    private Vip vip;
    private Card card;

    public Vip getVip() {
        return vip;
    }

    public void setVip(Vip vip) {
        this.vip = vip;
    }

    public Card getCard() {
        return card;
    }

    public void setCard(Card card) {
        this.card = card;
    }

    @Override
    public String toString() {
        return "VipAndCard{" +
                "vip=" + vip +
                ", card=" + card +
                '}';
    }
}
