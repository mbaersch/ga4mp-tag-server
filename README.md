# GA4 Measurement Protocol Tag 

**Custom Tag Template for Server-Side Google Tag Manager**

Send events via GA4 Measurement Protocol 

![Template Status](https://img.shields.io/badge/Community%20Template%20Gallery%20Status-submitted-orange) ![Repo Size](https://img.shields.io/github/repo-size/mbaersch/ga4mp-tag-server) ![License](https://img.shields.io/github/license/mbaersch/ga4mp-tag-server)


---

## Using The Tag
Add template and create a new tag to forward events from any source format to GA4 using the GA4 Measurement Protocol. All existing parameters (and GA4 and user properties) can be included.     

## Setup
Define your GA4 Measurement-Id and API secret from your GA4 data stream settings. 

### Setting a Session ID
Add a constant value or use a variable to populate the session id that should be available somwhere in the request (existing session cookie, request parameter, payload or a specific event field) or created server-side. If you use this template to *enhance existing web sessions*, use `ga_session_id` from incoming GA4 events, extracted as event variable. 

Note: If requests are not in GA4 format but still a GA4 web session exists and should include the event sent with this tag, you can extract the existing session id from the _ga_xxxxxxxx cookie if the session id is not part of the event parameters. To achive that, you can use a cookie variable to read the value and feed a *Number & String Operations* variable (https://tagmanager.google.com/gallery/#/owners/mbaersch/templates/number-string-operations). Use the string function *split+extract (split, then get item at param 3 index)* to extract the existing session id (a timestamp in seconds). Be aware that the way GA4 stores a session can change any time.   

## Options
You can optionally overwrite the client id (that defaults to the client_id event parameter) with a custom value. 

### Event Parameter Handling
Per default, all existing **event parameters** (except vendor specific fields like x-some_thing or ga_some_thing) will be forwarded as event parameters in the GA4MP request. This option can be deactivated. If active, a set of event parameter keys can be defined that are removed if present in the event in order to reduce data sent to GA4. Additionally *new event parameters* (or existing ones) can be set to any value. 

### User Properties
The same options exist for keeping, adding or manipulating **user properties** that are included in incoming requests in GA4 format (only GA4 properties are processed). If you want to use specific event parameters as user properties, extract them as variables from the request, add keys to the ignore list for user properties and use the variables to set user properties instead.   

## Endpoint
All requests are sent to the standard GA4MP endpoint at https://www.google-analytics.com/mp/. As there is no option to allow any other domain to receive data (as a useful restriction of how templates work) you can not change the destination URL. If needed anyway, patching the template would be necessary (which is not recommended).    
