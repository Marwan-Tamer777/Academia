const { v4: uuidv4 } = require('uuid');
const Statement = require('../models/Statement');
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
async function responseBodyJSON(status, requestedBy, verb, objectType, contextType, context, objectId) {
    const responseBody = {
        // _id: uuidv4(),
        timestamp: new Date().toISOString(),
        statusCode: status,
        actor: {
            name: "Server",
            id: "Server ID",
            requestBy: requestedBy,
        },
        verb: verb,
        object: {
            id: objectId,
            objectType: objectType,
            definition: {
                name: {
                    "en-US": contextType
                }
            }
        },
        context: context,
    }
    const { error } = Statement.validateCreateStatement(responseBody)
    if (error) {
        console.log("Statement Validation Error: ", error);
        throw error
    }
    const statement =  new Statement.statementModel(responseBody);
    await statement.save();
    return statement
}

module.exports = {
    turnIntoISODuration, responseBodyJSON
}