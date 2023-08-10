package com.conversestore.service;



import org.apache.catalina.connector.Response;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;



@Service
public class SecurityRestTemplate {
   RestTemplate client = new RestTemplate();
    
    public JsonNode get(String url){
        return this.request(url, HttpMethod.GET, null);
    }

    public JsonNode post(String url, Object data){
        return this.request(url, HttpMethod.POST, data);
    }

    public JsonNode put(String url,Object data){
        return this.request(url, HttpMethod.GET, data);
    }

    public JsonNode delete(String url){
        return this.request(url, HttpMethod.GET, null);
    }

    private JsonNode request(String url, HttpMethod method, Object data){
        HttpHeaders head = new HttpHeaders();

        HttpEntity<Object>entity = new HttpEntity<>(data, head);

        ResponseEntity<JsonNode> respone = client.exchange(url, method, entity, JsonNode.class, head);

        return respone.getBody();
    }

    // public JsonNode get(String url){
    //     return this.requers (url, HttpMethod.GET, null)
    // }
}
