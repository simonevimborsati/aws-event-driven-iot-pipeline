const { DynamoDBClient } = require("@aws-sdk/client-dynamodb");
const { DynamoDBDocumentClient, PutCommand } = require("@aws-sdk/lib-dynamodb");

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

exports.handler = async (event) => {
    console.log("Evento ricevuto:", JSON.stringify(event, null, 2));

    const command = new PutCommand({
        TableName: process.env.DYNAMODB_TABLE,
        Item: {
            sensor_id: "sensor-01",
            timestamp: new Date().toISOString(),
            dati: event
        }
    });

    try {
        await docClient.send(command);
        console.log("Dato salvato con successo su DynamoDB!");

        return {
            statusCode: 200,
            body: JSON.stringify('Dato salvato correttamente nel database!'),
        };
    } catch (error) {
        console.error("Errore durante il salvataggio:", error);
        return {
            statusCode: 500,
            body: JSON.stringify(error.message),
        };
    }
};