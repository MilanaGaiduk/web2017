package util;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.lang.Integer;
import java.lang.String;

public class Price {
    public static Integer convertPrice(String price){
        Integer priceInt = Integer.parseInt(price);
        return (priceInt);
    }
}