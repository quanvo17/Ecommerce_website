/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import session_bean.BestSaleSessionBean;
import session_bean.CategorySessionBean;
import session_bean.ProductSessionBean;

/**
 * Web application lifecycle listener.
 *
 * @author Nguyen Minh Dang
 */
public class ControllerServletListener implements ServletContextListener {
    
    @EJB
    ProductSessionBean productSessionBean;
    @EJB
    BestSaleSessionBean bestsaleSessionBean;
    @EJB
    CategorySessionBean categorySessionBean;
    
    ServletContext context;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
        context.setAttribute("newProducts", productSessionBean.findNewArrival());
        context.setAttribute("bestSale", bestsaleSessionBean.getBestSale());
        context.setAttribute("Allcate", categorySessionBean.findActiveCate());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        this.context = null;
    }
}
