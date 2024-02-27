const { v4: uuidv4 } = require('uuid');

/// Function to convert a date to an ISO 8601 string
function turnIntoISODuration(duration) {
    let durString = "P"
    let temp;

    temp = (duration - (duration % 31622400000)) / 31622400000;//Years
    duration = duration % 31622400000
    if (temp != 0) { durString += temp + "Y"; }

    temp = (duration - (duration % 2592000000)) / 2592000000; //Months
    duration = duration % 2592000000;
    if (temp != 0) { durString += temp + "M"; }

    temp = (duration - (duration % 604800000)) / 604800000; //Weeks
    duration = duration % 604800000;
    if (temp != 0) { durString += temp + "W"; }

    temp = (duration - (duration % 86400000)) / 86400000; //Days
    duration = duration % 86400000;
    if (temp != 0) { durString += temp + "D"; }


    if (duration != 0) { durString += "T" }


    temp = (duration - (duration % 3600000)) / 3600000; //Hours
    duration = duration % 3600000;
    if (temp != 0) { durString += temp + "H"; }

    temp = (duration - (duration % 60000)) / 60000; //Minutes
    duration = duration % 60000;
    if (temp != 0) { durString += temp + "M"; }

    temp = duration / 1000; //Seconds
    if (temp != 0) { durString += temp + "S"; }

    return durString
}

/// Function to return Response Body JSON
function responseBodyJSON(status, requestedBy, verb, objectType,contextType, context) {
    return {
        id: uuidv4(),
        timestamp: new Date().toISOString(),
        statusCode: status,
        actor: {
            name: "Server",
            id: "Server ID",
            requestBy: requestedBy,
        },
        verb: {
            "id-enum": verb.id,
            display: {
                "en-US": verb.display["en-US"]
            }
        },
        object: {
            id: context.id,
            objectType: objectType,
            definition: {
                name: {
                    "en-US": contextType
                }
            }
        },
        context: context,
    }
}

module.exports = {
    turnIntoISODuration, responseBodyJSON
}