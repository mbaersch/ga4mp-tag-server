___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Measurement Protocol Tag",
  "brand": {
    "id": "mbaersch",
    "displayName": "mbaersch",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABmJLR0QAwABKANIFhuhKAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH5gccEDAuu5D+RAAAABl0RVh0Q29tbWVudABDcmVhdGVkIHdpdGggR0lNUFeBDhcAAAGWSURBVFjD7de9axRBGMfxz63KnYrBxnRbiZjC2hcUxEoxpBCSJinsVLAyzF+h6wsK2qUREXKlFomFqBC1CQiitTCWNnJanIprsydH3FuieHsi91TD8zzzzPf5zewMy4itMczi3bbDWMAE1vKGpdasb7UAdNvO4Q6SPveqhpnmrK89RzKkxSdxraT+Sbn5fkcyJAGOYOeA2PE6AFoVsR11AGzaxgBjgJEDbP3TiTHYh5miidU087o2BWJwAW9xFVewHoOLtQDEYAo3N6i3DTdisL8OBU4XC5Zt56k6ACYqYrtH/RU0xvfAGOD/uIpjMImD6OBlmunWpkAMzuMdHuAJ3sTgQC0AMTiE29je596Ldgylt99fV2BhwLmYwtFinFfUyzeRUwmwqyK3F+tU5HR+I6cU4OmASZ/xohg/ruiwN/85Pg3IeVYFcA8PN/i+41Ka+QBp5hWulxS+lWbWoTnnIxZLQB/hfuXj8X7RljxxFicKue6m2c/u+w/sGUwXTay0Est7Lv/yi3YM88X2rWGpOeeLf8l+ANFzWUKFTJ07AAAAAElFTkSuQmCC"
  },
  "description": "sends events with selected parameters and properties via GA4 Measurement Protocol",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "measurementId",
    "displayName": "Measurement ID",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Paste the Measurement ID from your GA4 Data Stream here"
  },
  {
    "type": "TEXT",
    "name": "apiSecret",
    "displayName": "API Secret",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Create a Measurement Protocol API secret in your Data Stream settings and paste secret here"
  },
  {
    "type": "TEXT",
    "name": "sessionId",
    "displayName": "Session ID",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Enter a fixed ID or use request / event data to create a common ID for all hits from the same session"
  },
  {
    "type": "CHECKBOX",
    "name": "clientIdOverride",
    "checkboxText": "Override Client ID",
    "simpleValueType": true,
    "help": "The tag uses the client_id parameter from incoming events by default. Optionally use an alternative ID",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "clientId",
    "displayName": "Client ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "clientIdOverride",
        "paramValue": true,
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "grpEventParams",
    "displayName": "Event Parameters",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "addAllSetParams",
        "checkboxText": "Forward Event Parameters",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "All non-vendor-specific event parameters can be added to outgoing requests"
      },
      {
        "type": "CHECKBOX",
        "name": "skipCustomParams",
        "checkboxText": "Ignore Selected Event Parameters",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "addAllSetParams",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "List all event parameter keys that shoud not be included in outgoing requests"
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "skipParamTable",
        "displayName": "Parameters To Ignore",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Parameter Name",
            "name": "skipParam",
            "type": "TEXT"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "skipCustomParams",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "grpAddParams",
        "displayName": "Event Parameters To Add / Edit",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "addEventParams",
            "displayName": "",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Name",
                "name": "paramName",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Value",
                "name": "paramValue",
                "type": "TEXT"
              }
            ]
          }
        ],
        "help": "Add or modify event parameters by providing parameter names (keys) and values"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "grpUserProps",
    "displayName": "User Properties",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "addAllSetUserProps",
        "checkboxText": "Forward User Properties",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "All existing GA4 user properties can be added to outgoing requests"
      },
      {
        "type": "CHECKBOX",
        "name": "skipCustomProps",
        "checkboxText": "Ignore Selected User Properties",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "addAllSetUserProps",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "help": "Define a list of user property names that shoud be removed from outgoing requests"
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "skipPropTable",
        "displayName": "Properties To Ignore",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Property Name",
            "name": "skipProp",
            "type": "TEXT"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "skipCustomProps",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "grpAddProps",
        "displayName": "User Properties To Add / Edit",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "addUserProps",
            "displayName": "",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Name",
                "name": "propName",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Value",
                "name": "propValue",
                "type": "TEXT"
              }
            ]
          }
        ],
        "help": "Add new or modify existing user properties to be included in outgoing requests"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const sendHttpRequest = require("sendHttpRequest");
