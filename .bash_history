kubectl cp orgx/$(kubectl get pod -n orgx -l job-name=fabric-ca-orgx-init -o jsonpath='{.items[0].metadata.name}'):/etc/hyperledger/fabric-ca-server/ca-cert.pem /tmp/orgx_new_ca.pem
kubectl get secret fabric-ca-orgx-tls -n orgx
kubectl describe secret fabric-ca-orgx-tls -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx.yaml
kubectl get pods -n orgx
kubectl cp orgx/fabric-ca-orgx-7b7cf5684-9sfw5:/etc/hyperledger/fabric-ca-server/ca-cert.pem /tmp/orgx_new_ca.pem
openssl x509 -in /tmp/orgx_new_ca.pem -noout -fingerprint -sha256
mkdir -p /home/asantopadre/fabric-2.5/artifacts/orgx/ca
cp /tmp/orgx_new_ca.pem /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem
openssl x509 -in /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem -noout -fingerprint -sha256
export FABRIC_CA_CLIENT_HOME=~/ca-client-orgx
rm -rf ~/ca-client-orgx
mkdir -p ~/ca-client-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
openssl x509 -in ~/ca-client-orgx/msp/signcerts/cert.pem -noout -issuer -fingerprint -sha256
openssl verify   -CAfile /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem   ~/ca-client-orgx/msp/signcerts/cert.pem
mv /home/asantopadre/fabric-deploy/orgx/admin/msp    /home/asantopadre/fabric-deploy/orgx/admin/msp.bak_$(date +%Y%m%d_%H%M%S)
mkdir -p /home/asantopadre/fabric-deploy/orgx/admin
cp -a ~/ca-client-orgx/msp /home/asantopadre/fabric-deploy/orgx/admin/msp
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
mkdir -p ~/peer2-msp
fabric-ca-client enroll   -u https://peer2:peer2pw@localhost:7054   --mspdir ~/peer2-msp   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
openssl verify   -CAfile /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem   ~/peer2-msp/signcerts/cert.pem
kubectl delete deployment peer2 -n orgx
kubectl get pods -n orgx
kubectl delete deployment peer2 -n orgx
kubectl get pvc -n orgx
kubectl delete pvc peer2-orgx-msp-pvc -n orgx
kubectl patch pvc peer2-orgx-msp-pvc -n orgx   -p '{"metadata":{"finalizers":null}}'
kubectl get pvc -n orgx
kubectl apply -f peer2-msp-pvc.yaml
kubectl apply -f pvc-shell-peer2-msp.yaml
kubectl get pods -n orgx
kubectl delete pod pvc-shell-peer2-msp -n orgx
kubectl apply -f pvc-shell-peer2-msp.yaml
kubectl get pods -n orgx
kubectl cp ~/peer2-msp orgx/pvc-shell-peer2-msp:/msp
kubectl exec -n orgx pvc-shell-peer2-msp -- ls /msp
kubectl exec -n orgx pvc-shell-peer2-msp -- sh -c "
mv /msp/peer2-msp/* /msp/ &&
rmdir /msp/peer2-msp
"
kubectl exec -n orgx pvc-shell-peer2-msp -- ls /msp
kubectl delete pod pvc-shell-peer2-msp -n orgx
kubectl appy -f peer2.yaml
kubectl apply -f peer2.yaml
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl get pods -n orgx
kubectl delete deployment peer2 -n orgx
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx
kubectl patch pvc peer2-orgx-ledger-pvc -n orgx   -p '{"metadata":{"finalizers":null}}'
kubectl apply -f peer2-ledger-pvc.yaml
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl get pods -n orgx
kubectl logs -n orgx peer2-6fdd4f868d-mj9dv
kubectl apply -f pvc-shell-peer2-msp.yaml
kubectl exec -n orgx pvc-shell-peer2-msp -- ls /msp
cp ~/ca-client-orgx/msp/config.yaml ~/peer2-msp/
kubectl apply -f pvc-shell-peer2-msp.yaml
kubectl get pods -n orgx
kubectl cp ~/peer2-msp/config.yaml orgx/pvc-shell-peer2-msp:/msp/config.yaml
kubectl exec -n orgx pvc-shell-peer2-msp -- ls /msp
kubectl delete pod pvc-shell-peer2-msp -n orgx
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl get pods -n orgx
kubectl port-forward -n orgdcms deploy/peer1 7052:7051
kubectl port-forward -n orgdcms deploy/peer2 7052:7051
kubectl port-forward -n orgx deploy/peer2 7052:7051
kubectl port-forward -n orgdcms svc/orderer1 7050:7050
kubectl port-forward -n orgx svc/fabric-ca-orgx 7054:7054
kubectl port-forward -n orgdcms svc/orderer2 37052:7053
peer channel join -b canale1v2.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join -b canale1v2.block
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
rm -f /home/asantopadre/fabric-deploy/configtx/orgx/msp/cacerts/*.pem
cp /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem   /home/asantopadre/fabric-deploy/configtx/orgx/msp/cacerts/ca-orgx-root.pem
openssl x509 -in /home/asantopadre/fabric-deploy/configtx/orgx/msp/cacerts/ca-orgx-root.pem   -noout -fingerprint -sha256
rm -rf /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp
cp -a ~/peer2-msp /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp
kubectl get pods -n orgx | grep orderer3
kubectl cp orgx/orderer3-779964d48b-l2hsf:/var/hyperledger/orderer/msp/signcerts/cert.pem /tmp/orderer3_cert.pem
openssl x509 -in /tmp/orderer3_cert.pem -noout -issuer -fingerprint -sha256
openssl verify   -CAfile /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem   /tmp/orderer3_cert.pem
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=~/ca-client-orgx
ls ~/ca-client-orgx/msp/signcerts
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
mkdir -p ~/orderer3-msp
abric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7054   --mspdir ~/orderer3-msp   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7054   --mspdir ~/orderer3-msp   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
cp ~/ca-client-orgx/msp/config.yaml ~/orderer3-msp/
openssl verify   -CAfile /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem   ~/orderer3-msp/signcerts/cert.pem
kubectl delete deployment orderer3 -n orgx
kubectl delete pvc orderer3-msp-pvc -n orgx
kubectl patch pvc orderer3-msp-pvc -n orgx   -p '{"metadata":{"fi
nalizers":null}}'
kubectl patch pvc orderer3-msp-pvc -n orgx   -p '{"metadata":{"fi
nalizers":null}}'
kubectl patch pvc orderer3-msp-pvc -n orgx   -p '{"metadata":{"finalizers":null}}'
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer3-msp-pvc.yaml
kubectl apply -f ~/fabric-2.5/manifests/pvc-shell-orderer3-msp.yaml
kubectl get pods -n orgx 
kubectl cp ~/orderer3-msp orgx/pvc-shell-orderer3-msp:/msp
kubectl exec -n orgx pvc-shell-orderer3-msp -- sh -c "
mv /msp/orderer3-msp/* /msp/ &&
rmdir /msp/orderer3-msp
"
kubectl exec -n orgx pvc-shell-orderer3-msp -- ls /msp
kubectl delete pod pvc-shell-orderer3-msp -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer3.yaml
kubectl get pods -n orgx
kubectl cp orgx/orderer3-779964d48b-8zlgr:/var/hyperledger/orderer/msp/signcerts/cert.pem /tmp/orderer3_new.pem
openssl verify   -CAfile /home/asantopadre/fabric-2.5/artifacts/orgx/ca/ca-orgx-root.pem   /tmp/orderer3_new.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block
configtxlator proto_decode --input canale1v2.block --type common.Block > block.json
jq -r '.data.data[0].payload.data.config' block.json > config.json
configtxlator proto_decode --input canale1v2.block --type common.Block > block.json
jq -r '.data.data[0].payload.data.config' block.json > config.json
jq -r '
  .channel_group.groups.Application.groups
  | keys[] as $org
  | "\($org) MSPID=" + (.[$org].values.MSP.value.config.name)
' config.json
jq -r '
  .channel_group.groups.Application.groups.OrgXMSP.values.MSP.value.config.root_certs[0]
' config.json > orgx_root.pem
jq -r '.channel_group.groups.Application.groups | keys[]' config.json
jq -r '
  .channel_group.groups.Application.groups.OrgX.values.MSP.value.config.root_certs[0]
' config.json > orgx_root.pem
jq -r '
  .channel_group.groups.Application.groups.OrgX.values.MSP.value.config.tls_root_certs[0]
' config.json > orgx_tls_root.pem
jq -r '.channel_group.groups.Application.groups.OrgX.values.MSP.value.config.tls_root_certs | length' config.json
cd ~/fabric-deploy/channels
jq -r '.channel_group.groups.Application.groups.OrgX.values.MSP.value.config.tls_root_certs | length' config.json
ls -l /home/asantopadre/fabric-deploy/configtx/orgx/msp/tlscacerts
# set paths
ORGDCMS=/home/asantopadre/fabric-deploy/configtx/orgdcms/msp
ORGX=/home/asantopadre/fabric-deploy/configtx/orgx/msp
# 1) struttura minima attesa + conteggio PEM
for D in "$ORGDCMS" "$ORGX"; do   echo "==== $D ====";   for sub in cacerts tlscacerts signcerts keystore; do     echo "-- $sub";     ls -la "$D/$sub" 2>/dev/null || echo "MISSING $sub";     echo "pem_count=$(find "$D/$sub" -maxdepth 1 -type f \( -name '*.pem' -o -name '*.crt' \) 2>/dev/null | wc -l)";   done;   echo "-- config.yaml";   ls -la "$D/config.yaml" 2>/dev/null || echo "MISSING config.yaml";   echo; done
mkdir -p /home/asantopadre/fabric-deploy/configtx/orgx/msp/tlscacerts
cd ~/
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block
cd /home/asantopadre/fabric-deploy/channels
configtxlator proto_decode --input canale1v2.block --type common.Block > block.json
jq -r '.data.data[0].payload.data.config' block.json > config.json
jq '.channel_group.groups.Application.groups.OrgX.values.MSP.value.config.tls_root_certs | length' config.json
kubectl delete pod peer1 -n orgdcms
kubectl delete pod peer2 -n orgx
kubectl delete pod orderer1 -n orgdcms
kubectl delete pod orderer2 -n orgdcms
kubectl delete pod orderer3 -n orgx
kubectl get pod -A
kubectl delete pod orderer1-c7c76b9c6-xqrsm -n orgdcms
kubectl delete pod orderer2-68c4c7d6dc-mj8mc -n orgdcms
kubectl delete pod peer1-7d74d89c46-lp5bc -n orgdcms
kubectl delete pod orderer3-779964d48b-8zlgr -n orgx
kubectl delete pod peer2-6fdd4f868d-mj9dv -n orgx
kubectl get pod -n orgdcms
kubectl get pod -n orgx
kubectl get pvc -A
kubectl delete pvc orderer1-ledger-pvc -n orgdcms
kubectl delete pvc orderer2-ledger-pvc -n orgdcms
kubectl delete pvc peer1-orgdcms-ledger-pvc -n orgdcms
kubectl delete pvc orderer3-ledger-pvc -n orgx
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx
kubectl scale deploy orderer1 -n orgdcms --replicas=0
kubectl scale deploy orderer2 -n orgdcms --replicas=0
kubectl scale deploy peer1 -n orgdcms --replicas=0
kubectl scale deploy orderer3 -n orgx --replicas=0
kubectl scale deploy peer2 -n orgx --replicas=0
kubectl delete pvc orderer1-ledger-pvc -n orgdcms
kubectl delete pvc orderer2-ledger-pvc -n orgdcms
kubectl delete pvc peer1-orgdcms-ledger-pvc -n orgdcms
kubectl delete pvc orderer3-ledger-pvc -n orgx
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx
kubectl get deploy -A.
kubectl get deploy -A
kubectl get pvc -n orgx
kubectl get pv
kubectl get pvc -A
kubectl get pvc orderer1-ledger-pvc -n orgdcms -o jsonpath='{.metadata.finalizers}{"\n"}'
kubectl get pvc orderer2-ledger-pvc -n orgdcms -o jsonpath='{.metadata.finalizers}{"\n"}'
kubectl get pvc peer2-orgx-ledger-pvc -n orgx    -o jsonpath='{.metadata.finalizers}{"\n"}'
kubectl patch pvc orderer1-ledger-pvc -n orgdcms -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc orderer2-ledger-pvc -n orgdcms -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc peer2-orgx-ledger-pvc -n orgx -p '{"metadata":{"finalizers":null}}'
kubectl delete pvc orderer1-ledger-pvc -n orgdcms --wait=false
kubectl delete pvc orderer2-ledger-pvc -n orgdcms --wait=false
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx --wait=false
kubectl scale deploy orderer1 -n orgdcms --replicas=1
kubectl scale deploy orderer2 -n orgdcms --replicas=1
kubectl scale deploy orderer3 -n orgx --replicas=1
kubectl get pods -A
kubectl get pvc -A
kubectl get deploy orderer1 -n orgdcms -o yaml | grep claimName -A2
kubectl get deploy orderer2 -n orgdcms -o yaml | grep claimName -A2
kubectl get deploy orderer3 -n orgx -o yaml | grep claimName -A2
kubectl get statefulset -A
cd ~/
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer1-pvc.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer2-pvc.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer3-pvc.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/peer1-pvc.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/peer2-pvc.yaml
kubectl get pvc -A
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel list   --orderer-address localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37052 \
osnadmin channel list   --orderer-address localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
Status: 201
osnadmin channel list   --orderer-address localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl scale deploy peer1 -n orgdcms --replicas=1
kubectl scale deploy peer2 -n orgx --replicas=1
kubectl get pods -n orgdcms
kubectl get pods -n orgx
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
kubectl port-forward -n orgx deploy/peer2 7052:7051
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
echo $CORE_PEER_MSPCONFIGPATH
cat /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/*.pem | grep OU
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/*.pem -text -noout | grep "Subject:"
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/*.pem -text -noout | grep "Organizational Unit"
fabric-ca-client identity list   --id orgx-admin   --tls.certfiles /home/asantopadre/fabric-deploy/tls-ca-cert.pem
fabric-ca-client identity list   --id orgx-admin   --tls.certfiles /home/asantopadre/fabric-deploy/configtx/orgdcms/msp/tlscacerts/tls-ca-cert.pem
kubectl get pods -n orgx | grep fabric-ca-orgx
kubectl cp orgx/fabric-ca-orgx-7b7cf5684-9sfw5:/etc/hyperledger/fabric-ca-server-config/ca-cert.pem /home/asantopadre/ca-orgx-tls-ca.pem
kubectl exec -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- ls /etc/hyperledger/fabric-ca-server-config
kubectl cp orgx/fabric-ca-orgx-7b7cf5684-9sfw5:/etc/hyperledger/fabric-ca-server-config/ca-cert.pem /home/asantopadre/ca-orgx-tls-ca.pem
kubectl exec -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- ls -R /etc/hyperledger
kubectl cp orgx/fabric-ca-orgx-7b7cf5684-9sfw5:/etc/hyperledger/fabric-ca-server/tls/cert.pem /home/asantopadre/ca-orgx-tls-ca.pem
kubectl exec -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- cat /etc/hyperledger/fabric-ca-server/tls/cert.pem > /home/asantopadre/ca-orgx-tls-ca.pem
kubectl exec -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- cat /etc/hyperledger/fabric-ca-server/tls/cert.pem > /home/asantopadre/ca-orgx-tls-ca.pem
ls -l /home/asantopadre/ca-orgx-tls-ca.pem
fabric-ca-client identity list   --id orgx-admin   --tls.certfiles /home/asantopadre/ca-client-orgdcms/msp/tlscacerts/tls-ca-cert.pem
fabric-ca-client identity list   --id orgx-admin   --tls.certfiles /home/asantopadre/ca-orgx-tls-ca.pem
fabric-ca-client identity list --tls.certfiles /home/asantopadre/ca-orgx-tls-ca.pem
fabric-ca-client identity list --tls.certfiles /home/asantopadre/ca-client-orgdcms/msp/tlscacerts/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/ca-client-orgx
fabric-ca-client register   --id.name orgx-admin   --id.secret orgxadminpw   --id.type admin   --tls.certfiles /home/asantopadre/ca-client-orgdcms/msp/tlscacerts/tls-ca-cert.pem
rm -rf /home/asantopadre/fabric-deploy/orgx/admin/msp/*
fabric-ca-client enroll   -u https://orgx-admin:orgxadminpw@localhost:7054   -M /home/asantopadre/fabric-deploy/orgx/admin/msp   --tls.certfiles /home/asantopadre/ca-client-orgdcms/msp/tlscacerts/tls-ca-cert.pem
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/*.pem -text -noout | grep "OU ="
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel list
peer channel getinfo -c canale1v2
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel getinfo -c canale1v2
peer lifecycle chaincode querycommitted -C canale1v2
kubectl port-forward -n orgx deploy/peer2 7052:7051
kubectl port-forward -n orgx svc/orderer3 37053:7053
free -h
cd ~/fabric-deploy
mkdir -p chaincodes/basicnode
cd chaincodes/basicnode
sudo mkdir -p /opt/hyperledger/ccaas/basicnode
sudo chown -R $USER:$USER /opt/hyperledger/ccaas
echo %USER
echo $USER
tree 
sudo apt install nerdctl
cd ~/
VERSION=1.7.6
wget https://github.com/containerd/nerdctl/releases/download/v${VERSION}/nerdctl-${VERSION}-linux-amd64.tar.gz
sudo tar Cxzvf /usr/local/bin nerdctl-${VERSION}-linux-amd64.tar.gz
nerdctl --version
ls
cd ~/fabric-deploy/chaincodes/basicnode
ls -l
nerdctl build -t basicnode:1.0 .
sudo nerdctl build -t basicnode:1.0 .
sudo apt update
sudo apt install buildkit -y
VERSION=v0.13.2
wget https://github.com/moby/buildkit/releases/download/${VERSION}/buildkit-${VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzvf buildkit-${VERSION}.linux-amd64.tar.gz
which buildctl
which buildkitd
sudo buildkitd &
sudo nerdctl build -t basicnode:1.0 .
sudo nerdctl --namespace k8s.io load < <(sudo nerdctl save basicnode:1.0)
sudo nerdctl --namespace k8s.io images
kubectl get pods -n orgdcms
kubectl delete pod basic-ccaas-74fb65598b-k8f52
kubectl delete basic-ccaas-74fb65598b-k8f52
kubectl get pods -n orgdcms
kubectl delete deployment basicnode -n orgdcms
kubectl delete service basicnode -n orgdcms
kubectl delete pod basic-ccaas-74fb65598b-k8f52 -n orgdcms
kubectl get all -n orgdcms | grep basicnode
kubectl apply -f basicnode-deployment.yaml
cd ~/
kubectl apply -f basicnode-deployment.yaml
kubectl get pods -n orgdcms
kubectl delete deployment basicnode -n orgdcms
kubectl delete service basicnode -n orgdcms
kubectl delete deployment basic-ccaas -n orgdcms
kubectl delete service basic-ccaas -n orgdcms
kubectl get deployments -n orgdcms
kubectl get pods -n orgdcms | grep basic
crictl images | grep basicnode
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
sudo nerdctl save basicnode:1.0 -o basicnode.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
ps aux | grep containerd | grep k3s
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import basicnode.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
kubectl apply -f basicnode-deployment.yaml
kubectl get pods -n orgdcms
kubectl logs -n orgdcms basicnode-7db6448874-rd74k
cd ~/fabric-deploy/chaincodes/basicnode
sudo nerdctl build -t basicnode:1.0 .
sudo nerdctl save basicnode:1.0 -o basicnode.tar
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import basicnode.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
cd ~/
kubectl rollout restart deployment basicnode -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n basicnode-574c8f5c85-xhk84
kubectl logs -n ORGDCMS basicnode-574c8f5c85-xhk84
cd ~/fabric-deploy/chaincodes/basicnode
sudo nerdctl build -t basicnode:1.0 .
sudo nerdctl save basicnode:1.0 -o basicnode.tar
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import basicnode.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
cd ~/
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f basicnode-deployment.yaml
kubectl rollout restart deployment basicnode -n orgdcms
kubectl get pods -n orgdcms | grep basicnode
kubectl logs -n orgdcms basicnode-6b6f77c9fb-fwdv2
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgx -it fabric-tools -- bash
ls -R /home/asantopadre/fabric-deploy/orgx/admin/msp
kubectl delete pod fabric-tools -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgx.yaml
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get pods -n orgdcms | grep basicnode
kubectl logs -n orgdcms basicnode-6b6f77c9fb-fwdv2
kubectl get svc -n orgdcms | grep basicnode
kubectl get deploy basicnode -n orgdcms -o yaml | grep CORE_CHAINCODE_ID -A2
kubectl exec -n orgx -it fabric-tools -- bash
kubectl apply -f basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl get svc -n orgx | grep basicnode
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgx basicnode-745f4b8d45-jn62z
kubectl get pods -n orgdcms

kubectl logs -n orgdcms peer1-7d74d89c46-59227 | tail -50
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
sudo kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
sudo -i
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp orgdcms/fabric-tools:/tmp/basic.tar.gz ./basic.tar.gz
ls -l basic.tar.gz
kubectl cp ./basic.tar.gz orgx/fabric-tools:/tmp/basic.tar.gz
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f basicnode-deployment-orgdcms.yaml
kubectl apply -f basicnode-deployment-orgx.yaml
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms peer1-7d74d89c46-59227 | tail -50
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms orderer1-c7c76b9c6-bwwqr | grep -E "Raft leader|became leader|is leader" | tail -20
kubectl logs -n orgdcms orderer2-68c4c7d6dc-bvcf7 | grep -E "Raft leader|became leader|is leader" | tail -20
kubectl get pods -n orgx
kubectl logs -n orgx orderer3-779964d48b-xzk8b | grep -E "Raft leader|became leader|is leader" | tail -20
kubectl logs -n orgdcms orderer1-c7c76b9c6-bwwqr | grep -E "Raft leader|became leader|is leader" | tail -50
kubectl logs -n orgdcms orderer1-c7c76b9c6-bwwqr | grep -i 85c30484 | tail -50
kubectl logs -n orgdcms orderer2-68c4c7d6dc-bvcf7 | grep -i 85c30484 | tail -50
kubectl logs -n orgx   orderer3-779964d48b-8zlgr | grep -i 85c30484 | tail -50
kubectl logs -n orgdcms orderer2-68c4c7d6dc-bvcf7 | grep -i 85c30484 | tail -200
kubectl logs -n orgdcms orderer2-68c4c7d6dc-bvcf7 | grep -i 85c30484 | tail -400
kubectl logs -n orgx   orderer3-779964d48b-xzk8b | grep -i 85c30484 | tail -400
kubectl exec -n orgdcms -it fabric-tools -- bash
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/ca-cert.pem -text -noout | grep -E "Subject:|Issuer:|Serial"
kubectl exec -it -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- sh
ls /mnt
kubectl describe pod -n orgx fabric-ca-orgx-7b7cf5684-9sfw5
kubectl exec -it -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- sh
kubectl cp   orgx/fabric-ca-orgx-7b7cf5684-9sfw5:/etc/hyperledger/fabric-ca-server/ca-cert.pem   ./orgx_ca_runtime.pem
openssl x509 -in orgx_ca_runtime.pem -text -noout | grep -E "Serial|Subject"
openssl x509 -in orgx_channel_root.pem -noout -fingerprint -sha256
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
openssl x509 -in orgx_ca_runtime.pem -noout -fingerprint -sha256
jq '.data.data[0].payload.data.config.channel_group.groups.Application.policies.LifecycleEndorsement' config_block.json
jq '.data.data[0].payload.data.config.channel_group.groups.Application.policies.Endorsement' config_block.json
jq '.data.data[0].payload.data.config.channel_group.policies' config_block.json
jq '.data.data[0].payload.data.config.channel_group.groups.Application.policies' config_block.json
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp orgdcms/fabric-tools:/config_update_envelope.pb .
kubectl cp orgdcms/fabric-tools:/config_update_envelope.pb ./config_update_envelope.pb
ls -l config_update_envelope.pb
kubectl cp config_update_envelope.pb orgx/fabric-tools:/config_update_envelope.pb
kubectl exec -n orgx -it fabric-tools -- bash
kubectl cp orgx/fabric-tools:/config_update_envelope.pb .
kubectl cp config_update_envelope.pb orgdcms/fabric-tools:/config_update_envelope.pb
kubectl cp orgx/fabric-tools:/config_update_envelope.pb /home/asantopadre/config_update_envelope.pb
ls -l /home/asantopadre/config_update_envelope.pb
kubectl cp /home/asantopadre/config_update_envelope.pb orgdcms/fabric-tools:/config_update_envelope.pb
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms orderer1-c7c76b9c6-bwwqr | tail -50
kubectl logs -n orgdcms orderer2-68c4c7d6dc-bvcf7 | tail -50
kubectl get pods -n orgx
kubectl logs -n orgdcms orderer3-779964d48b-xzk8b | tail -50
kubectl logs -n orgx orderer3-779964d48b-xzk8b | tail -50
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get pods -A | grep basic
kubectl logs -n orgdcms basicnode-95b84db5c-z5998
kubectl logs -n orgx basicnode-6b98d54cf9-vjrfd
kubectl exec -n orgdcms -it fabric-tools -- bash
exit
kubectl logs -n orgdcms <nome-peer1-pod>peer1-7d74d89c46-59227
kubectl get pods -n orgdcms
kubectl logs -n orgdcms peer1-7d74d89c46-59227
kubectl get svc -n orgdcms
kubectl describe svc basicnode -n orgdcms
kubectl describe pod basicnode-95b84db5c-z5998 -n orgdcms
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get svc -n orgx
kubectl get pods -n orgx
kubectl exec -n orgdcms -it peer2-6fdd4f868d-hf8jl -- bash
kubectl exec -n orgx -it peer2-6fdd4f868d-hf8jl -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms basicnode-95b84db5c-z5998
kubectl rollout restart deployment basicnode -n orgdcms
kubectl rollout restart deployment basicnode -n orgx
kubectl get pods -n orgx
kubectl logs -n orgdcms basicnode-57fb6654d4-ztwtn
kubectl logs -n orgx basicnode-57fb6654d4-ztwtn
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl rollout restart deployment basicnode -n orgdcms
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-basicnode-c7fdd659-kqkjq
kubectl logs -n orgx basicnode-c7fdd659-kqkjq
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl logs -n orgx basicnode-c7fdd659-kqkjq
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-57fb6654d4-vsr8x
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it peer1-7d74d89c46-59227 -- bash
kubectl run debug-dcms   -n orgdcms   --image=busybox   -it --rm -- sh
kubectl run debug-orgx   -n orgx   --image=busybox   -it --rm -- sh
kubectl get svc basicnode -n orgdcms -o yaml
kubectl delete deployment basicnode -n orgdcms
kubectl delete deployment basicnode -n orgx
kubectl rollout restart deployment peer1 -n orgdcms
kubectl rollout restart deployment peer2 -n orgx
peer lifecycle chaincode querycommitted -C canale1v2 -n basicnode
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs -n orgdcms basicnode-6b98d54cf9-9hnmp
kubectl logs -n orgx basicnode-6b98d54cf9-2lcv7
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms peer1-cd6d87d7d-pf4hq
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl scale deployment peer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl get pods -n orgx
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pods -n orgx
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgx basicnode-57fb6654d4-vsr8x
kubectl logs -n orgx basicnode-6b98d54cf9-2lcv7
kubectl get pods -n orgdcms

kubectl logs -n orgdcms peer1-cd6d87d7d-9mblg
kubectl -n orgx set env deploy/basicnode   CHAINCODE_SERVER_ADDRESS="0.0.0.0:9999"   CHAINCODE_ID="basic_1.0:3681143caa30992f62a501431c28f7f93281faf9bf7997c816c263cfea28c04c" 
kubectl -n orgx set env deploy/basicnode   CORE_CHAINCODE_ADDRESS- CORE_CHAINCODE_ID-
kubectl -n orgx set env deploy/basicnode   CHAINCODE_SERVER_ADDRESS="0.0.0.0:9999"   CHAINCODE_ID="basic_1.0:3681143caa30992f62a501431c28f7f93281faf9bf7997c816c263cfea28c04c"
kubectl -n orgx set env deploy/basicnode   CORE_CHAINCODE_ADDRESS- CORE_CHAINCODE_ID-
kubectl -n orgdcms rollout restart deploy/basicnode
kubectl -n orgx rollout restart deploy/basicnode
kubectl -n orgdcms logs -l app=basicnode --tail=50
kubectl -n orgx logs -l app=basicnode --tail=50
kubectl -n orgdcms logs -l app=basicnode --tail=50
kubectl exec -n orgx -it $(kubectl get pod -n orgx -l app=basicnode -o jsonpath='{.items[0].metadata.name}') -- sh
kubectl get pod -n orgx
kubectl exec -n orgx -it peer2-668b6868dd-ftjcr-- sh
kubectl exec -n orgx -it peer2-668b6868dd-ftjcr -- sh
kubectl exec -n orgx -it basicnode-75fdc5d77b-j69tt -- sh
kubectl get pods -n orgdcms
kubectl delete deploy basicnode -n orgdcms
kubectl delete deploy basicnode -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
ctr -n k8s.io images list | grep basicnode
sudo ctr -n k8s.io images list | grep basicnode
sudo k3s ctr run --rm -t docker.io/library/basicnode:1.0 testbasic sh
kubectl get deploy -n orgdcms
kubectl get deploy -n orgx
kubectl get svc -n orgdcms
kubectl get svc -n orgx
kubectl delete deploy basicnode -n orgdcms
kubectl delete svc basicnode -n orgdcms
kubectl delete deploy basicnode -n orgx
kubectl delete svc basicnode -n orgx
kubectl get deploy -n orgdcms
kubectl get deploy -n orgx
kubectl delete svc basicnode -n orgdcms
kubectl delete svc basicnode -n orgx
kubectl get deploy -n orgdcms
kubectl get deploy -n orgx
kubectl get svc -n orgdcms
kubectl get svc -n orgx
kubectl get apply /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs basicnode-6d5bfdf99f-g8gb6 -n orgdcms --previous
kubectl describe pod basicnode-6d5bfdf99f-g8gb6 -n orgdcms
kubectl describe pod basicnode-6d5bfdf99f-chcnn -n orgx
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get svc -n orgdcms peer1 -o yaml
kubectl get svc -n orgx peer2 -o yaml
kubectl exec -n orgdcms -it deploy/peer1 -- sh
kubectl exec -n orgdcms -it deploy/basicnode -- sh
kubectl exec -n orgdcms -it deploy/peer1 -- sh
kubectl describe pod basicnode-6d5bfdf99f-g8gb6 -n orgdcms
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl describe pod  - n orgdcms basicnode-5699845f94-v26p8
kubectl describe pod  -n orgdcms basicnode-5699845f94-v26p8
kubectl rollout restart deploy/basicnode -n orgx
kubectl get pods -n orgdcms
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl get svc -n orgdcms basicnode
kubectl get svc -n orgx basicnode
kubectl exec -n orgdcms -it deploy/peer1 -- sh
kubectl run testbox -n orgdcms --rm -it --image=busybox -- sh
kubectl exec -n orgdcms -it peer1-cd6d87d7d-9mblg -- sh
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl -n orgdcms set env deploy/peer1 CORE_CHAINCODE_TLS_ENABLED=false
kubectl -n orgx set env deploy/peer2 CORE_CHAINCODE_TLS_ENABLED=false
kubectl rollout restart deploy/peer1 -n orgdcms
kubectl rollout restart deploy/peer2 -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl scale deploy/peer1 -n orgdcms --replicas=0
kubectl scale deploy/peer2 -n orgx --replicas=0
kubectl -n orgdcms set env deploy/peer1 CORE_CHAINCODE_TLS_ENABLED=false
kubectl -n orgx set env deploy/peer2 CORE_CHAINCODE_TLS_ENABLED=false
kubectl scale deploy/peer1 -n orgdcms --replicas=1
kubectl scale deploy/peer2 -n orgx --replicas=1
kubectl describe deploy peer1 -n orgdcms | grep CORE_CHAINCODE_TLS_ENABLED
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl logs -n orgdcms deploy/peer1 --tail=100
kubectl logs -n orgdcms deploy/peer2 --tail=100
kubectl logs -n orgx deploy/peer2 --tail=100
kubectl exec -n orgdcms -it deploy/peer1 -- sh -c "ls /etc/hyperledger/fabric/tlscacerts"
kubectl exec -n orgx -it deploy/peer2 -- sh -c '
echo "== peer2 TLS rootcert ==";
grep -n "rootcert" -n /etc/hyperledger/fabric/core.yaml 2>/dev/null || true;
echo;
echo "== files under /var/hyperledger/peer/tls ==";
ls -l /var/hyperledger/peer/tls;
echo;
echo "== content of /var/hyperledger/peer/tls/ca.crt (fingerprint) ==";
openssl x509 -in /var/hyperledger/peer/tls/ca.crt -noout -subject -issuer -fingerprint -sha256 2>/dev/null || echo "no openssl in peer2 container";
echo;
echo "== any configured clientRootCAs in runtime dump (if present in logs) ==";
'
kubectl cp orgx/$(kubectl get pod -n orgx -l app=peer2 -o jsonpath='{.items[0].metadata.name}'):/var/hyperledger/peer/tls/ca.crt ./peer2_ca.crt
openssl x509 -in peer2_ca.crt -noout -subject -issuer -fingerprint -sha256
kubectl cp orgdcms/$(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath='{.items[0].metadata.name}'):/var/hyperledger/peer/tls/ca.crt ./peer1_ca.crt
openssl x509 -in peer1_ca.crt -noout -subject -issuer -fingerprint -sha256
kubectl exec -n orgdcms -it deploy/peer1 -- sh -c "grep -R \"BEGIN CERTIFICATE\" -n /etc/hyperledger/fabric"
kubectl exec -n orgdcms -it deploy/peer1 -- sh -c "ls -R /etc/hyperledger/fabric | grep crt"

kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgdcms deploy/peer1 --   cat /var/hyperledger/fabric/tls/ca.crt | openssl x509 -noout -issuer -subject
cat: /var/hyperledger/fabric/tls/ca.crt: No such file or directory
command terminated with exit code 1
Could not read certificate from <stdin>
Unable to load certificate
kubectl exec -n orgdcms deploy/peer1 -- ls /var/hyperledger
kubectl exec -n orgdcms deploy/peer1 -- ls /var/hyperledger/fabric
kubectl exec -n orgdcms deploy/peer1 -- ls /var/hyperledger/peer/tls
kubectl exec -n orgdcms deploy/peer1 --   cat /var/hyperledger/peer/tls/ca.crt | openssl x509 -noout -issuer -subject
kubectl exec -n orgx deploy/peer2 --   cat /var/hyperledger/peer/tls/ca.crt | openssl x509 -noout -issuer -subject
openssl x509 -in cert.pem -text -noout | grep -A3 "X509v3 Basic Constraints"
kubectl cp orgx/peer2-xxxx:/var/hyperledger/fabric/tls/ca.crt ./peer2-tls-ca.crt
kubectl cp orgx/peer2:/var/hyperledger/fabric/tls/ca.crt ./peer2-tls-ca.crt
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl cp orgx/peer2-688f7645b6-9df82:/var/hyperledger/fabric/tls/ca.crt ./peer2-tls-ca.crt
kubectl exec -it -n orgx peer2-688f7645b6-9df82 -- sh
kubectl cp orgx/peer2-688f7645b6-9df82:/var/hyperledger/peer/tls/ca.crt ./peer2-tls-ca.crt
openssl x509 -in peer2-tls-ca.crt -text -noout | grep -A4 "Extended Key Usage"
openssl x509 -in peer2-tls-ca.crt -text -noout | grep "CA:TRUE"
kubectl cp orgx/peer2-688f7645b6-9df82:/var/hyperledger/peer/tls/server.crt ./peer2-server.crt
openssl x509 -in peer2-server.crt -text -noout | grep -E "Issuer:|Subject:"
openssl x509 -in peer2-server.crt -text -noout | grep -A2 "Extended Key Usage"
openssl verify -CAfile peer2-tls-ca.crt peer2-server.crt
kubectl exec -it -n orgdcms peer1-6f64688f85-xsptn -- sh
kubectl cp orgdcms/peer1-6f64688f85-xsptn:/var/hyperledger/peer/tls/ca.crt ./peer1-tls-ca.crt
openssl x509 -in peer1-tls-ca.crt -noout -fingerprint -sha256
openssl x509 -in peer2-tls-ca.crt -noout -fingerprint -sha256
C8:CD:7C:D2:62:64:FB:6C:4E:CF:32:BB:71:5B:9E:69:E0:4C:48:03:BF:9D:17:E4:9B:12:64:B5:EC:6C:2A:EC
openssl x509 -in peer2-tls-ca.crt -noout -fingerprint -sha256
sha256 Fingerprint=6C:E7:C1:A7:C3:4A:75:6C:32:31:EA:CC:C6:9D:14:3E:CC:20:6C:70:91:7B:A0:0B:ED:13:3D:0D:8B:E5:CD:1A
openssl x509 -in peer1-tls-ca.crt -noout -fingerprint -sha256
kubectl cp orgx/peer2-688f7645b6-9df82:/var/hyperledger/peer/tls/server.crt ./peer2-server.crt
kubectl cp orgdcms/peer1-6f64688f85-xsptn:/var/hyperledger/peer/tls/server.crt ./peer1-server.crt
openssl x509 -in peer1-server.crt -noout -issuer -subject
openssl verify -CAfile peer1-tls-ca.crt peer1-server.crt
kubectl exec -it -n orgdcms fabric-tls-ca-666c69bb4d-f6b7r -- sh
kubectl cp orgdcms/fabric-tls-ca-666c69bb4d-f6b7r:/etc/hyperledger/fabric-ca-server/ca-cert.pem ./official-tls-root.crt
openssl x509 -in official-tls-root.crt -noout -fingerprint -sha256
sha256 Fingerprint=D0:A7:90:6C:35:40:23:18:BB:26:44:90:63:10:39:C3:EB:52:04:06:E4:01:AE:F8:52:65:C6:F9:F3:D4:E6:35
kubectl exec -n orgdcms deploy/peer1 -- grep -A5 clientRootCAs /etc/hyperledger/fabric/core.yaml
kubectl exec -n orgx deploy/peer2 -- grep -A5 clientRootCAs /etc/hyperledger/fabric/core.yaml
kubectl exec -n orgx deploy/peer2 -- cat /var/hyperledger/peer/tls/ca.crt > peer2-tls-root.pem
kubectl exec -n orgx deploy/peer2 -- cat /var/hyperledger/peer/tls/ca.crt > orgx-root.crt
kubectl exec -n orgx deploy/peer2 -- cat /var/hyperledger/peer/tls/ca.crt > peer2-tls-ca.crt
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl cp peer2-tls-ca.crt orgdcms/peer1-6f64688f85-xsptn:/var/hyperledger/peer/tls/trusted/peer2-tls-ca.crt
kubectl exec -n orgdcms peer1-6f64688f85-xsptn -- mkdir -p /var/hyperledger/peer/tls/trusted
kubectl apply -f job-tls-peer1.yaml
kubectl logs job/tls-fix-peer1 -n orgdcms
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl scale deployment peer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl exec -n orgdcms peer1-59ffc6d6cd-pxrcj -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS_FILES
kubectl exec -n orgdcms peer1-59ffc6d6cd-pxrcj -- ls /var/hyperledger/peer/tls/trusted
kubectl exec -n orgdcms deploy/peer1 -- cat /var/hyperledger/peer/tls/ca.crt > peer1-tls-ca.crt
kubectl apply -f job-tls-peer2.yaml
kubectl logs job/tls-fix-peer2 -n orgx
kubectl get jobs -n orgx
kubectl logs job/tls-fix-peer2 -n orgx
kubectl apply -f job-tls-peer2.yaml
kubectl logs job/tls-fix-peer2 -n orgx
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pods -n orgx
kubectl exec -n orgx peer2-69dd49cfcb-6mpb4 -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS_FILES
kubectl exec -n orgx peer2-69dd49cfcb-6mpb4 -- ls /var/hyperledger/peer/tls/trusted
kubectl exec -n orgdcms peer1-59ffc6d6cd-pxrcj -- sh
kubectl exec -n orgdcms peer1-59ffc6d6cd-pxrcj --sh
kubectl exec -n orgdcms -it peer1-59ffc6d6cd-pxrcj -- sh
kubectl exec -n orgdcms -it fabric-tool -- sh
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgdcms peer1-59ffc6d6cd-pxrcj -- sh -c "cat /var/hyperledger/peer/tls/ca.crt \
/var/hyperledger/peer/tls/trusted/peer2-tls-ca.crt \
> /var/hyperledger/peer/tls/ca-bundle.crt"
kubectl scale deploy peer1 -n orgdcms --replicas=0
kubectl apply -f job-bundle-peer1.yaml
kubectl logs job/bundle-peer1 -n orgdcms
kubectl apply -f peer1-deployment.yaml
kubectl exec -n orgdcms <nuovo-pod> -- printenv | grep CORE_PEER_TLS_ROOTCERT_FILE
kubectl get pods -n orgdcms
kubectl exec -n orgdcms peer1-5f65d674f-vwmql -- printenv | grep CORE_PEER_TLS_ROOTCERT_FILE
kubectl scale deploy peer2 -n orgx --replicas=0
kubectl apply -f job-bundle-peer2.yaml
kubectl logs job/bundle-peer2 -n orgx
kubectl apply -f peer2-deployment.yaml
kubectl get pods -n orgx
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-6f9b9b7676-8s2xc
kubectl exec -n orgx basicnode-6f9b9b7676-8s2xc -- printenv | grep CHAINCODE
kubectl rollout restart deploy basicnode -n orgx
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-549d7d596b-b7cgv
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl logs -n orgx basicnode-5bcb479f64-cgpsn
kubectl get pods -n orgx
kubectl logs -n orgdcms basicnode-5bcb479f64-cgpsn
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-6f55c6f96b-g4v52
kubectl exec -n orgx basicnode-<pod> -- printenv
kubectl exec -n orgx basicnode-6f55c6f96b-g4v52 --printenv
kubectl exec -n orgx basicnode-6f55c6f96b-g4v52 -- printenv
kubectl rollout restart deploy basicnode -n orgx
kubectl get pods -n orgx
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-basicnode-6f67b5fbf7-4hwbt
kubectl logs -n orgx basicnode-6f67b5fbf7-4hwbt
kubectl rollout restart deploy basicnode -n orgx
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-679f85478d-6wbfx
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-69fd469fd7-cc6ql
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-857876bc59-whxqt
kubectl apply -f /home/asantopadre/basicnode-deployment-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx basicnode-66699bbcbb-cj8dl

kubectl get pods -n orgdcms
kubectl logs -n orgdcms basicnode-64d9755f86-krxcs
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgx peer2-5f97cfc68f-lsl4f --sh
kubectl exec -n orgx peer2-5f97cfc68f-lsl4f -- sh
kubectl exec -n orgx -it peer2-5f97cfc68f-lsl4f -- sh
kubectl get svc -n orgx
kubectl scale deploy peer2 -n orgx --replicas=0
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl get pods -n orgx
kubectl exec -n orgx peer2-5498d9b8f7-sl7wz -- printenv | grep CORE_PEER_CHAINCODEADDRESS
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl scale deploy peer1 -n orgdcms --replicas=0
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl get pods -n orgdcms
kubectl apply -f basicnode-deployment-orgx.yaml
kubectl scale deploy peer2 -n orgx --replicas=0
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl apply -f basicnode-deployment-orgdcms.yaml
kubectl scale deploy peer1 -n orgdcms --replicas=0
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl get svc -n orgx
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl log -n orgdcms basicnode-64d9755f86-krxcs
kubectl logs -n orgdcms basicnode-64d9755f86-krxcs
kubectl get pods -n orgdcms
kubectl logs -n orgdcms basicnode-857966cbb6-4fdnv
kubectl get deployment basicnode -n orgdcms -o yaml | grep chaincode-id -A2
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgdcms basicnode-857966cbb6-4fdnv -- netstat -tulnp
kubectl get pods -n orgdcms | grep peer
kubectl exec -n orgdcms peer1-b4cbd9fb4-bd2xn -- nc -zv basicnode 9999
kubectl exec -n orgdcms peer1-b4cbd9fb4-bd2xn -- getent hosts basicnode
cd /home/asantopadre/fabric-deploy/chaincodes/basicnode
tree -L 2
cd ~/
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl rollout restart deployment basicnode -n orgdcms
kubectl get pods -n orgdcms | grep basic
kubectl logs -n orgdcms basicnode-fb7d45bf6-2w8ld
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms | grep basic
kubectl logs -n orgdcms basicnode-6ffbd99cd4-g5z88
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms | grep basic
kubectl get pods -n orgdcms | grep peer1
kubectl exec -n orgdcms -it peer1-b4cbd9fb4-bd2xn -- bash
cat /etc/hyperledger/fabric/core.yaml | grep -A 10 chaincode
kubectl get pods -n orgdcms | grep basic
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms | grep basic
kubectl logs -n orgdcms basicnode-7bcfdb5c6b-h7q2h
kubectl scale deploy peer1 -n orgdcms --replicas=0
kubectl apply -f peer1-deployment.yaml
kubectl get pods -n orgdcms | grep peer1
kubectl exec -n orgdcms -it peer1-57bbc96b5f-f9xb5 -- env | grep EXTERNAL
kubectl get pods -n orgdcms | grep basicnode
kubectl apply -f basicnode-deployment.yaml -n orgdcms
kubectl delete pod -n orgdcms basicnode-7bcfdb5c6b-h7q2h
kubectl get pods -n orgdcms | grep basicnode
kubectl apply -f basicnode-deployment.yaml -n orgdcms
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms | grep basicnode
kubectl apply -f /home/asantopadre/basicnode-deployment-orgdcms.yaml
kubectl get pods -n orgdcms | grep basicnode
kubectl apply -f basicnode-deployment-orgdcms.yaml -n orgdcms
kubectl delete pod -n orgdcms basicnode-85f465b5fc-skp8d
kubectl get pods -n orgdcms | grep basicnode
kubectl delete pod -n orgdcms basicnode-ddd4b6d88-7m4wj
kubectl get pods -n orgdcms | grep basicnode
kubectl logs -n orgdcms basicnode-ddd4b6d88-9bvlc
kubectl logs -n orgdcms basicnode-ddd4b6d88-9bvlc --previous
cd /opt/hyperledger/ccaas/basicnode
ls
sudo nerdctl build -t basicnode:1.0 .
which buildctl
which buildkitd
sudo buildkitd &
sudo nerdctl build -t basicnode:1.0 .
sudo buildkitd &
exit
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it peer1-cd6d87d7d-9mblg -- sh
cat /etc/hyperledger/fabric/core.yaml | grep chaincode -A 10
kubectl get pods -n orgdcms
kubectl logs -n orgdcms peer1-59ffc6d6cd-pxrcj
kubectl logs -n orgdcms
kubectl logs -n orgdcms peer1-5f65d674f-vwmql
kubectl logs -n orgdcms peer1-bf7786d64-lgdlw
kubectl get pods -n orgdcms
kubectl logs -n orgdcms peer1-b4cbd9fb4-bd2xn
kubectl get pods -n orgdcms
kubectl logs -n orgdcms peer1-57bbc96b5f-f9xb5
kubectl logs -n orgdcms peer1-57bbc96b5f-kl79c
kubectl get pods -n orgdcms
kubectl logs -n orgdcms peer1-57bbc96b5f-kl79c
kubectl logs -n orgx peer2-69dd49cfcb-6mpb4

kubectl logs -n orgx peer2-5498d9b8f7-sl7wz
kubectl get pods -n orgx

docker ps
kubectl logs -n orgx peer2-5498d9b8f7-sl7wz
kubectl get pods -n orgx
kubectl logs -n orgx peer2-784489c54b-95l26
sudo buildkitd &
ps aux | grep buildkitd
cd /home/asantopadre/fabric-deploy/chaincodes/basicnode
sudo nerdctl build -t basicnode:1.0 .
sudo nerdctl save basicnode:1.0 -o basicnode.tar
sudo ctr -a /run/k3s/containerd/containerd.sock -n k8s.io images import basicnode.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
cd ~?
cs`/
cd ~/
kubectl apply -f basicnode-deployment-orgdcms.yaml -n orgdcms
kubectl get pods -n orgdcms | grep basicnode
kubectl describe pod -n orgdcms basicnode-58d5b45564-ks96k
sudo nerdctl run --rm -it basicnode:1.0 sh
sudo nerdctl run --rm --net=none -it basicnode:1.0 sh
sudo nerdctl image save basicnode:1.0 -o test.tar
mkdir testimage
tar -xf test.tar -C testimage
grep -R "fabric-chaincode-node" -n testimage
find testimage -name fabric-chaincode-node
cd ~/fabric-deploy/chaincodes/basicnode
sudo nerdctl build -t basicnode:1.0 .
ps aux | grep buildkitd
sudo pkill buildkitd
ps aux | grep buildkitd
sudo buildkitd &
cd /home/asantopadre/fabric-deploy/chaincodes/basicnode
sudo nerdctl build -t basicnode:1.0 .
cd /home/asantopadre/fabric-deploy/chaincodes/basicnode
sudo nerdctl build -t basicnode:1.0 .
sudo nerdctl save basicnode:1.0 -o basicnode.tar
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import basicnode.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
cd ~/
kubectl apply -f basicnode-deployment-orgdcms.yaml -n orgdcms
kubectl get pods -n orgdcms | grep basicnode
kubectl delete pod -n orgdcms -l app=basicnode
kubectl get pods -n orgdcms | grep basicnode
kubectl logs -n orgdcms basicnode-58d5b45564-442f9
kubectl get pods -n orgdcms | grep basicnode
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl get pods -n orgdcms 
kubectl exec -n orgdcms -it peer1-57bbc96b5f-f9xb5 -- bash
kubectl delete pod -n orgdcms peer1-57bbc96b5f-f9xb5 n
kubectl get pods -n orgdcms 
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl get pvc -n orgdcms
kubectl apply -f peer1-cleaner.yaml
kubectl exec -n orgdcms -it peer1-cleaner -- sh
kubectl scale deployment peer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms 
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl get pods -n orgdcms 
kubectl exec -n orgdcms -it basicnode-58d5b45564-442f9 -- sh
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgx -it peer2-8494d495c7-wp2wf -- env | grep CHAINCODE
kubectl exec -n orgx -it peer2-8494d495c7-wp2wf -- ls /var/hyperledger/production/externalbuilder
kubectl exec -n orgx -it peer2-8494d495c7-wp2wf -- find /var/hyperledger/production/externalbuilder -maxdepth 3
kubectl exec -n orgx -it peer2-8494d495c7-wp2wf -- env | grep CHAINCODE
kubectl scale deployment peer2 -n orgdcms --replicas=1
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl apply -f peer2-deployment.yaml
kubectl exec -n orgx -it peer2-8494d495c7-wp2wf -- env | grep CHAINCODE
kubectl get pods -n orgx
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl apply -f peer2-deployment.yaml
kubectl get pods -n orgx
kubectl exec -n orgx -it peer2-784489c54b-4d2nh -- env | grep CHAINCODE
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl apply -f peer2-cleaner.yaml
kubectl exec -n orgdcms -it peer1-cleaner -- sh
kubectl exec -n orgdcms -it peer2-cleaner -- sh
kubectl exec -n orgx -it peer2-cleaner -- sh
kubectl delete pod peer2-cleaner -n orgx
kubectl get pods -n orgx
kubectl delete pod clean-peer2-ledger -n orgx
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pods -n orgx
kubectl apply -f basicnode-deployment-orgx.yaml 
kubectl get pods -n orgx
kubectl get pod -n orgx basicnode-c4f57fd66-qrxcm -o jsonpath='{.spec.containers[0].image}'
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep basicnode
kubectl get pod -n orgx basicnode-c4f57fd66-qrxcm -o jsonpath='{.status.containerStatuses[0].imageID}'
kubectl logs -n orgx basicnode-c4f57fd66-qrxcm
kubectl exec -n orgx -it basicnode-6bb95d7c78-xwqlr -- netstat -tulnp
kubectl exec -n orgx -it basicnode-c4f57fd66-qrxcm -- netstat -tulnp
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl cp orgdcms/fabric-tools:/config_update_envelope.pb /home/asantopadre/config_update_envelope.pb
kubectl cp /home/asantopadre/config_update_envelope.pb orgx/fabric-tools:/config_update_envelope.pb
kubectl exec -n orgx -it fabric-tools -- bash
kubectl cp orgx/fabric-tools:/config_update_envelope.pb /home/asantopadre/config_update_envelope.pb
kubectl cp /home/asantopadre/config_update_envelope.pb orgdcms/fabric-tools:/config_update_envelope.pb
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgx -it fabric-tools -- sh
git ls-files | head -100
.bash_history
.bash_history_files/BASH/.bash_history copy 16
.bash_history_files/BASH/.bash_history_copy 15
.bash_history_files/BASH/.bash_hystory_copy_14
.bash_logout
.bashrc
.cache/Microsoft/DeveloperTools/deviceid
.cache/go-build/README
.cache/helm/repository/prometheus-community-charts.txt
.cache/helm/repository/prometheus-community-index.yaml
.cache/motd.legal-displayed
.cache/typescript/5.9/package.json
.config/helm/repositories.lock
.config/helm/repositories.yaml
.dotnet/corefx/cryptography/crls/7462804f.d5a68194.crl
.dotnet/corefx/cryptography/crls/75d1b2ed.de05bb98.crl
.dotnet/corefx/cryptography/crls/7abcc12f.dea36fd7.crl
.dotnet/corefx/cryptography/crls/cf887acb.0f995861.crl
.dotnet/corefx/cryptography/crls/d16da424.cbeb964c.crl
.fabric-ca-client/fabric-ca-client-config.yaml
.gitconfig
.gitignore
.kube/cache/discovery/127.0.0.1_6443/admissionregistration.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/apiextensions.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/apiregistration.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/apps/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/authentication.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/authorization.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/autoscaling/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/autoscaling/v2/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/batch/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/certificates.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/coordination.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/discovery.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/events.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/flowcontrol.apiserver.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/gateway.networking.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/gateway.networking.k8s.io/v1beta1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/helm.cattle.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/hub.traefik.io/v1alpha1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/k3s.cattle.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/metrics.k8s.io/v1beta1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/monitoring.coreos.com/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/monitoring.coreos.com/v1alpha1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/networking.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/node.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/policy/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/rbac.authorization.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/scheduling.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/servergroups.json
.kube/cache/discovery/127.0.0.1_6443/storage.k8s.io/v1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/traefik.io/v1alpha1/serverresources.json
.kube/cache/discovery/127.0.0.1_6443/v1/serverresources.json
.kube/cache/http/1676270e3a7884e79d8e5840eb85fe6f4c6757b6cf53f30cbb3dfd0fcdf90182
.kube/cache/http/5c8d030ffded04e363cfa76ee81a16c3224a52d3c2961e2038393ce277763b08
.kube/cache/http/61a62ec3dba041f01e711127a554476ff73fef47113768b6736bfe679078aa86
.kube/cache/http/6e0a83a71913c099b13818854788e45f43c924d79e18500554270c42afc2ec46
.kube/cache/http/aaf6be5b0d8112eec08436b2a70d1f806e7be480e690bb8cfe5956155bc818a7
.kube/cache/http/b4752430e41333ef78276ae689e53c4499fb52097a4291779131865a314a01a8
.kube/cache/http/de8502abc3b0f9530c313864819d3e7951cec62e80a4292f9e2cd09a3dfd9121
.lesshst
.profile
.ssh/authorized_keys
.ssh/id_ed25519.pub
.ssh/known_hosts
.ssh/known_hosts.old
.sudo_as_admin_successful
.wget-hsts
anchor_update.pb
backup/fabric-ca-orgdcms-backup.tgz
basic-ccaass-orgdcms-svc.yaml
basic.tar.gz
basicnode-deployment-orgdcms.yaml
basicnode-deployment-orgx.yaml
basicnode.tar
ca-client-orgdcms/msp/IssuerPublicKey
ca-client-orgdcms/msp/IssuerRevocationPublicKey
ca-client-orgdcms/msp/cacerts/localhost-7054.pem
ca-client-orgdcms/msp/keystore/da47bf0323aace3e05021436f29ff31543420cd9cdb03ca2764efe188aa8215a_sk
ca-client-orgdcms/msp/signcerts/cert.pem
ca-client-orgdcms/msp/tlscacerts/tls-ca-cert.pem
ca-client-orgdcms/readme.md
ca-client-orgx/fabric-ca-client-config.yaml
ca-client-orgx/msp/IssuerPublicKey
ca-client-orgx/msp/IssuerRevocationPublicKey
ca-client-orgx/msp/cacerts/localhost-7054.pem
ca-client-orgx/msp/config.yaml
ca-client-orgx/msp/keystore/65d7aeddef919d8e98bfbf0c041957c5605b4568e45f7740b85cc47b28f9c318_sk
ca-client-orgx/msp/signcerts/cert.pem
ca-client-orgx/readme.md
ca-orgx-tls-ca.pem
canale1v2.block
clean-peer1-ledger.yaml
clean-peer2-ledger.yaml
config.pb
config.yaml
config_block.json
config_block.pb
config_modifi
git ls-files
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7054:7054
ss -lntp | grep 7051
sudo ufw status
kubectl exec -n orgdcms -it fabric-tools -- sh
cd /home/asantopadre/fabric-clients/ca-orgdcms-admin
ls
fabric-ca-client identity list
ls -R
cd /home/asantopadre/fabric-clients/ca-orgdcms-admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=$(pwd)/msp/tlscacerts/tls-ca-cert.pem
echo $FABRIC_CA_CLIENT_TLS_CERTFILES
fabric-ca-client identity list
cd /home/asantopadre/fabric-clients/ca-orgdcms-admin
export FABRIC_CA_CLIENT_HOME=$(pwd)
echo $FABRIC_CA_CLIENT_HOME
/home/asantopadre/fabric-clients/ca-orgdcms-admin
ls msp/signcerts
fabric-ca-client identity list
kubectl get svc -n orgdcms
export FABRIC_CA_CLIENT_HOME=$(pwd)
export FABRIC_CA_CLIENT_TLS_CERTFILES=$(pwd)/msp/tlscacerts/tls-ca-cert.pem
fabric-ca-client identity list -u https://localhost:7054
fabric-ca-client register --id.name dcms-operator --id.secret dcms-operatorpw --id.type client -u https://localhost:7054
fabric-ca-client identity list -u https://localhost:7054
fabric-ca-client enroll -u https://dcms-operator:dcms-operatorpw@localhost:7054 -M /home/asantopadre/fabric-clients/dcms-operator/msp
ls /home/asantopadre/fabric-clients/dcms-operator/msp
cd ~/
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl cp /home/asantopadre/fabric-clients/dcms-operator orgdcms/fabric-tools:/tmp/
kubectl exec -n orgdcms -it fabric-tools -- sh
cp /home/asantopadre/fabric-deploy/orgdcms/admin/msp/config.yaml /home/asantopadre/fabric-clients/dcms-operator/msp/
ls /home/asantopadre/fabric-clients/dcms-operator/msp
kubectl cp /home/asantopadre/fabric-clients/dcms-operator orgdcms/fabric-tools:/tmp/
kubectl exec -n orgdcms -it fabric-tools -- sh
ls /home/asantopadre/fabric-clients/dcms-operator/msp
ls /home/asantopadre/fabric-clients/dcms-operator/msp/keystore
ls /etc/hyperledger/fabric/tlscacerts
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- ls /etc/hyperledger/fabric/tlscacerts
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- ls /etc/hyperledger
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- ls /etc/hyperledger/fabric
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- find / -name "*tls*.pem" 2>/dev/null
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- find /var/hyperledger/peer -maxdepth 4 -type f \( -name "*bundle*.pem" -o -name "*root*.pem" -o -name "*tls*.pem" \)
kubectl run -n orgdcms --rm -it tls-export-peer1   --image=busybox --restart=Never   --overrides='{"spec":{"containers":[{"name":"c","image":"busybox","command":["sh","-c","ls -l /tls; cp /tls/ca-bundle.crt /tls/out/peer-tls-bundle.pem; ls -l /tls/out; sleep 2"],"volumeMounts":[{"name":"tls","mountPath":"/tls"},{"name":"out","mountPath":"/tls/out"}]}],"volumes":[{"name":"tls","persistentVolumeClaim":{"claimName":"peer1-orgdcms-tls-pvc"}},{"name":"out","hostPath":{"path":"/home/asantopadre/fabric-export","type":"DirectoryOrCreate"}}]}}'
ls -l /home/asantopadre/fabric-export/peer-tls-bundle.pem
git ls-files | xargs du -h | sort -hr | head -20
git rev-list --objects --all | sort -k 2 > allfiles.txt
git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10
kubectl get pods -A
kubectl get svc -n orgdcms
kubectl port-forward -n orgdcms svc/peer1 7051:7051
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:7051
git status
pwd
git rev-parse --show-toplevel
git status
git push origin main
ps aux | grep git
kill 97292
kill 103513
kill -9 97292
kill -9 103513
git status
git reset --mixed HEAD~1
git status
tree -L 2
git add .gitignore
git commit -m "finalizza  sanichain fabric prototype"
git status
find . -name "*.key"
find . -name "priv_*"
git ls-files | grep -E "\.key|keystore"
git rm --cached fabric-deploy/orgx/peers/peer2/tls/server.key
git rm --cached fabric-deploy/peer1-orgdcms/tls/server.key
git rm --cached fabric-deploy/orgdcms/peers/peer1/tls/server.key
git ls-files | grep -E "\.key"
git ls-files | grep -E "\.key|keystore"
git rm -r --cached --ignore-unmatch */msp/keystore
git rm -r --cached --ignore-unmatch */tls/keystore
git rm -r --cached --ignore-unmatch *msp*/keystore
git rm --cached $(git ls-files | grep -E "_sk$|\.key$")
git ls-files | grep -E "_sk$|\.key$"
git commit -m "remove private keys and keystore from repository"
git ls-files | xargs du -h | sort -hr | head
git rm -r --cached fabric-samples
git commit -m "remove fabric-samples from repository"
git ls-files | xargs du -h | sort -hr | head
git rm -r --cached go
git commit -m "remove Go module cache from repository"
git push origin main
docker ps
docker ps --format "table {{.Names}}\t{{.Ports}}"
ss -lntp | grep 7051
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:705151
Forwarding from 0.0.0.0:7051 -> 7051
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:7051
kubectl logs -n orgdcms peer1-5f7879758-ppbvh
kubectl logs -n orgdcms peer1-5c56f6f4ff-t8rqd
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -n orgx peer2-784489c54b-95l26 -- ls /var/hyperledger/peer/tls
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgx peer2-784489c54b-95l26 -- env | grep TLS
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -text -noout
kubectl cp orgdcms/peer1-57bbc96b5f-kl79c:/var/hyperledger/peer/tls/server.crt ./peer1-server.crt
openssl x509 -in peer1-server.crt -text -noout
kubectl exec -n orgx peer2-784489c54b-95l26 -- env | grep CORE_PEER_GOSSIP
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- env | grep CLIENT
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- env | grep CORE_PEER_TLS
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- ls /var/hyperledger/peer/msp/tlscacerts
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- cat /var/hyperledger/peer/msp/tlscacerts/*
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- cat /var/hyperledger/peer/msp/tlscacerts/tls-ca-cert.pem
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer
kubectl get pod -n orgdcms | grep fabric
kubectl exec -n orgx peer2-784489c54b-95l26 -- ls /var/hyperledger/peer/msp/tlscacerts
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/msp/tlscacerts/*
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- peer channel getinfo -c canale1v2
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- peer node status
kubectl logs -n orgdcms peer1-57bbc96b5f-kl79c | grep gossip
kubectl logs -n orgx peer2-784489c54b-95l26 | grep gossip
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- peer chaincode query -C canale1v2 -n basicnode -c '{"Args":["GetAllAssets"]}'
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- peer chaincode query -C canale1v2 -n basicnode -c '{"Args":["ReadAsset","test"]}'
cat /home/asantopadre/fabric-2.5/artifacts/tls-ca-cert.pem /home/asantopadre/peer1-tls-ca.crt /home/asantopadre/peer2-tls-ca.crt > peer-tls-bundle.pem
kubectl exec -n orgx peer2-784489c54b-95l26 -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/tls/server.crt > /home/asantopadre/peer2-server.crt
openssl x509 -in /home/asantopadre/peer2-server.crt -text -noout
kubectl exec -n orgx peer2-784489c54b-95l26 -- cat /var/hyperledger/peer/tls/ca.crt > /home/asantopadre/orgx-tls-ca-real.crt
openssl x509 -in /home/asantopadre/orgx-tls-ca-real.crt -text -noout
ps aux | grep port-forward
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- ls /var/hyperledger/peer/msp/tlscacerts
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- ls /var/hyperledger/peer/msp/cacerts
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- ls /var/hyperledger/peer/channel-msp/tlscacerts
find /home/asantopadre -name "*tls-ca*.pem"
cat /home/asantopadre/fabric-deploy/configtx/orgx/msp/tlscacerts/tls-ca-cert.pem
kubectl cp /home/asantopadre/fabric-deploy/configtx/orgx/msp/tlscacerts/tls-ca-cert.pem orgdcms/$(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}"):/var/hyperledger/peer/msp/tlscacerts/orgx-tls-ca.pem
peer channel fetch config config_block.pb -o localhost:7050 -c canale1v2 --tls --cafile /home/asantopadre/fabric-2.5/artifacts/tls-ca-cert.pem
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- peer channel fetch config /tmp/config_block.pb -o orderer1:7050 -c canale1v2 --tls --cafile /var/hyperledger/peer/tls/tlscacerts/tls-ca-cert.pem
kubectl logs -n orgdcms deployment/peer1 | grep peer2
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- cat /var/hyperledger/peer/tls/trusted/peer2-tls-ca.crt
kubectl exec -n orgx $(kubectl get pod -n orgx -l app=peer2 -o jsonpath="{.items[0].metadata.name}") -- ls /var/hyperledger/peer/tls
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- cp /var/hyperledger/peer/tls/ca-bundle.crt /var/hyperledger/peer/tls/ca-bundle.crt.bak
kubectl describe pod -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") | grep -A5 tls
sudo find /var/lib/rancher/k3s/storage -name ca-bundle.crt
ls -l /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc
kubectl get pvc -n orgdcms 
ls /home/asantopadre/fabric-deploy/tls-ca
kubectl delete job bundle-peer1 -n orgdcms --ignore-not-found
kubectl apply -f bundle-peer1.yaml
kubectl logs -n orgdcms job/bundle-peer1
kubectl delete job bundle-peer1 -n orgdcms --ignore-not-found
kubectl apply -f job-bundle-peer1.yaml
kubectl logs -n orgdcms job/bundle-peer1
kubectl rollout restart deployment peer1 -n orgdcms
kubectl get pvc -n orgdcms 
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get pods -n orgdcms
openssl x509 -in /tmp/peer1.crt -noout -issuer
openssl x509 -in /var/lib/rancher/k3s/storage/*peer1-orgdcms-tls-pvc*/server.crt -noout -issuer
kubectl exec -n orgdcms deploy/peer1 -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer -subject
kubectl exec -n orgdcms deploy/peer1 -- cat /var/hyperledger/peer/tls/server.crt > /tmp/peer1.crt
kubectl exec -n orgx deploy/peer2 -- cat /var/hyperledger/peer/tls/server.crt > /tmp/peer2.crt
openssl x509 -in /tmp/peer1.crt -noout -issuer -subject
openssl x509 -in /tmp/peer2.crt -noout -issuer -subject
kubectl exec -n orgdcms deploy/peer1 -- bash
kubectl exec -n orgdcms deploy/peer1 -- sh
kubectl exec -it -n orgdcms deploy/peer1 -- sh
kubectl exec -n orgdcms -it fabric-tools -- sh
sudo ss -lntp | grep 7051
sudo lsof -i :7051
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:7051
kubectl port-forward -n orgdcms svc/peer1 7051:7051
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:7051
Forwarding from 0.0.0.0:7051 -> 7051
kubectl port-forward -n orgdcms svc/peer1 7051:7051
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:7051
ps aux | grep port-forward
sudo ss -lntp | grep 7051
sudo lsof -i :7051
cat /home/asantopadre/fabric-export/peer-tls-bundle.pem
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- ls /var/hyperledger/peer/tls
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-57bbc96b5f-kl79c -- printenv | grep TLS
kubectl port-forward -n orgdcms svc/peer1 --address 0.0.0.0 7051:7051
kubectl get pods -n orgx
kubectl logs -n orgx peer2-784489c54b-95l26
ps aux | grep port-forward
kubectl logs -n orgx peer2-784489c54b-95l26
kubectl exec -n orgx $(kubectl get pod -n orgx -l app=peer2 -o jsonpath="{.items[0].metadata.name}") -- cat /var/hyperledger/peer/tls/server.crt
kubectl logs -n orgx peer2-784489c54b-95l26
kubectl cp orgx/$(kubectl get pod -n orgx -l app=peer2 -o jsonpath="{.items[0].metadata.name}"):/var/hyperledger/peer/tls/server.crt /tmp/peer2.crt
openssl x509 -in /tmp/peer2.crt -noout -issuer -subject
grep -A2 "BEGIN CERTIFICATE" /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
openssl x509 -in /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt -noout -issuer -subject
cd /tmp
awk 'BEGIN{n=0} /BEGIN CERTIFICATE/{n++} {print > ("cert" n ".pem")}' /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
sudo grep "BEGIN CERTIFICATE" /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
kubectl exec -n orgx $(kubectl get pod -n orgx -l app=peer2 -o jsonpath="{.items[0].metadata.name}") -- ls -l /var/hyperledger/peer/tls
grep "fabric-ca-server" -n /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
sudo grep "fabric-ca-server" -n /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
ls /home/asantopadre/fabric-deploy/configtx/orgx/msp/cacerts
ls /home/asantopadre/fabric-clients/ca-orgx-admin/msp/cacerts
openssl x509 -in /home/asantopadre/fabric-deploy/configtx/orgx/msp/cacerts/localhost-7054.pem -noout -subject
kubectl exec -n orgx $(kubectl get pod -n orgx -l app=peer2 -o jsonpath="{.items[0].metadata.name}") -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer
kubectl cp orgx/$(kubectl get pod -n orgx -l app=peer2 -o jsonpath="{.items[0].metadata.name}"):/var/hyperledger/peer/tls/server.crt /tmp/peer2.crt
openssl x509 -in /tmp/peer2.crt -noout -issuer
cd /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc
csplit -f cert- ca-bundle.crt '/-----BEGIN CERTIFICATE-----/' '{*}'
sudo openssl x509 -in /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt -text -noout
sudo cat /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
sudo awk '
/BEGIN CERTIFICATE/{i++}
{print > "/tmp/cert" i ".pem"}
' /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt
for f in /tmp/cert*.pem; do   echo "==== $f ====";   openssl x509 -in $f -noout -subject -issuer; done
openssl x509 -in /tmp/peer2.crt -noout -issuer -fingerprint -sha256
openssl x509 -in /tmp/cert1.pem -noout -fingerprint -sha256
openssl x509 -in /tmp/cert2.pem -noout -fingerprint -sha256
openssl x509 -in /tmp/peer2.crt -noout -fingerprint -sha256
openssl x509 -in /tmp/cert1.pem -noout -fingerprint -sha256
openssl x509 -in /tmp/cert2.pem -noout -fingerprint -sha256
openssl verify -CAfile /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt /tmp/peer2.crt
sudo openssl verify -CAfile /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt /tmp/peer2.crt
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- printenv | grep CORE_PEER_TLS
kubectl rollout restart deployment peer1 -n orgdcms
kubectl get pods -n orgx
kubectl get pvc -n orgx
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- printenv | grep CORE_PEER_TLS
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl get pvc -n orgx
kubectl get pods -n orgx
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS_FILES
cd ~/
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS_FILES
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl exec -n orgdcms $(kubectl get pod -n orgdcms -l app=peer1 -o jsonpath="{.items[0].metadata.name}") -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS_FILES
kubectl logs -n orgx peer2-784489c54b-95l26
src/fabric/identity/peer-tls-bundle.pem
sudo cp /var/lib/rancher/k3s/storage/pvc-1659cb82-3356-4f4b-9542-9394503a1cc2_orgdcms_peer1-orgdcms-tls-pvc/ca-bundle.crt /home/asantopadre/peer-tls-bundle.pem
openssl x509 -in /tmp/peer2.crt -noout -text | grep -A1 "Subject Alternative"
kubectl delete job bundle-peer2 -n orgx
kubectl apply -f job-bundle-peer2.yaml
kubectl logs -n orgx job/bundle-peer2
kubectl delete job-bundle-peer2 -n orgx
kubectl delete job bundle-peer2 -n orgx
kubectl apply -f job-bundle-peer2.yaml
kubectl logs -n orgx job/bundle-peer2
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl get pvc -n orgx
kubectl get pod -n orgx
kubectl logs -n orgx deploy/peer2
kubectl get pod -n orgx
kubectl logs -n orgx peer2-65fdc75bb6-s42jv
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl get pods -n orgx
ls /var/lib/rancher/k3s/storage/*peer2-orgx-tls-pvc*
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pods -n orgx -w
kubectl get pvc -n orgx 
kubectl get pods -n orgx
kubectl exec -n orgx peer2-65fdc75bb6-s4zz5 -- printenv | grep CORE_PEER_TLS_CLIENTROOTCAS_FILES
kubectl exec -n orgx peer2-65fdc75bb6-s4zz5 -- ls -l /var/hyperledger/peer/tls
kubectl logs -n orgx peer2-65fdc75bb6-s4zz5
kubectl port-forward -n orgx svc/peer2 8051:7051
kubectl port-forward -n orgx svc/peer2 --address 0.0.0.0 8051:7051
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl run fabric-gateway-test -n orgdcms --image=node:20 --restart=Never --command -- sleep infinity
kubectl get pods -n orgdcms
kubectl get pods -n orgdcms | grep test
kubectl delete pod -n orgdcms --field-selector=status.phase=Succeeded
kubectl get pods -n orgdcms
kubectl describe pod fabric-gateway-test -n orgdcms
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp /home/asantopadre/fabric-clients/dcms-operator/msp/signcerts/cert.pem orgdcms/fabric-gateway-test:/gateway/cert.pem
ls /home/asantopadre/fabric-clients/dcms-operator/msp/keystore
kubectl cp /home/asantopadre/fabric-clients/dcms-operator/msp/keystore/638f8c18224caaab19641298f11423282d87457a68914d69b0273f04f667fa6d_sk orgdcms/fabric-gateway-test:/gateway/key.pem
kubectl cp /home/asantopadre/fabric-export/peer-tls-bundle.pem orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
nano ~/test-fabric.js
kubectl cp ~/test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
nano ~/test-fabric.js
kubectl cp ~/test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl exec -n orgdcms peer1-5c56f6f4ff-t8rqd -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgdcms peer1-5c56f6f4ff-t8rqd -- printenv | grep CORE_PEER_TLS
kubectl logs -n orgx <nome-pod-peer2> | grep TLS
kubectl logs -n orgx peer2-65fdc75bb6-s4zz5 | grep TLS
kubectl describe pod -n orgx peer2-65fdc75bb6-s4zz5
kubectl exec -n orgx peer2-65fdc75bb6-s4zz5 -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -n orgdcms <peer1-pod> -- grep -c "BEGIN CERTIFICATE" /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-5c56f6f4ff-t8rqd -- grep -c "BEGIN CERTIFICATE" /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7055 --enrollment.profile tls --csr.hosts peer1 --csr.hosts peer1.orgdcms.svc.cluster.local -M ~/fabric-deploy/peer1-orgdcms/tls-new
fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7055 --tls.certfiles /home/asantopadre/fabric-deploy/tls-ca/tls-ca-cert.pem --enrollment.profile tls --csr.hosts peer1 --csr.hosts peer1.orgdcms.svc.cluster.local -M ~/fabric-deploy/peer1-orgdcms/tls-new
kubectl exec -n orgdcms deploy/fabric-tls-ca -- fabric-ca-client register   --url https://localhost:7054   --id.name peer1   --id.secret peer1pw   --id.type peer   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7055 --tls.certfiles /home/asantopadre/fabric-deploy/tls-ca/tls-ca-cert.pem --enrollment.profile tls --csr.hosts peer1 --csr.hosts peer1.orgdcms.svc.cluster.local -M ~/fabric-deploy/peer1-orgdcms/tls-new
kubectl exec -n orgdcms deploy/fabric-tls-ca -- fabric-ca-client identity list --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
grep "fabric-tls-ca" ~/fabric-deploy/peer1-orgdcms/tls-new/signcerts/cert.pem
cd ~/fabric-deploy/peer1-orgdcms/tls-new
cp tlscacerts/*.pem ca.crt
cp signcerts/cert.pem server.crt
cp keystore/*_sk server.key
cd ~/
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl get pvc -n orgdcms
kubectl apply -f job-update-peer1-tls.yaml
kubectl logs -n orgdcms job/update-peer1-tls
kubectl scale deployment peer1 -n orgdcms --replicas=1
kubectl exec fabric-gateway -- openssl s_client -connect peer2.orgx.svc.cluster.local:7051 -showcerts
kubectl exec fabric-gateway-test -- openssl s_client -connect peer2.orgx.svc.cluster.local:7051 -showcerts
kubectl get pod -n orgdcms
kubectl exec fabric-gateway-test -- openssl s_client -connect peer2.orgx.svc.cluster.local:7051 -showcerts
kubectl exec -n orgdcms fabric-gateway-test -- openssl s_client -connect peer2.orgx.svc.cluster.local:7051 -showcerts
kubectl exec -n orgdcms fabric-gateway-test -- openssl s_client -connect peer2.orgx.svc.cluster.local:7051 -CAfile /etc/ssl/certs/ca-certificates.crt
kubectl exec -n orgdcms deploy/fabric-tls-ca -- fabric-ca-client register   --url https://localhost:7054   --id.name peer2   --id.secret peer2pw   --id.type peer   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-tls-ca -- fabric-ca-client identity list --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
fabric-ca-client enroll -u https://peer2:peer2pw@localhost:7055 --tls.certfiles /home/asantopadre/fabric-deploy/tls-ca/tls-ca-cert.pem --enrollment.profile tls --csr.hosts peer2 --csr.hosts peer2.orgx.svc.cluster.local -M ~/fabric-deploy/peer2-orgx/tls-new
cd ~/fabric-deploy/peer2-orgx/tls-new
cp signcerts/cert.pem server.crt
cp keystore/* server.key
cp tlscacerts/* ca.crt
cd ~/
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl apply -f job-update-peer2-tls.yaml
kubectl logs -n orgx job/update-peer2-tls
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- awk 'BEGIN{c=0}/BEGIN CERT/{c++}{print > "/tmp/cert" c ".pem"}'
/var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- awk 'BEGIN{c=0}/BEGIN CERT/{c++}{print > "/tmp/cert" c ".pem"}'
/var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- awk 'BEGIN{c=0}/BEGIN CERT/{c++}{print > "/tmp/cert" c ".pem"}'
/var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- ls -l /var/hyperledger/peer/tls
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- printenv | grep CORE_PEER_TLS
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- awk 'BEGIN{c=0}/BEGIN CERT/{c++}{print > "/tmp/cert" c ".pem"}' /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- openssl x509 -in /tmp/cert1.pem -noout -subject -issuer
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- printenv | grep CORE_PEER_TLS
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- ls -l /var/hyperledger/peer/tls
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- openssl crl2pkcs7 -nocrl -certfile /var/hyperledger/peer/tls/ca-bundle.crt | openssl pkcs7 -print_certs -noout
kubectl exec -n orgdcms fabric-tools -- openssl version
kubectl exec -n orgdcms fabric-tools -- openssl crl2pkcs7 -nocrl -certfile /var/hyperledger/peer/tls/ca-bundle.crt | openssl pkcs7 -print_certs -noout
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- cat /var/hyperledger/peer/tls/ca-bundle.crt > bundle.pem
openssl crl2pkcs7 -nocrl -certfile bundle.pem | openssl pkcs7 -print_certs -noout
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pod -n orgx
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp orgdcms/fabric-tls-ca-666c69bb4d-f6b7r:/etc/hyperledger/fabric-ca-server/ca-cert.pem orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
kubectl cp orgdcms/fabric-tls-ca-666c69bb4d-f6b7r:/etc/hyperledger/fabric-ca-server/ca-cert.pem ./tls-ca.pem
ls
kubectl cp ./tls-ca.pem orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgdcms fabric-tls-ca-666c69bb4d-f6b7r -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > tls-ca.pem
kubectl cp tls-ca.pem orgdcms/fabric-tools:/etc/hyperledger/fabric/tlscacerts/tls-ca.pem
sudo kubectl cp tls-ca.pem orgdcms/fabric-tools:/etc/hyperledger/fabric/tlscacerts/tls-ca.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgdcms fabric-tls-ca-666c69bb4d-f6b7r -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > tls-ca.pem
kubectl cp tls-ca.pem orgdcms/fabric-tools:/tmp/tls-ca.pem
peer chaincode invoke -o orderer1.orgdcms.svc.cluster.local:7050 --tls --cafile /etc/hyperledger/fabric/tlscacerts/orderer-tls-ca.pem -C canale1v2 -n basicnode --peerAddresses peer1.orgdcms.svc.cluster.local:7051 --tlsRootCertFiles /etc/hyperledger/fabric/tlscacerts/orderer-tls-ca.pem --peerAddresses peer2.orgx.svc.cluster.local:7051 --tlsRootCertFiles /etc/hyperledger/fabric/tlscacerts/orderer-tls-ca.pem --waitForEvent -c '{"Args":["CreateAsset","asset_operator","100"]}'
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get pods -n orgx
kubectl logs -n orgx peer2-65fdc75bb6-s4zz5
kubectl logs -n orgx peer2-65fdc75bb6-pf48h
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgx peer2-65fdc75bb6-pf48h -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jrqtt -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer
kubectl exec -n orgdcms fabric-ca-orgdcms-6748cfcf45-qfzb9 -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > fabric-ca-orgdcms.pem
kubectl exec -n orgx fabric-ca-orgx -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > fabric-ca-orgx.pem
kubectl get pods -n orgx
kubectl exec -n orgx fabric-ca-orgx-7b7cf5684-9sfw5 -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > fabric-ca-orgx.pem
ls -l fabric-ca-orgx.pem
kubectl exec -n orgdcms fabric-ca-orgdcms-6748cfcf45-qfzb9 -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > fabric-ca-orgdcms.pem
kubectl exec -n orgdcms fabric-tls-ca-666c69bb4d-f6b7r -- cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > fabric-tls-ca.pem
cat fabric-tls-ca.pem fabric-ca-orgdcms.pem fabric-ca-orgx.pem > ca-bundle.crt
kubectl get pvc -n orgdcms
kubectl get pvc -n orgx
kubectl run tls-fix-peer1 -n orgdcms --image=busybox --restart=Never --overrides='
{
 "spec":{
  "containers":[{
   "name":"c",
   "image":"busybox",
   "command":["sleep","3600"],
   "volumeMounts":[{"name":"tls","mountPath":"/tls"}]
  }],
  "volumes":[{"name":"tls","persistentVolumeClaim":{"claimName":"peer1-orgdcms-tls-pvc"}}]
 }
}'
kubectl cp ca-bundle.crt orgdcms/tls-fix-peer1:/tls/ca-bundle.crt
kubectl run tls-fix-peer2 -n orgx --image=busybox --restart=Never --overrides='
{
 "spec":{
  "containers":[{
   "name":"c",
   "image":"busybox",
   "command":["sleep","3600"],
   "volumeMounts":[{"name":"tls","mountPath":"/tls"}]
  }],
  "volumes":[{"name":"tls","persistentVolumeClaim":{"claimName":"peer2-orgx-tls-pvc"}}]
 }
}'
kubectl cp ca-bundle.crt orgx/tls-fix-peer2:/tls/ca-bundle.crt
kubectl delete pod tls-fix-peer1 -n orgdcms
kubectl delete pod tls-fix-peer2 -n orgx
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl run tls-fix-peer1 -n orgdcms --image=busybox --restart=Never --overrides='
{
 "spec":{
  "containers":[{
   "name":"c",
   "image":"busybox",
   "command":["sleep","3600"],
   "volumeMounts":[{"name":"tls","mountPath":"/tls"}]
  }],
  "volumes":[{"name":"tls","persistentVolumeClaim":{"claimName":"peer1-orgdcms-tls-pvc"}}]
 }
}'
kubectl cp ca-bundle.crt orgdcms/tls-fix-peer1:/tls/ca-bundle.crt
kubectl exec -n orgdcms tls-fix-peer1 -- cat /tls/ca-bundle.crt
kubectl delete pod tls-fix-peer1 -n orgdcms
kubectl scale deployment peer1 -n orgdcms --replicas=1
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl run tls-fix-peer2 -n orgx --image=busybox --restart=Never --overrides='{"spec":{"containers":[{"name":"c","image":"busybox","command":["sleep","3600"],"volumeMounts":[{"name":"tls","mountPath":"/tls"}]}],"volumes":[{"name":"tls","persistentVolumeClaim":{"claimName":"peer2-orgx-tls-pvc"}}]}}'
kubectl cp ca-bundle.crt orgx/tls-fix-peer2:/tls/ca-bundle.crt
kubectl delete pod tls-fix-peer2 -n orgx
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs -n orgx peer2-65fdc75bb6-hxx2l
kubectl get pods -n orgdcmd
kubectl get pods -n orgdcm
kubectl get pods -n orgdcms
kubectl cp test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl cp /var/hyperledger/peer/tls/ca-bundle.crt orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- cat /var/hyperledger/peer/tls/ca-bundle.crt > peer-bundle.pem
kubectl cp peer-bundle.pem orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
kubectl cp test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- grep "BEGIN CERTIFICATE" -n /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- grep "BEGIN CERTIFICATE" /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- grep -c "BEGIN CERTIFICATE" /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgx peer2-65fdc75bb6-hxx2l -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- ls -l /var/hyperledger/peer/tls
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgx <peer2-pod-name> -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgx peer2-65fdc75bb6-hxx2l -- 
kubectl exec -n orgx peer2-65fdc75bb6-hxx2l -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- ls /var/hyperledger/peer/tls/trusted
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- ls /var/hyperledger/peer/tls/out
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- printenv | grep CORE_PEER_TLS
grep "BEGIN CERTIFICATE" -n /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- grep "BEGIN CERTIFICATE" -n /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- printenv | grep GOSSIP
kubectl exec -n orgdcms peer1-85bc8d7497-jj8ps -- cat /var/hyperledger/peer/tls/ca-bundle.crt > /home/asantopadre/peer1-ca-bundle.crt
awk '
/-----BEGIN CERTIFICATE-----/ {n++; f=sprintf("/home/asantopadre/peer1-ca-%d.pem", n)}
{print > f}
' /home/asantopadre/peer1-ca-bundle.crt
kubectl exec -n orgx $(kubectl get pods -n orgx -o name | grep peer2) -- cat /var/hyperledger/peer/tls/server.crt > /home/asantopadre/peer2-server.crt
kubectl get pods -n orgx
kubectl exec -n orgx -i peer2-65fdc75bb6-hxx2l -- cat /var/hyperledger/peer/tls/server.crt > /home/asantopadre/peer2-server.crt
ls -l /home/asantopadre/peer2-server.crt
grep -l -F -f /home/asantopadre/peer2-server.crt /home/asantopadre/peer1-ca-*.pem
for f in /home/asantopadre/peer1-ca-*.pem; do   echo "==== $f ====";   diff -q "$f" /home/asantopadre/peer2-server.crt; done
for f in /home/asantopadre/peer1-ca-*.pem; do   echo "==== $f ====";   diff -q "$f" /home/asantopadre/fabric-2.5/artifacts/tls-ca-cert.pem; done
kubectl exec -n orgx -i peer2-65fdc75bb6-hxx2l -- cat /var/hyperledger/peer/tls/ca-bundle.crt > /home/asantopadre/peer2-ca-bundle.crt
grep -c "BEGIN CERTIFICATE" /home/asantopadre/peer2-ca-bundle.crt
kubectl get deploy peer1 -n orgdcms -o yaml | grep -A20 -n "ca-bundle.crt"
kubectl get deploy peer2 -n orgx -o yaml | grep -A20 -n "ca-bundle.crt"
kubectl exec -n orgdcms -i peer1-85bc8d7497-jj8ps -- cat /var/hyperledger/peer/tls/ca-bundle.crt > /home/asantopadre/peer1-ca-bundle.crt
kubectl exec -n orgx -i peer2-65fdc75bb6-hxx2l -- cat /var/hyperledger/peer/tls/ca-bundle.crt > /home/asantopadre/peer2-ca-bundle.crt
cmp -s /home/asantopadre/peer1-ca-bundle.crt /home/asantopadre/peer2-ca-bundle.crt; echo $?
kubectl rollout restart deploy/peer2 -n orgx
kubectl rollout status deploy/peer2 -n orgx
kubectl delete pod -n orgx peer2-65fdc75bb6-hxx2l
kubectl get pods -n orgx -w
kubectl scale deploy peer2 -n orgx --replicas=0
kubectl get pods -n orgx -w
kubectl scale deploy peer2 -n orgx --replicas=1
kubectl get pods -n orgx -w
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp orgdcms/fabric-tools:/config_update_envelope.pb ./config_update_envelope.pb
ls -l config_update_envelope.pb
kubectl cp ./config_update_envelope.pb orgx/peer2-797b9dd6fb-zrkw2:/config_update_envelope.pb
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- bash
kubectl cp orgx/peer2-797b9dd6fb-zrkw2:/config_update_envelope.pb ./config_update_envelope.pb
kubectl cp ./config_update_envelope.pb orgdcms/fabric-tools:/config_update_envelope.pb
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- bash
peer version
which configtxlator
which jq
peer channel fetch config config_block.pb -o orderer1.orgdcms.svc.cluster.local:7050 -c canale1v2 --tls --cafile /etc/hyperledger/fabric/tlscacerts/orderer-tls-ca.pem
kubectl exec -it fabric-tools -n orgdcms -- bash
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgx.yaml
kubectl get pods -n orgx
kubectl exec -it fabric-tools-orgx -n orgx -- bash
kubectl logs -n orgx peer2-65fdc75bb6-hxx2l
kubectl cp config_update_envelope.pb orgx/fabric-tools-orgx:/config_update_envelope.pb
kubectl cp orgx/fabric-tools-orgx:/config_update_envelope.pb ./config_update_envelope.pb
kubectl exec -n orgdcms -it peer1-orgdcms-0 -- ls /etc/hyperledger/fabric/tls
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- bash
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- ls /etc/hyperledger/fabric
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- printenv | grep CORE_PEER_TLS
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- printenv | grep CORE_PEER_TLS_CLIENTAUTHREQUIRED
kubectl exec -n orgdcms -it peer1-85bc8d7497-jj8ps -- grep -n clientAuthRequired /etc/hyperledger/fabric/core.yaml
grep -n "BEGIN CERTIFICATE" /var/hyperledger/peer/tls/ca-bundle.crt
kubectl run fabric-gateway-test -n orgdcms --image=node:20 --restart=Never --command -- sleep infinity
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp /home/asantopadre/fabric-2.5/artifacts/tls-ca-cert.pem orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
kubectl cp cert.pem orgdcms/fabric-gateway-test:/gateway/cert.pem
kubectl cp key.pem orgdcms/fabric-gateway-test:/gateway/key.pem
kubectl cp /home/asantopadre/fabric-clients/dcms-operator/msp/signcerts/cert.pem orgdcms/fabric-gateway-test:/gateway/cert.pem
kubectl cp /home/asantopadre/fabric-clients/dcms-operator/msp/keystore/ orgdcms/fabric-gateway-test:/gateway/keystore
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp /home/asantopadre/fabric-clients/dcms-operator/msp/keystore/<file>.sk orgdcms/fabric-gateway-test:/gateway/key.pem
kubectl cp /home/asantopadre/fabric-clients/dcms-operator/msp/keystore/638f8c18224caaab19641298f11423282d87457a68914d69b0273f04f667fa6d_sk orgdcms/fabric-gateway-test:/gateway/key.pem
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp /home/asantopadre/fabric-2.5/artifacts/tls-ca-cert.pem orgdcms/fabric-tools:/tls-ca-cert.pem
kubectl exec -n orgdcms -it fabric-tools -- ls /
base64 -w0 /tls-ca-cert.pem > tls-ca-base64.txt
kubectl exec -n orgdcms fabric-tools -- ls /tmp
kubectl exec -n orgdcms fabric-tools -- head -5 tls-ca.pem
kubectl exec -n orgdcms -it fabric-tools -- sh
kubectl cp orgdcms/fabric-tools:/gateway/config_block.json /home/asantopadre/config_block.json
kubectl exec -n orgdcms fabric-tools -- find / -name "config_block.json" 2>/dev/null
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp orgdcms/fabric-tools:/config_update_envelope.pb /home/asantopadre/config_update_envelope.pb
kubectl get pods -n orgx
kubectl cp orgdcms/fabric-tools:/config_update_envelope.pb /home/asantopadre/config_update_envelope.pb
ls -l /home/asantopadre/config_update_envelope.pb
kubectl cp /home/asantopadre/config_update_envelope.pb orgx/peer2-797b9dd6fb-zrkw2:/config_update_envelope.pb
kubectl exec -it -n orgx peer2-797b9dd6fb-zrkw2 -- bash
kubectl cp orgx/peer2-797b9dd6fb-zrkw2:/config_update_envelope.pb /home/asantopadre/config_update_envelope.pb
kubectl cp /home/asantopadre/config_update_envelope.pb orgdcms/fabric-tools:/config_update_envelope.pb
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- openssl x509 -in /var/hyperledger/peer/msp/tlscacerts/tls-ca-cert.pem -noout -subject -fingerprint -sha256
kubectl exec -n orgdcms peer1-79874d4db5-q924s -- cat /var/hyperledger/peer/msp/tlscacerts/tls-ca-cert.pem
/ #
vi ca.pem
kubectl exec -n orgdcms peer1-79874d4db5-q924s -- cat /var/hyperledger/peer/msp/tlscacerts/tls-ca-cert.pem > ca.pem
kubectl cp ca.pem orgdcms/tls-test:/ca.pem
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- env | grep TLS
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- ls -l /var/hyperledger/peer/tls
kubectl apply -f fix-peer1-tls-ca.yaml
kubectl logs job/fix-peer1-tls-ca -n orgdcms
openssl x509 -in /home/asantopadre/fabric-deploy/tls-ca/tls-ca-cert.pem -noout -fingerprint -sha256
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl apply -f fix-peer2-tls-ca.yaml
kubectl logs job/fix-peer2-tls-ca -n orgx
kubectl scale deployment peer1 -n orgdcms --replicas=0
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl apply -f peer1-deployment.yaml
kubectl apply -f peer2-deployment.yaml
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl exec -it peer1 -n orgdcms -- env | grep TLS
kubectl get pods -n orgdcms
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- env | grep TLS
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- ls /etc/hyperledger/fabric
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- grep "BEGIN CERTIFICATE" -n /var/hyperledger/peer/tls/ca-bundle.crt
kubectl get pods -n orgx
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- openssl x509 -in /var/hyperledger/peer/tls/server.crt -noout -issuer -subject
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- cat /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- grep "fabric-tls-ca" /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- find / -name "*tls*ca*.pem" 2>/dev/null
cat /var/hyperledger/peer/msp/tlscacerts/tls-ca-cert.pem >> /var/hyperledger/peer/tls/ca-bundle.crt
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- sh
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- env | grep CORE_PEER_GOSSIP_EXTERNALENDPOINT
kubectl exec -it peer1-85bc8d7497-jj8ps -n orgdcms -- bash
kubectl get svc -n orgx
kubectl get svc peer2 -n orgx -o yaml > peer2-svc-backup.yaml
kubectl rollout restart deployment peer1 -n orgdcms
kubectl get svc -n orgx
kubectl apply -f peer1-deployment.yaml
kubectl delete svc peer1 -n orgdcms
kubectl apply -f peer1-service.yaml
kubectl get svc -n orgdcms
kubectl delete svc peer2 -n orgx
kubectl apply -f peer2-service.yaml
kubectl get svc -n orgx
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- cat /var/hyperledger/peer/tls/server.crt
kubectl exec -it peer2-797b9dd6fb-zrkw2 -n orgx -- env | grep GOSSIP
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- ls /var/hyperledger/peer/msp/tlscacerts
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- cat /var/hyperledger/peer/msp/tlscacerts/*
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- cat /var/hyperledger/peer/msp/tlscacerts/tls-ca-cert.pem
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- ls -R /var/hyperledger/peer/msp
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- env | grep GOSSIP
kubectl exec -it peer1-79874d4db5-q924s -n orgdcms -- openssl s_client -connect peer2.orgx.svc.cluster.local:7051 -showcerts
kubectl run tls-test   -n orgdcms   --image=alpine:3.20   --restart=Never   -it -- sh
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- peer channel getinfo -c canale1v2
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- peer channel fetch config config_block.pb -o orderer1.orgdcms.svc.cluster.local:7050 -c canale1v2 --tls --cafile /var/hyperledger/peer/tls/ca.crt
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- configtxlator proto_decode --input config_block.pb --type common.Block > config_block.json
kubectl exec -it fabric-tools -n orgdcms -- bash
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- cat /var/hyperledger/peer/tls/ca.crt > tls-ca.pem
kubectl cp tls-ca.pem fabric-gateway-test:/gateway/peer-tls.pem
kubectl get pods -A | grep gateway
kubectl cp tls-ca.pem orgdcms/fabric-gateway-test:/gateway/peer-tls.pem
openssl x509 -in tls-ca.pem -noout -subject -fingerprint -sha256
kubectl logs peer2-5fd857c756-vvfks -n orgx
kubectl logs -n orgdcms peer1-85bc8d7497-jj8ps -f
kubectl logs -n orgdcms peer1-79874d4db5-q924s -f
kubectl logs peer1-7d85c6575c-mb6r4 -n orgdcms | grep -i tls
kubectl logs peer1-7d85c6575c-mb6r4 -n orgdcms
echo "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNGekNDQWIyZ0F3SUJBZ0lVRG4vQ2M5SkhFcnIyVWROd3VLMnJOS1lwNFBRd0NnWUlLb1pJemowRUF3SXcKYURFTE1Ba0dBMVVFQmhNQ1ZWTXhGekFWQmdOVkJBZ1REazV2Y25Sb0lFTmhjbTlzYVc1aE1SUXdFZ1lEVlFRSwpFd3RJZVhCbGNteGxaR2RsY2pFUE1BMEdBMVVFQ3hNR1JtRmljbWxqTVJrd0Z3WURWUVFERXhCbVlXSnlhV010ClkyRXRjMlZ5ZG1WeU1CNFhEVEkyTURJeU16RTROVGt3TUZvWERUUXhNREl4T1RFNE5Ua3dNRm93YURFTE1Ba0cKQTFVRUJoTUNWVk14RnpBVkJnTlZCQWdURGs1dmNuUm9JRU5oY205c2FXNWhNUlF3RWdZRFZRUUtFd3RJZVhCbApjbXhsWkdkbGNqRVBNQTBHQTFVRUN4TUdSbUZpY21sak1Sa3dGd1lEVlFRREV4Qm1ZV0p5YVdNdFkyRXRjMlZ5CmRtVnlNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUVvK0ZSclVHZlZNTEFzLzNlRWZURXl5NUwKeUJRbVV6K3RvSTZSRGtJWjlsWlBZemg0Qm5NRUw2VVNmSm5abHprUDZiNUZwNTE5bEEzWWJmUzVhV2FERTZORgpNRU13RGdZRFZSMFBBUUgvQkFRREFnRUdNQklHQTFVZEV3RUIvd1FJTUFZQkFmOENBUUV3SFFZRFZSME9CQllFCkZBVFcxMnE5UTVTbmNLT29DYys4b3prWndvN3RNQW9HQ0NxR1NNNDlCQU1DQTBnQU1FVUNJUUM5S3RLZEpaZEgKQTJ1UXZXV2g5cnFtSEJVazZxbDRzaFFqbFR1VFhIcDNHQUlnS0tPUzFtbkt2UXZIS0xhMER5aUJmNjdJV1F6ZgovOEJ6RlBPaFBSVURZRTg9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K" | base64 -d > orgx_tls_root.pem
openssl x509 -in orgx_tls_root.pem -noout -subject -issuer -fingerprint -sha256
echo "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNGekNDQWIyZ0F3SUJBZ0lVRG4vQ2M5SkhFcnIyVWROd3VLMnJOS1lwNFBRd0NnWUlLb1pJemowRUF3SXcKYURFTE1Ba0dBMVVFQmhNQ1ZWTXhGekFWQmdOVkJBZ1REazV2Y25Sb0lFTmhjbTlzYVc1aE1SUXdFZ1lEVlFRSwpFd3RJZVhCbGNteGxaR2RsY2pFUE1BMEdBMVVFQ3hNR1JtRmljbWxqTVJrd0Z3WURWUVFERXhCbVlXSnlhV010ClkyRXRjMlZ5ZG1WeU1CNFhEVEkyTURJeU16RTROVGt3TUZvWERUUXhNREl4T1RFNE5Ua3dNRm93YURFTE1Ba0cKQTFVRUJoTUNWVk14RnpBVkJnTlZCQWdURGs1dmNuUm9JRU5oY205c2FXNWhNUlF3RWdZRFZRUUtFd3RJZVhCbApjbXhsWkdkbGNqRVBNQTBHQTFVRUN4TUdSbUZpY21sak1Sa3dGd1lEVlFRREV4Qm1ZV0p5YVdNdFkyRXRjMlZ5CmRtVnlNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUVvK0ZSclVHZlZNTEFzLzNlRWZURXl5NUwKeUJRbVV6K3RvSTZSRGtJWjlsWlBZemg0Qm5NRUw2VVNmSm5abHprUDZiNUZwNTE5bEEzWWJmUzVhV2FERTZORgpNRU13RGdZRFZSMFBBUUgvQkFRREFnRUdNQklHQTFVZEV3RUIvd1FJTUFZQkFmOENBUUV3SFFZRFZSME9CQllFCkZBVFcxMnE5UTVTbmNLT29DYys4b3prWndvN3RNQW9HQ0NxR1NNNDlCQU1DQTBnQU1FVUNJUUM5S3RLZEpaZEgKQTJ1UXZXV2g5cnFtSEJVazZxbDRzaFFqbFR1VFhIcDNHQUlnS0tPUzFtbkt2UXZIS0xhMER5aUJmNjdJV1F6ZgovOEJ6RlBPaFBSVURZRTg9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K" | base64 -d > orgx_tls_root.pem
openssl x509 -in orgx_tls_root.pem -noout -subject -issuer -fingerprint -sha256
openssl x509 -in orgx_tls_root.pem -noout -subject
kubectl get pvc -n orgx
kubectl apply -f debug-peer2-tls.yaml
kubectl exec -it debug-peer2-tls -n orgx -- sh
kubectl exec -it fabric-gateway-test -- ls /gateway
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- openssl x509 -in /var/hyperledger/peer/tls/ca.crt -noout -subject -fingerprint -sha256
kubectl exec -n orgdcms peer1-7d85c6575c-mb6r4 -- cat /var/hyperledger/peer/tls/ca.crt
kubectl exec -it fabric-gateway-test -n orgdcms -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -it fabric-gateway-test -n orgdcms -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -it -n orgdcms fabric-tools -- bash
base64 -w 0 /home/asantopadre/running/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem > tls_ca_base64.txt
jq '.. | .tls_root_certs? // empty' config.json
kubectl exec -it -n orgdcms fabric-tools -- bash
cat tls_ca_base64.txt
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl exec -it fabric-tools-orgx -n orgx -- bash
kubectl cp orgdcms/fabric-tools:config_update_envelope.pb ./config_update_envelope.pb
kubectl cp ./config_update_envelope.pb orgx/fabric-tools-orgx:/config_update_envelope.pb
kubectl exec -it fabric-tools-orgx -n orgx -- bash
kubectl cp orgx/fabric-tools-orgx:config_update_envelope.pb ./config_update_envelope.pb
kubectl cp ./config_update_envelope.pb orgdcms/fabric-tools:/config_update_envelope.pb
kubectl exec -it fabric-tools -n orgdcms -- bash
kubectl exec -it -n orgdcms fabric-gateway-test -- bash
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/tls/server.crt ./peer2_tls.crt
openssl x509 -in peer2_tls.crt -noout -issuer -fingerprint -sha256
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/tls/server.crt peer2_tls.crt
openssl x509 -in peer2_tls.crt -noout -issuer -fingerprint -sha256
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/tls/server.crt peer2_tls.crt
openssl x509 -in peer2_tls.crt -noout -issuer -fingerprint -sha256
openssl x509 -in ~/peer2_tls.crt -noout -issuer -fingerprint -sha256
ls -l peer2_tls.crt
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/tls/server.crt ./peer2_tls.crt
kubectl exec -n orgx peer2-5fd857c756-vvfks -- ls /etc/hyperledger/fabric
kubectl exec -n orgx peer2-5fd857c756-vvfks -- ls /etc/hyperledger/fabric/msp
kubectl exec -n orgx peer2-5fd857c756-vvfks -- ls /etc/hyperledger/fabric/msp/tlscacerts
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/msp/tlscacerts/tls-ca-cert.pem peer2_tls_ca.pem
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/msp/tlscacerts/tlsroot.pem peer2_tls_ca.pem
openssl x509 -in peer2_tls_ca.pem -noout -fingerprint -sha256
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/msp/signcerts/cert.pem peer2_tls_cert.pem
kubectl exec -n orgx peer2-5fd857c756-vvfks -- ls /etc/hyperledger/fabric/msp/signcerts
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/msp/signcerts/Peer.pem peer2_tls_cert.pem
kubectl cp orgx/peer2-5fd857c756-vvfks:/etc/hyperledger/fabric/msp/signcerts/peer.pem peer2_tls_cert.pem
openssl x509 -in peer2_tls_cert.pem -noout -issuer -fingerprint -sha256
kubectl exec -n orgx peer2-5fd857c756-vvfks -- find /etc/hyperledger -name "*.crt"
kubectl exec -n orgx peer2-5fd857c756-vvfks -- find /etc/hyperledger -name "*.pem"
kubectl exec -n orgx peer2-5fd857c756-vvfks -- grep tls /etc/hyperledger/fabric/core.yaml
kubectl exec -n orgx peer2-5fd857c756-vvfks -- grep cert /etc/hyperledger/fabric/core.yaml
kubectl exec -n orgx peer2-5fd857c756-vvfks -- ls /etc/hyperledger/fabric/tls
kubectl exec -n orgx peer2-5fd857c756-vvfks -- find / -name server.crt 2>/dev/null
kubectl cp orgx/peer2-5fd857c756-vvfks:/var/hyperledger/peer/tls/server.crt peer2_server_tls.crt
openssl x509 -in peer2_server_tls.crt -noout -issuer -fingerprint -sha256
openssl verify -CAfile channel_tls_orgx.pem peer2_server_tls.crt
ls
openssl x509 -in peer2_server_tls.crt -noout -issuer
openssl x509 -in tls-ca-cert.pem -noout -subject -fingerprint -sha256
find / -name "*tls*.pem" 2>/dev/null
openssl x509 -in /home/asantopadre/running/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem -noout -subject -fingerprint -sha256
kubectl cp orgdcms/peer1-7d85c6575c-mb6r4:/var/hyperledger/peer/tls/server.crt peer1_server_tls.crt
openssl x509 -in peer1_server_tls.crt -noout -issuer -fingerprint -sha256
kubectl logs peer1-7d85c6575c-mb6r4 -n orgdcms
kubectl get pod -n orgx
kubectl logs peer1-7d85c6575c-mb6r4 -n orgdcms
kubectl logs -f peer1-7d85c6575c-mb6r4 -n orgdcms
kubectl logs peer1-7d85c6575c-mb6r4 -n orgdcms | grep -i tls
kubectl logs peer2-5fd857c756-vvfks -n orgx
kubectl logs peer2-5fd857c756-vvfks -n orgx -w
kubectl logs peer2-5fd857c756-vvfks -n orgx --w
kubectl logs --help
kubectl logs -f peer2-5fd857c756-vvfks -n orgx --w
kubectl logs -f peer2-5fd857c756-vvfks -n orgx 
asantopadre@beelink-fabric:~$ cd ~/fabric-deploy/chaincodes/operationevent
asantopadre@beelink-fabric:~$ cd /home/asantopadre/fabric-deploy/chaincodes/operationevent
ld
ls
asantopadre@beelink-fabric:~$ cd ~/fabric-deploy/chaincodes/operationevent
cd ~/fabric-deploy/chaincodes/operationevent
sudo buildkitd &
sudo nerdctl build -t operationevent:1.0 .
which buildctl
which buildkitd
sudo buildkitd &
sudo nerdctl build -t operationevent:1.0 .
sudo nerdctl save basicnode:1.0 -o basicnode.tar
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import basicnode.tar
sudo nerdctl save operationevent:1.0 -o operationevent.tar
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import operationevent.tar
sudo crictl -r unix:///run/k3s/containerd/containerd.sock images | grep operationevent
cd ~/
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp /home/asantopadre/fabric-deploy/chaincodes/operationevent/operationevent.tar orgdcms/fabric-tools:/tmp/operationevent.tar
kubectl exec -n orgdcms fabric-tools -- ls /tmp
kubectl exec -n orgdcms -it fabric-tools -- bash
echo $CORE_PEER_TLS_ROOTCERT_FILE
-- ls /etc/hyperledger/fabric/tlscacerts/
ls /etc/hyperledger/fabric/tlscacerts/
ls etc
kubectl exec -n orgdcms -it fabric-tools -- ls /etc/hyperledger/fabric/tlscacerts/
kubectl exec -n orgdcms -it fabric-tools -- openssl x509 -in /etc/hyperledger/fabric/tlscacerts/tls-ca-cert.pem -noout -fingerprint
kubectl exec -n orgdcms -it fabric-tools -- openssl s_client -connect peer1.orgdcms.svc.cluster.local:7051 -showcerts
kubectl exec -n orgdcms -it fabric-tools -- openssl x509 -in /etc/hyperledger/fabric/tlscacerts/peer1-tls-ca.pem -noout -fingerprint
kubectl exec -n orgdcms -it fabric-tools -- openssl s_client -connect peer1.orgdcms.svc.cluster.local:7051 -showcerts 2>/dev/null | openssl x509 -noout -issuer
kubectl exec -n orgdcms -it fabric-tools -- openssl s_client -connect peer1.orgdcms.svc.cluster.local:7051 -showcerts 2>/dev/null | openssl x509 -noout -fingerprint
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgx -it fabric-tools -- bash
kubectl cp /home/asantopadre/fabric-deploy/chaincodes/operationevent/operationevent.tar.gz orgx/fabric-tools:/tmp/operationevent.tar.gz
kubectl exec -n orgx -it fabric-tools -- bash
cd /tmp
ls
cd /
cd tmp/
ls
cd /
ls
cd ~/
ls
kubectl exec -n orgx -it fabric-tools -- bash
kubectl cp /home/asantopadre/fabric-deploy/chaincodes/operationevent/operationevent.tar orgx/fabric-tools/tmp:
kubectl cp /home/asantopadre/fabric-deploy/chaincodes/operationevent/operationevent.tar orgx/fabric-tools:/tmp
kubectl exec -n orgx -it fabric-tools -- bash
kubectl get svc -A | grep basicnode
kubectl describe svc basicnode -n orgdcms
kubectl get endpoints -n orgdcms basicnode
kubectl get endpoints -n orgx basicnode
kubectl describe svc basicnode -n orgx
kubectl describe svc basicnode -n orgdcms
kubectl exec -n orgx -it fabric-tools -- bash
cd /home/asantopadre/fabric-deploy/chaincodes/operationevent
rm -f *.tar.gz code.tar.gz metadata.json connection.json
ls
cat > metadata.json <<EOF
{"type":"ccaas","label":"operationevent_1.0"}
EOF

cat > connection.json <<EOF
{"address":"operationevent.orgdcms.svc.cluster.local:9999","dial_timeout":"10s","tls_required":false}
EOF

tar -czf code.tar.gz connection.json
tar -czf operationevent.tar.gz metadata.json code.tar.gz
ls
kubectl cp operationevent.tar.gz orgdcms/fabric-tools:/tmp/
kubectl cp operationevent.tar.gz orgx/fabric-tools:/tmp/
kubectl exec -n orgdcms -it fabric-tools -- peer lifecycle chaincode install /tmp/operationevent.tar.gz
kubectl exec -n orgdcms -it fabric-tools
kubectl exec -n orgx -it fabric-tools -- bash
cd ~/
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgx -it fabric-tools -- bash
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f /home/asantopadre/operationevent-deployment-orgdcms.yaml
kubectl apply -f /home/asantopadre/operationevent-deployment-orgx.yaml
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs -n orgdcms operationevent-74c69c9978-l679g
kubectl logs -n orgx operationevent-74c69c9978-l679g
ls
tar -tzf operationevent.tar.gz
ls
tar -tzf code.tar.gz
sudo buildkitd
sudo nerdctl build -t operationevent:1.0 .
ps aux | grep buildkitd
sudo buildkitd &
sudo nerdctl build -t basicnode:1.0 .
sudo nerdctl save operationevent:1.0 -o operationevent.tar
sudo ctr --address /run/k3s/containerd/containerd.sock -n k8s.io images import operationevent.tar
cd~/
cs ~/
cd ~/
kubectl apply -f /home/asantopadre/operationevent-deployment-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl logs -n orgdcms operationevent-6568cd549-xfdn4
kubectl apply -f /home/asantopadre/operationevent-deployment-orgdcms.yaml
kubectl logs -n orgdcms operationevent-6568cd549-xfdn4
kubectl get pods -n orgdcms
kubectl logs -n orgdcms operationevent-74c69c9978-w84pb
kubectl get pods -n orgdcms
kubectl get svc -n orgdcms | grep operationevent
kubectl exec -n orgx -it fabric-tools -- bash
kubectl get svc -A
kubectl get pods -n orgdcms
kubectl exec -n orgx -it fabric-gateway-test -- bash
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp orgdcms/fabric-gateway-test:/gateway/test-fabric.js ./test-fabric.js
ls
kubectl get pods -n orgdcms
kubectl get svc -n orgdcms
kubectl get pod -n orgdcms fabric-gateway-test --show-labels
kubectl exec -it -n orgdcms fabric-gateway-test -- sh
kubectl get endpoints -n orgdcms fabric-gateway-test
curl http://localhost:8080/invoke   -X POST   -H "Content-Type: application/json"   -d '{}'
curl http://localhost:8080/invoke   -X POST   -H "Content-Type: application/json"   -d '{}'
curl http://localhost:8080/invoke   -X POST   -H "Content-Type: application/json"   -d '{
    "operationEventId": "test-005",
    "operatorDid": "did:example:operator-003",
    "operationType": "DISINFECTION_START",
    "timestamp": "2026-03-26T19:20:00Z",
    "room": "ICU-4",
    "device": "robot-23",
    "hash": "hash-test-005"
  }'
curl http://localhost:8080/invoke   -X POST   -H "Content-Type: application/json"   -d '{
    "operationEventId": "test-005",
    "operatorDid": "did:example:operator-003",
    "operationType": "DISINFECTION_START",
    "timestamp": "2026-03-26T19:20:00Z",
    "room": "ICU-4",
    "device": "robot-23",
    "hash": "hash-test-005"
  }'
curl http://localhost:8080/invoke   -X POST   -H "Content-Type: application/json"   -d '{
    "operationEventId": "test-005",
    "operatorDid": "did:example:operator-003",
    "operationType": "DISINFECTION_START",
    "timestamp": "2026-03-26T19:20:00Z",
    "room": "ICU-4",
    "device": "robot-23",
    "hash": "hash-test-005"
  }'
hostname -I
ss -tlnp | grep 8080
curl http://192.168.1.101:8080/invoke -X POST -d '{}' -H "Content-Type: application/json"
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp orgdcms/fabric-gateway-test:/gateway/app.js ./app.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl port-forward -n orgdcms pod/fabric-gateway-test 8080:3000
kubectl port-forward -n orgdcms pod/fabric-gateway-test 8080:3000 --address 0.0.0.0
kubectl port-forward -n orgdcms svc/fabric-gateway-test 8080:3000 --address 127.0.0.1
kubectl port-forward -n orgdcms pod/fabric-gateway-test 8082:3000
kubectl port-forward -n orgdcms svc/fabric-gateway-test 8080:3000
kubectl port-forward -n orgdcms svc/fabric-gateway-test 8080:3000 --address 0.0.0.0
kubectl cp orgdcms/fabric-gateway-test:/gateway/test-fabric.js ./test-fabric.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp /home/asantopadre/test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -it -n orgdcms fabric-gateway-test -- node /gateway/test-fabric.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp /home/asantopadre/test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -it -n orgdcms fabric-gateway-test -- sh -c "cd /gateway && node test-fabric.js"
kubectl cp /home/asantopadre/test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -it -n orgdcms fabric-gateway-test -- sh -c "cd /gateway && node test-fabric.js"
kubectl cp /home/asantopadre/test-fabric.js orgdcms/fabric-gateway-test:/gateway/test-fabric.js
kubectl exec -it -n orgdcms fabric-gateway-test -- sh -c "cd /gateway && node test-fabric.js"
kubectl cp /home/asantopadre/app.js orgdcms/fabric-gateway-test:/gateway/app.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
kubectl cp /home/asantopadre/app.js orgdcms/fabric-gateway-test:/gateway/app.js
kubectl exec -n orgdcms -it fabric-gateway-test -- bash
