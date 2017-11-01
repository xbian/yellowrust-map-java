/*
 * Copyright (c) 2012. The Genome Analysis Centre, Norwich, UK
 * MISO project contacts: Robert Davey, Mario Caccamo @ TGAC
 * *********************************************************************
 *
 * This file is part of MISO.
 *
 * MISO is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * MISO is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MISO.  If not, see <http://www.gnu.org/licenses/>.
 *
 * *********************************************************************
 */

package uk.ac.tgac.wis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;

@Controller
public class MenuController implements ServletContextAware {

    ServletContext servletContext;

    @RequestMapping("/")
    public String indexPage() {
        return "/index.jsp";
    }


    @RequestMapping("/search/{query}")
    public ModelAndView query(@PathVariable String query, ModelMap model) {
        model.put("query", query);
        return new ModelAndView("/index.jsp", model);
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @RequestMapping("/phenotype")
    public String phenotype() {
        return "/phenotype.jsp";
    }

    @RequestMapping("/company")
    public String company() {
        return "/index.jsp";
    }


    @RequestMapping("/company/{companyname}")
    public ModelAndView eachcompany(@PathVariable String companyname, ModelMap model) {
        if ("agrii".equals(companyname)) {
            model.put("company", "VCfV891KhafcbeA7WJVpd2b4fnp60BahaubwbC79UEhLKF9HIsatcBarsz3tcU0");
            return new ModelAndView("/company.jsp", model);
        } else if ("basf".equals(companyname)) {
            model.put("company", "RImh0fYpAKXuBIIsWJWdLiALRDsw583jerEN7WRI5H8N22Tq5Jn9yK8NJ5jubmI");
            return new ModelAndView("/company.jsp", model);
        } else if ("kws".equals(companyname)) {
            model.put("company", "t8WmkblHs4TnzLl7JZon88gSf5ONawANr5NRJcXnUty5E3pgFaDZb75BGaqQOba");
            return new ModelAndView("/company.jsp", model);
        } else if ("ragt".equals(companyname)) {
            model.put("company", "TlPRHGBXHPhDrwm095PWKDdRPARnJ9olsfgEnn5kfSfH8sOAgJSPeA5i3AZB5ZC");
            return new ModelAndView("/company.jsp", model);
        } else if ("limagrain".equals(companyname)) {
            model.put("company", "psYzllQ5Si2vlwOcbu0j2i6g8VH9sqP7jrG2lKbqqAsTavCzUr0XG1l48sAjoXc");
            return new ModelAndView("/company.jsp", model);
        } else if ("syngenta".equals(companyname)) {
            model.put("company", "SEWk7D7hgZPYrXfIk3i8t5nDiKUTV72qxeQ1fvp3O4hAElaQ5BkYhYMGJahgGdw");
            return new ModelAndView("/company.jsp", model);
        } else if ("niab".equals(companyname)) {
            model.put("company", "uSGbCZ0qP9QHBcaOSZobIyfYPwb0fFu9aPIaxULmbt84OlyXiELSPJb4T6pHzAo");
            return new ModelAndView("/company.jsp", model);
        }   else if ("adminview".equals(companyname)) {
            model.put("company", "gGbXo54Ytw21EftdFU9VyPPMnuQAshYzS7XpTDU4yIut9B9BGwPfGWR1SOCtI9h");
            return new ModelAndView("/company.jsp", model);
        }  else {
            return new ModelAndView("/index.jsp", model);
        }
    }
}
