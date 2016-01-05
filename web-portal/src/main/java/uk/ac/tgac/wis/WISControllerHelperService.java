
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

    String yrURL = "http://v0214.nbi.ac.uk:2888/grassroots/controller";
    String simonURL = "http://n79610.nbi.ac.uk:2888/grassroots/controller";


    public JSONObject getCompanyData(HttpSession session, JSONObject json) {
        String company = json.getString("company");
        String actualCompany;
        String dataSearch = "";
        if ("VCfV891KhafcbeA7WJVpd2b4fnp60BahaubwbC79UEhLKF9HIsatcBarsz3tcU0".equals(company)) {
            actualCompany = "Agrii";
            dataSearch = "\"Company.name\": \""+actualCompany+"\"";
        } else if ("RImh0fYpAKXuBIIsWJWdLiALRDsw583jerEN7WRI5H8N22Tq5Jn9yK8NJ5jubmI".equals(company)) {
            actualCompany = "BASF";
            dataSearch = "\"Company.name\": \""+actualCompany+"\"";
        } else if ("t8WmkblHs4TnzLl7JZon88gSf5ONawANr5NRJcXnUty5E3pgFaDZb75BGaqQOba".equals(company)) {
            actualCompany = "KWS";
            dataSearch = "\"Company.name\": \""+actualCompany+"\"";
        } else if ("TlPRHGBXHPhDrwm095PWKDdRPARnJ9olsfgEnn5kfSfH8sOAgJSPeA5i3AZB5ZC".equals(company)) {
            actualCompany = "RAGT";
            dataSearch = "\"Company.name\": \""+actualCompany+"\"";
        } else if ("psYzllQ5Si2vlwOcbu0j2i6g8VH9sqP7jrG2lKbqqAsTavCzUr0XG1l48sAjoXc".equals(company)) {
            actualCompany = "Limagrain";
            dataSearch = "\"Company.name\": \""+actualCompany+"\"";
        } else if ("SEWk7D7hgZPYrXfIk3i8t5nDiKUTV72qxeQ1fvp3O4hAElaQ5BkYhYMGJahgGdw".equals(company)) {
            actualCompany = "Syngenta";
            dataSearch = "\"Company.name\": \""+actualCompany+"\"";
        } else if ("uSGbCZ0qP9QHBcaOSZobIyfYPwb0fFu9aPIaxULmbt84OlyXiELSPJb4T6pHzAo".equals(company)) {
            dataSearch =
//                    "\"Company.name\": {" +
//                    "\"$regex\": \"/^(NIAB|TAG)/i\"}";
        "\"Company.name\": {" +
                "\"operator\": \"like\"," +
                "\"value\": \"NIAB\"}";
        }
        JSONObject responses = new JSONObject();
        String url = simonURL;
        String result = "{" +
                " \"services\": [" +
                "   {" +
                "     \"services\": \"Pathogenomics Geoservice\"," +
                "     \"run\": true," +
                "     \"parameter_set\": {" +
                "       \"parameters\": [" +
                "         {" +
                "           \"param\": \"search\"," +
                "           \"current_value\": {" +
                "             \"data\": {" +
                dataSearch +
                "             }" +
                "           }," +
                "           \"tag\": 1346851157," +
                "           \"type\": \"json\"," +
                "           \"grassroots_type\": 13," +
                "           \"level\": 7," +
                "           \"concise\": true" +
                "         }," +
                "         {" +
                "           \"param\": \"dump\"," +
                "           \"current_value\": false," +
                "           \"tag\": 1346847824," +
                "           \"type\": \"boolean\"," +
                "           \"grassroots_type\": 0," +
                "           \"level\": 6," +
                "           \"concise\": true" +
                "         }," +
                "         {" +
                "           \"param\": \"collection\"," +
                "           \"current_value\": \"samples\"," +
                "           \"tag\": 1346847567," +
                "           \"type\": \"string\"," +
                "           \"grassroots_type\": 5," +
                "           \"level\": 7," +
                "           \"concise\": true" +
                "         }" +
                "       ]," +
                "       \"groups\": [" +
                "         \"Spreadsheet Import Parameters\"" +
                "       ]" +
                "     }" +
                "   }" +
                " ]" +
                "}";

        HttpClient httpClient = new DefaultHttpClient();


        try {
            HttpPost request = new HttpPost(url);
            StringEntity params = new StringEntity(result);
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            request.setEntity(params);
            HttpResponse response = httpClient.execute(request);

            ResponseHandler<String> handler = new BasicResponseHandler();
            String body = handler.handleResponse(response);

            JSONArray jsonArray = JSONArray.fromObject(body);
            JSONArray resultsArray = JSONArray.fromObject(jsonArray.getJSONObject(0).get("results"));


            responses.put("data", resultsArray);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return responses;

    }

//    public JSONObject insertYRExcel(HttpSession session, JSONObject json) {
//        String uuid = json.getString("uuid");
//        String url = blastURL;
//        String result = "{" +
//                "  \"operations\": {" +
//                "    \"operationId\": 7" +
//                "  }," +
//                "  \"services\": [" +
//                "    \"" + uuid + "\"" +
//                "  ]" +
//                "}";
//
//        HttpClient httpClient = new DefaultHttpClient();
//
//        try {
//            HttpPost request = new HttpPost(url);
//            StringEntity params = new StringEntity(result);
//            request.addHeader("content-type", "application/x-www-form-urlencoded");
//            request.setEntity(params);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        } finally {
//            httpClient.getConnectionManager().shutdown();
//        }
//        return JSONUtils.SimpleJSONResponse("ok");
//    }
}
