import fs from "fs";

import * as grpc from "@grpc/grpc-js";
import { connect, signers } from "@hyperledger/fabric-gateway";
import crypto from "crypto";


const channelName = "canale1v2";
const chaincodeName = "operationevent";
const mspId = "OrgDCMSMSP";

const peerEndpoint = "peer1.orgdcms.svc.cluster.local:7051";

const tlsRootCert = fs.readFileSync("peer-tls.pem");

const client = new grpc.Client(
  peerEndpoint,
  grpc.credentials.createSsl(tlsRootCert, null, null),
  {
    "grpc.ssl_target_name_override": "peer1.orgdcms.svc.cluster.local",
    "grpc.default_authority": "peer1.orgdcms.svc.cluster.local"
  }
);

const cert = fs.readFileSync("cert.pem");
const keyPem = fs.readFileSync("key.pem");

const identity = {
  mspId,
  credentials: cert,
};

const privateKey = crypto.createPrivateKey(keyPem);
const signer = signers.newPrivateKeySigner(privateKey);

async function main() {
  try {
    const operationEventId = "test-002";
    const operatorDid = "did:example:operator-003";
    const operationType = "DISINFECTION_START";
    const timestamp = new Date().toISOString();
    const room = "ICU-4";
    const device = "robot-23";
    const hash = "hash-test";

    const gateway = connect({
      client,
      identity,
      signer,
    });

    const network = gateway.getNetwork(channelName);
    const contract = network.getContract(chaincodeName);

    const result = await contract.submitTransaction(
      "CreateOperationEvent",
      operationEventId,
      operatorDid,
      operationType,
      timestamp,
      room,
      device,
      hash
    );

    console.log(JSON.parse(Buffer.from(result).toString()));

    gateway.close();

  } catch (error) {
    console.log("ERROR:");
    console.log(error);

    if (error.details) {
      console.log("DETAILS:");
      console.log(error.details);
    }
  }
}

main();


