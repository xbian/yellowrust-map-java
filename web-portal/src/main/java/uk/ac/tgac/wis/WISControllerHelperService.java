
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


    String blastURL = "http://v0214.nbi.ac.uk/wheatis";
    String blastTestURL = "http://v0214.nbi.ac.uk:1888/grassroots/controller";


    public JSONObject getCompanyData(HttpSession session, JSONObject json) {
        String company = json.getString("company");
//        String key = json.getString("key");
        JSONObject responses = new JSONObject();
        String url = blastTestURL;
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
                "               \"Company\": \""+company+"\"" +
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

    public JSONObject insertYRExcel(HttpSession session, JSONObject json) {
        String uuid = json.getString("uuid");
        String url = blastURL;
        String result = "{" +
                "  \"operations\": {" +
                "    \"operationId\": 7" +
                "  }," +
                "  \"services\": [" +
                "    \"" + uuid + "\"" +
                "  ]" +
                "}";

        HttpClient httpClient = new DefaultHttpClient();

        try {
            HttpPost request = new HttpPost(url);
            StringEntity params = new StringEntity(result);
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            request.setEntity(params);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
        return JSONUtils.SimpleJSONResponse("ok");
    }
}
