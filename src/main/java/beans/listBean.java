package beans;
import javax.servlet.http.HttpServletRequest;
import util.Product;

/**
 *
 * @author Milana
 */

public class listBean {

    private Product pr[];

    public listBean() {
    }

    public void setPr(Product pr[]) {

        this.pr = pr;
    }

    public Product[] getPr() {
        return pr;
    }

    public void setVisible(HttpServletRequest request) {
        for (int i = 0; i < pr.length; i++) {
            pr[i].setVisible(request);
        }
    }
}
