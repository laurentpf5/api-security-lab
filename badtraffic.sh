#!/bin/bash
APPHOST=api.apigwdemo.com
curl -H "1.2.3.4" http://$APPHOST
curl http://$APPHOST/%09
curl http://$APPHOST/index.bak
curl http://i$APPHOST?a=%3Cscript%3E
curl http://$APPHOST
curl http://$APPHOST/\<script\>
curl -H "Content-Length: -26" http://$APPHOST/
curl http://$APPHOST/index.php
curl http://$APPHOST/test.exe
curl http://$APPHOST/index.html
curl http://$APPHOST/basic/index.php
