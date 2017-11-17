<%@page import="java.util.List"%>
<%@page import="util.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String change_id = new String();
    String opt = new String();
    String lang;
%>
<%
    opt = request.getParameter("do");
    change_id = request.getParameter("id");
    List<Product> goodBeans;

    if (opt.equals("inc")) {

        if (!change_id.equals(null)) {

            List<Product> goods_list = new ArrayList<Product>();
            Product goods_item = new Product("ga", "images/ga", "look", "blacktea", 180, "0");
            goods_list.add(goods_item);
            goods_item = new Product("hzc", "images/hzc", "look_hzc", "greentea", 220, "1");
            goods_list.add(goods_item);
            goods_item = new Product("bh", "images/bh", "look_bh", "greentea", 195, "2");
            goods_list.add(goods_item);
            goods_item = new Product("ap", "images/ap", "look_ap", "blacktea", 240, "3");
            goods_list.add(goods_item);
            goods_item = new Product("gk", "images/gk", "look", "greentea", 180, "4");
            goods_list.add(goods_item);

            goodBeans = (List<Product>) session.getAttribute("cart");



            Integer item_id = Integer.parseInt(change_id);


            if (goodBeans == null) {
                goodBeans = new ArrayList<Product>();
                goods_item = new Product();

                goods_item.setName(goods_list.get(item_id).getName());
                goods_item.setImage(goods_list.get(item_id).getImage());
                goods_item.setLook(goods_list.get(item_id).getLook());
                goods_item.setPrice(goods_list.get(item_id).getPrice());
                goods_item.setId(goods_list.get(item_id).getId());

                goods_item.setCount(1);
                goodBeans.add(goods_item);

                session.setAttribute("cart", goodBeans);
            } else {
                Boolean flag = false;
                for (int i = 0; i < goodBeans.size(); i++) {
                    Integer beansId = Integer.parseInt(goodBeans.get(i).getId());

                    if (beansId == item_id) {
                        goodBeans.get(i).setCount(goodBeans.get(i).getCount() + 1);
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    goods_item = new Product();
                    goods_item.setId(goods_list.get(item_id).getId());
                    goods_item.setName(goods_list.get(item_id).getName());
                    goods_item.setImage(goods_list.get(item_id).getImage());
                    goods_item.setLook(goods_list.get(item_id).getLook());
                    goods_item.setPrice(goods_list.get(item_id).getPrice());
                    goods_item.setCount(1);
                    goodBeans.add(goods_item);
                }
            }
        }
        else {

        }
    }
    if (opt.equals("dec")) {
        if (change_id != null) {
            goodBeans = (List<Product>) session.getAttribute("cart");
            if (goodBeans != null) {
                for (int i = 0; i < goodBeans.size(); i++) {
                    if (goodBeans.get(i).getId().equals(change_id)) {
                        if (goodBeans.get(i).getCount() > 1) {
                            goodBeans.get(i).setCount(goodBeans.get(i).getCount() - 1);
                        } else {
                            goodBeans.remove(i);
                        }
                    }
                }
            }
        }
    }
    lang = request.getParameter("lang");
    if (lang == null) {
        lang = "ru";
    } else {
        if (lang.equals("ru")) {
            lang = "?lang=ru";
        }
        if (lang.equals("en")) {
            lang = "?lang=en";
        }
        if (lang.equals("de")) {
            lang = "?lang=de";
        }
    }
%>
<html>
<head>

    <meta http-equiv="Refresh" content="0; URL=basket.jsp?lang=<%=lang%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Working...</title>
</head>
<body>
</body>
</html>
