///*
// * @author  枫桥夜泊
// * @date  2020/6/10
// * @time  8:44
// */
package com.clothingStore.atn.shop.consume.service;

import com.clothingStore.atn.commons.beans.Cloth;
import com.clothingStore.atn.commons.beans.Consume;

import java.util.Map;

public interface IConsumeService {

    void createConsume(Consume consume, Map<Cloth, Integer> cart);

    void modifyConsumeState(String id,double money);
}
