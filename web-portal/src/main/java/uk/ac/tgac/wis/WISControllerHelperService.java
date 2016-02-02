
package uk.ac.tgac.wis;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sourceforge.fluxion.ajax.Ajaxified;
import net.sourceforge.fluxion.ajax.util.JSONUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: bianx
 * Date: 02/11/11
 * Time: 15:59
 * To change this template use File | Settings | File Templates.
 */
@Ajaxified
public class WISControllerHelperService {
    protected static final Logger log = LoggerFactory.getLogger(WISControllerHelperService.class);

    String yrURL = "http://v0214.nbi.ac.uk:1888/grassroots/controller";
    String simonURL = "http://n79610.nbi.ac.uk:8080/grassroots/controller";


    public JSONObject getCompanyData(HttpSession session, JSONObject json) {
        String company = json.getString("company");

        String actualCompany;

        JSONObject companyName = new JSONObject();

        if ("VCfV891KhafcbeA7WJVpd2b4fnp60BahaubwbC79UEhLKF9HIsatcBarsz3tcU0".equals(company)) {
            actualCompany = "Agrii";
            companyName.put("sample.Company.name", actualCompany);

        } else if ("RImh0fYpAKXuBIIsWJWdLiALRDsw583jerEN7WRI5H8N22Tq5Jn9yK8NJ5jubmI".equals(company)) {
            actualCompany = "BASF";
            companyName.put("sample.Company.name", actualCompany);

        } else if ("t8WmkblHs4TnzLl7JZon88gSf5ONawANr5NRJcXnUty5E3pgFaDZb75BGaqQOba".equals(company)) {
            actualCompany = "KWS";
            companyName.put("sample.Company.name", actualCompany);

        } else if ("TlPRHGBXHPhDrwm095PWKDdRPARnJ9olsfgEnn5kfSfH8sOAgJSPeA5i3AZB5ZC".equals(company)) {
            actualCompany = "RAGT";
            companyName.put("sample.Company.name", actualCompany);

        } else if ("psYzllQ5Si2vlwOcbu0j2i6g8VH9sqP7jrG2lKbqqAsTavCzUr0XG1l48sAjoXc".equals(company)) {
            actualCompany = "Limagrain";
            companyName.put("sample.Company.name", actualCompany);

        } else if ("SEWk7D7hgZPYrXfIk3i8t5nDiKUTV72qxeQ1fvp3O4hAElaQ5BkYhYMGJahgGdw".equals(company)) {
            actualCompany = "Syngenta";
            companyName.put("sample.Company.name", actualCompany);

        } else if ("uSGbCZ0qP9QHBcaOSZobIyfYPwb0fFu9aPIaxULmbt84OlyXiELSPJb4T6pHzAo".equals(company)) {
            JSONObject niabSearch = new JSONObject();
            niabSearch.put("operator", "like");
            niabSearch.put("value", "NIAB");
            companyName.put("sample.Company.name", niabSearch);
        }

        JSONObject responses = new JSONObject();
        JSONObject requestObject = new JSONObject();
        JSONArray servicesArray = new JSONArray();

        JSONObject service1 = new JSONObject();
        JSONObject parameterSetObject = new JSONObject();
        JSONArray parametersArray = new JSONArray();

        JSONObject p1 = new JSONObject();
        JSONObject searchData = new JSONObject();
        searchData.put("data", companyName);

        p1.put("param", "search");
        p1.put("tag", 1346851157);
        p1.put("current_value", searchData);
        p1.put("grassroots_type", 13);
        p1.put("type", "json");
        p1.put("concise", true);
        parametersArray.add(p1);

        JSONObject p2 = new JSONObject();

        p2.put("param", "preview");
        p2.put("tag", 1346850902);
        p2.put("current_value", true);
        p2.put("grassroots_type", 0);
        p2.put("type", "boolean");
        p2.put("concise", true);
        parametersArray.add(p2);

        JSONObject p3 = new JSONObject();

        p3.put("param", "collection");
        p3.put("tag", 1346847567);
        p3.put("current_value", "sample");
        p3.put("grassroots_type", 5);
        p3.put("type", "string");
        p3.put("concise", true);
        parametersArray.add(p3);

        parameterSetObject.put("parameters", parametersArray);

        service1.put("run", true);
        service1.put("services", "Pathogenomics Geoservice");

        service1.put("parameter_set", parameterSetObject);

        servicesArray.add(service1);
        requestObject.put("services", servicesArray);

        JSONArray jsonArray = JSONArray.fromObject(sendrequest(requestObject));
        JSONArray resultsArray = JSONArray.fromObject(jsonArray.getJSONObject(0).get("results"));

        responses.put("data", resultsArray);

        return responses;

    }

    public JSONObject getAllPublicData(HttpSession session, JSONObject json) {

        JSONObject responses = new JSONObject();
        JSONObject requestObject = new JSONObject();
        JSONArray servicesArray = new JSONArray();

        JSONObject service1 = new JSONObject();
        JSONObject parameterSetObject = new JSONObject();
        JSONArray parametersArray = new JSONArray();


        JSONObject p1 = new JSONObject();

        p1.put("param", "dump");
        p1.put("tag", 1346847824);
        p1.put("current_value", true);
        p1.put("grassroots_type", 0);
        p1.put("type", "boolean");
        p1.put("concise", true);
        parametersArray.add(p1);

        JSONObject p2 = new JSONObject();

        p2.put("param", "preview");
        p2.put("tag", 1346850902);
        p2.put("current_value", false);
        p2.put("grassroots_type", 0);
        p2.put("type", "boolean");
        p2.put("concise", true);
        parametersArray.add(p2);

        JSONObject p3 = new JSONObject();

        p3.put("param", "collection");
        p3.put("tag", 1346847567);
        p3.put("current_value", "sample");
        p3.put("grassroots_type", 5);
        p3.put("type", "string");
        p3.put("concise", true);
        parametersArray.add(p3);

        parameterSetObject.put("parameters", parametersArray);

        service1.put("run", true);
        service1.put("services", "Pathogenomics Geoservice");

        service1.put("parameter_set", parameterSetObject);

        servicesArray.add(service1);
        requestObject.put("services", servicesArray);



        JSONArray jsonArray = JSONArray.fromObject(sendrequest(requestObject));
        JSONArray resultsArray = JSONArray.fromObject(jsonArray.getJSONObject(0).get("results"));

        responses.put("data", resultsArray);

        return responses;

    }

    public String sendrequest(JSONObject requestObject) {
        String url = yrURL;

        HttpClient httpClient = new DefaultHttpClient();
        try {
            HttpPost request = new HttpPost(url);
            StringEntity params = new StringEntity(requestObject.toString());
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            request.setEntity(params);
            HttpResponse response = httpClient.execute(request);

            ResponseHandler<String> handler = new BasicResponseHandler();
            String body = handler.handleResponse(response);

            return body;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