const setResponseStatus = require("setResponseStatus");
const setResponseHeader = require("setResponseHeader");
const JSON = require("JSON");
const Object = require("Object");

const event = require("getAllEventData")();

//standard event parameters to skip by default 
var skipProps = [
  "client_id",
  "session_id",
  "event_name",
  "page_location",
  "page_referrer",
  "page_title",
  "ip_override",
  "user_agent",
  "session_number"
];

var url = "https://www.google-analytics.com/mp/collect?measurement_id=" + 
    data.measurementId + "&api_secret=" + data.apiSecret;

var mpClientId = event.client_id;
if (data.clientIdOverride === true && data.clientId) mpClientId = data.clientId;

//minimal event parameters
var ev_params = {
  session_id : data.sessionId,
  page_location: event.page_location||"",
  page_referrer: event.page_referrer,
  page_title: event.page_title||"",
};

//optionally use (not "blacklisted") event parameters
if (data.addAllSetParams === true) {  
  if (data.skipCustomParams && (data.skipParamTable.length > 0))
    data.skipParamTable.forEach(x => {
      skipProps.push(x.skipParam);  
    });  
  Object.keys(event).forEach(k => {
    //skip all fields that are already set by default, defined to skip in the settings or vendor specific
    if ((k.substring(0,3) != "ga_") && (k.substring(0,2) != "x-") && (skipProps.indexOf(k) < 0)) 
      ev_params[k] = event[k];
  });
}

//add custom event parameters
if (data.addEventParams && data.addEventParams.length > 0) {
  for (var i=0;i<data.addEventParams.length;i++) {
    var prm = data.addEventParams[i];
    ev_params[prm.paramName] = prm.paramValue;
  }
}

var payload = {
  client_id: mpClientId,
  events:[{
    name: event.event_name,
    params: ev_params
  }]
};

//add user properties
if (data.addAllSetUserProps === true) {
  payload.user_properties = event["x-ga-mp2-user_properties"];

  //delete unwanted user properties
  if (data.skipCustomProps && (data.skipPropTable.length > 0))
    data.skipPropTable.forEach(x => {
      Object.delete(payload.user_properties, x.skipProp);
    });  
}  

//add custom user properties
if (data.addUserProps && data.addUserProps.length > 0) {
  if (!payload.user_properties) payload.user_properties = {};
  for (var i=0;i<data.addUserProps.length;i++) {
    var prm = data.addUserProps[i];
    payload.user_properties[prm.propName] = prm.propValue;
  }
}

//send request via GA4MP
sendHttpRequest(
  url, 
  { headers: {"Content-Type" : "application/json", "Accept" : "*/*"},
    method: 'POST', timeout: 500
  }, 
  JSON.stringify(payload)
).then((result) => {
  setResponseStatus(result.statusCode);
  setResponseHeader('cache-control', result.headers['cache-control']);
  data.gtmOnSuccess();
});


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_response",
        "versionId": "1"
      },
      "param": [
        {
          "key": "writeResponseAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "writeHeaderAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.google-analytics.com/mp/"
              }
            ]
          }
        },
        {
          "key": "allowGoogleDomains",
          "value": {
            "type": 8,
            "boolean": true
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 28.7.2022, 18:05:10

