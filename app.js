//server Espresso che espone POST /Invoke
import express from "express";
import fs from "fs";
import * as grpc from "@grpc/grpc-js";
import { connect, signers } from "@hyperledger/fabric-gateway";
import crypto from "crypto";

const app = express();
app.use(express.json());

const channelName = "canale1v2";
const chaincodeName = "operationevent";
const mspId = "OrgDCMSMSP";
const peerEndpoint = "peer1.orgdcms.svc.cluster.local:7051";

const tlsRootCert = fs.readFileSync("/gateway/peer-tls.pem");
const cert = fs.readFileSync("/gateway/cert.pem");
const keyPem = fs.readFileSync("/gateway/key.pem");

const client = new grpc.Client(
  peerEndpoint,
  grpc.credentials.createSsl(tlsRootCert, null, null),
  {
    "grpc.ssl_target_name_override": "peer1.orgdcms.svc.cluster.local",
    "grpc.default_authority": "peer1.orgdcms.svc.cluster.local"
  }
);

const identity = { mspId, credentials: cert };
const privateKey = crypto.createPrivateKey(keyPem);
const signer = signers.newPrivateKeySigner(privateKey);

app.post("/invoke", async (req, res) => {
  try {
    const {
      operationEventId,
      operatorDid,
      operationType,
      timestamp,
      room,
      device,
      hash
    } = req.body;

    const gateway = connect({ client, identity, signer });
    const network = gateway.getNetwork(channelName);
    const contract = network.getContract(chaincodeName);

    const result = await contract.submitTransaction(
      "CreateOperationEvent",
      operationEventId,
      operatorDid,
      operationType,
      timestamp,
      room || "",
      device || "",
      hash
    );

    gateway.close();

    res.json({
      txId: `fabricTx-${Date.now()}`,
      result: Buffer.from(result).toString()
    });
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: String(e) });
  }
});

app.listen(3000, () => {
  console.log("fabric-gateway-test HTTP server on 3000");
});
