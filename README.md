# GA4 Measurement Protocol Tag (ga4mp-tag-server)
send events via GA4 Measurement Protocol (Custom Tag Template for Server-Side Google Tag Manager)

## using the tag
add template and create a new tag to forward events from any source format to GA4 using the GA4 Measurement Protocol. 

## setup
define your GA4 Measurement-Id and API secret from the data stream settings. Add a constant value or use a variable to populate the session id that should be available in the request (cookie, parameter, payload or a specific event field). 

optionally overwrite the client id with a custom value. 

per default, all event parameters (except vendor specific fields like x-some_thing or ga_some_thing) will be forwarded as event parameters. This option can be deactivated. if active, a set of event parameter keys can be ignored. additional event parameters can be set to any value. 

the same options exist for keeping, adding or manipulating user properties. 
