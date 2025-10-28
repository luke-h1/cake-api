/* eslint-disable no-console */
/* eslint-disable no-shadow */
/* eslint-disable no-case-declarations */
import cakeHandler from "@lambda/handlers/cake";

import { APIGatewayProxyEventQueryStringParameters } from "aws-lambda";

const routes = async (
  path: string,
  _queryParams: APIGatewayProxyEventQueryStringParameters | null,
  requestUrl: string
) => {
  let response: unknown;
  let statusCode: number;

  let headers: Record<string, string> = {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET,OPTIONS,POST,PUT,DELETE",
  };

  switch (path) {
    case "/api/cake": {
      statusCode = 200;
      response = cakeHandler();
      break;
    }

    default:
      response = JSON.stringify({ message: "route not found" }, null, 2);
      statusCode = 404;
      break;
  }
  return {
    statusCode,
    headers,
    body: response,
  };
};
export default routes;
