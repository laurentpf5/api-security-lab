# api-security-lab

<p>This repo contains files for customers and partners to practice an API Security with NGINX App-Protect WAF.</p>

To demonstrate the capabilities, F1 Ergast is the application chosen.
Two instances are deployed as containers and will serve the requests through NGINX+ acting as an API GW.
An image of NGINX App-Protect is built with the latest attack signature and threat campaign definitions.

The list of Labs is inspired by the OWASP API Security 

**Labs** 

Secure Transport  
HTTP Method enforcements  
Manage Endpoints  
Enforce Input Validation with OAS in NGNINX App-Protect WAF  

# Activate Signatures
# Protect from Bots

**Environment**

The demo environment is made of :  
- Two containers running F1 Ergast API App  
- One NGINX+ Container configured with NGINX App-Protect  

**Instructions**
To build and start the environment,   
` $ docker-compose -f Docker-compose-api-lab.yaml up -d`  
To check every component is setup,  
`$ docker ps`
This must let you with 5 containers running  
- ergast01
- ergast02
- elasticsearch
- ergastdb
- approtect 

Make sure that you have a host entry similar to the following :  
xxx.xxx.xxx.xxx api.apigwdemo.com  

Access the http://api.apigwdemo:5601/ to view the logs of NGINX App Protect  

**Secure Transport**
The NGINX API Gateway is configured with SSL. You can check the configuration in nginx.conf and try the connection to https://api.apigwdemo.com/api/f1/drivers either with the browser, or on the command line :  
'$ curl -k  https://api.apigwdemo.com/api/f1/drivers'

**HTTP Method enforcements**
An Application Security Policy in NGINX App Protect will allow you block the PUT method. To test it :  
Copy the policy file for NGINX App Protect to load it with  
`$ cp policies/apisecurity-method.json labpolicy.json`  
Reload NGINX App Protect with the new configuration with   
`docker exec NGINX_CONTAINER_ID nginx -s reload`  
Issue the following request   
`$ curl -k -X PUT  https://api.apigwdemo.com/api/f1/drivers`  

**Manage enpoints**
An Application Security Policy in NGINX App Protect will allow you block the PUT method. To test it :  
Copy the policy file for NGINX App Protect to load it with  
`$ cp policies/apisecurity-url.json labpolicy.json`  
Reload NGINX App Protect with the new configuration with   
`docker exec NGINX_CONTAINER_ID nginx -s reload`  
Issue the following request  
`$ curl -k  https://api.apigwdemo.com/api/f2/drivers`  

**Enforce Input Validation with OAS**
An Application Security Policy in NGINX App Protect will allow you block the PUT method. To test it :  
Copy the policy file for NGINX App Protect to load it with  
`$ cp policies/apisecurity-oas.json labpolicy.json`  
Reload NGINX App Protect with the new configuration with   
`docker exec NGINX_CONTAINER_ID nginx -s reload`  
Issue the following request  
`$ curl -k -X POST -d 'blabla' https://api.apigwdemo.com/api/f1/driver`  
