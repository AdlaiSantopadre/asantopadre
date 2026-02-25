ubectl get pod -n orgdcms peer1-949bd578d-hqrzx -o yaml | grep CHAINCODE -A2
kubectl get pod -n orgdcms peer1-949bd578d-hqrzx -o yaml | grep CHAINCODE -A2
kubectl edit deploy peer1 -n orgdcms
kubectl apply -f peer1-service.yaml
kubectl apply -f peer1-deployment.yaml
kubectl get pod -n orgdcms
sudo find /home/asantopadre -type f \( -name "tls-ca-cert.pem" -o -name "tls-localhost-*.pem" -o -name "*tlsca*.pem" \) 2>/dev/null
mkdir -p /home/asantopadre/fabric-deploy/ca/orgdcms-admin
mkdir -p /home/asantopadre/fabric-deploy/orgdcms/admin
mkdir -p /home/asantopadre/fabric-deploy/orgdcms/peers/peer1
mkdir -p /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1
mkdir -p /home/asantopadre/fabric-deploy/channels
cp -R /home/asantopadre/ca-client-orgdcms/msp   /home/asantopadre/fabric-deploy/ca/orgdcms-admin/
cp -R /home/asantopadre/osnadmin/orgdcms-admin/msp   /home/asantopadre/fabric-deploy/orgdcms/admin/
cd /home/asantopadre/osnadmin/
tree
mkdir -p /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1
cd ~/
cp -R /home/asantopadre/osnadmin/orderer1-orgdcms/tls   /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/osnadmin-tls
mkdir -p /home/asantopadre/fabric-deploy/orgdcms/admin
cp -R /home/asantopadre/osnadmin/orgdcms-admin/msp   /home/asantopadre/fabric-deploy/orgdcms/admin/
cp -R /home/asantopadre/fabric-deploy/peer1-orgdcms/msp   /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/
cp -R /home/asantopadre/fabric-deploy/peer1-orgdcms/tls   /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/
tree /home/asantopadre/fabric-deploy/orgdcms
cp -R /home/asantopadre/osnadmin/orgdcms-admin/msp   /home/asantopadre/fabric-deploy/orgdcms/admin/
find /home/asantopadre -type d -name admin -o -name Admin -o -name admins 2>/dev/null
find /home/asantopadre -type f -path "*/msp/signcerts/*" 2>/dev/null | grep -i admin
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/ca-client-orgdcms
fabric-ca-client register   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgdcms/admin
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054
asantopadre@beelink-fabric:~/ca-client-orgdcms$ tree
.
├── fabric-ca-client-config.yaml
└── msp
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgdcms/admin
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054
mkdir -p /home/asantopadre/fabric-deploy/orgdcms/admin/msp/tlscacerts
cp /home/asantopadre/ca-client-orgdcms/msp/tlscacerts/tls-ca-cert.pem    /home/asantopadre/fabric-deploy/orgdcms/admin/msp/tlscacerts/
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054
cd /home/asantopadre/fabric-deploy
tree
tree -L 2 /home/asantopadre/fabric-deploy/orgdcms/admin/msp
tree -L 2 /home/asantopadre/fabric-deploy/orgdcms/peers/peer1
tree -L 3 /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel fetch 0 /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050 -c canale1

peer channel fetch 0 canale1.block \ -o localhost:7050 \ -c canale1
peer channel fetch 0 /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050 -c canale1
kubectl exec -n orgdcms orderer1-8444799c85-wzwf2 -- env | grep ORDERER_GENERAL_TLS
openssl s_client -connect localhost:7050   -CAfile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
kubectl exec -n orgdcms orderer1-8444799c85-wzwf2 -- grep -A5 TLS /var/hyperledger/orderer/orderer.yaml
env | grep ORDERER_GENERAL_TLS
kubectl exec -n orgdcms orderer1-8444799c85-wzwf2 -- grep -A5 TLS /var/hyperledger/orderer/orderer.yaml
kubectl exec -n orgdcms orderer1-8444799c85-wzwf2 -- sh -lc 'env | grep -E "^ORDERER_GENERAL_(LISTENADDRESS|LISTENPORT|TLS_)"'
ss -lntp | grep 7050
peer channel fetch 0 /home/asantopadre/fabric-deploy/channels/canale1.block   -o orderer1-8444799c85-wzwf2.orgdcms.svc.cluster.local:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel fetch 0 /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
openssl x509   -in /home/asantopadre/fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem   -noout -subject
kubectl exec -n orgdcms orderer1-8444799c85-wzwf2 -- env | grep ORDERER_GENERAL_LOCALMSPID
kubectl get pvc -n orgdcms | grep orderer
kubectl exec -n orgdcms orderer1-8444799c85-wzwf2 -- ls /var/hyperledger/orderer
mkdir -p /home/asantopadre/fabric-deploy/ordererorg
kubectl cp -n orgdcms orderer1-8444799c85-wzwf2:/var/hyperledger/orderer/msp /home/asantopadre/fabric-deploy/ordererorg/msp
tree /home/asantopadre/fabric-deploy/ordererorg/msp
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/ordererorg/msp
export CORE_PEER_LOCALMSPID=OrdererMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/ordererorg/msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel fetch config /home/asantopadre/fabric-deploy/channels/canale1_config.pb   -o orderer1-8444799c85-wzwf2.orgdcms.svc.cluster.local:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel fetch config   /home/asantopadre/fabric-deploy/channels/canale1_config.pb   -o orderer1-8444799c85-wzwf2.orgdcms.svc.cluster.local:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel fetch config   /home/asantopadre/fabric-deploy/channels/canale1_config.pb   -o localhost:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
kubectl port-forward -n orgdcms svc/orderer1 7050:7050
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7054:7054
kubectl port-forward -n orgdcms svc/orderer1 7050:7050
kubectl get svc -n orgdcms
kubectl get pods -n orgdcms | grep orderer1
kubectl port-forward -n orgdcms pod/orderer1-8444799c85-wzwf2 7050:7050
kubectl port-forward -n orgdcms pod/orderer1-8444799c85-wzwf2 17053:7053
kubectl port-forward -n orgdcms pod/orderer2-5848b959fd-rl6q7 27053:7053
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 37053:7053
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ./channel-artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/fabric-deploy/configtx/channel-artifacts/canale1.block   -o orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   -o orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   -o orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
Verifica lo stato del canale
osnadmin channel list   -o orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/t
osnadmin channel list   -o orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   -o orderer3.orgx.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   -o orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
peer channel fetch 0   /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
kubectl port-forward -n orgdcms pod/orderer1-8444799c85-wzwf2 7050:7050
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
kubectl port-forward -n orgdcms deploy/orderer1 7050:7050
export FABRIC_CFG_PATH=~/fabric-samples/config
peer channel fetch 0   /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_TLS_ENABLED=true
peer channel fetch 0   /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
export CORE_PEER_LOCALMSPID=OrdererMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/msp
export CORE_PEER_TLS_ENABLED=true
peer channel fetch 0   /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_ADDRESS=peer1.orgdcms.svc.cluster.local:7051
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
peer channel join   -b /home/asantopadre/fabric-deploy/configtx/channel-artifacts/canale1.block
export CORE_PEER_ADDRESS=localhost:7051
peer channel join   -b /home/asantopadre/fabric-deploy/configtx/channel-artifacts/canale1.block
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_TLS_CLIENTAUTHREQUIRED=false
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/configtx/channel-artifacts/canale1.block
peer channel list
kubectl logs -n orgdcms deploy/orderer1
kubectl logs -n orgdcms deploy/orderer2
kubectl logs -n orgx    deploy/orderer3
peer channel list
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
configtxgen   -profile Canale1   -outputAnchorPeersUpdate /home/asantopadre/fabric-deploy/channels/OrgDCMSMSP-anchors.tx   -channelID canale1   -asOrg OrgDCMSMSP
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -outputAnchorPeersUpdate /home/asantopadre/fabric-deploy/channels/OrgDCMSMSP-anchors.tx   -channelID canale1   -asOrg OrgDCMSMSP
configtxgen   -profile Canale1   -outputAnchorPeersUpdate /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   -channelID canale1   -asOrg OrgDCMS
2026-02-07 18:35:34.175 UTC 000a FATA [common.tools.configtxgen] main -> Error on inspectChannelCreateTx: org 'OrgDCMS' does not have any anchor peers defined
kubectl svc -n orgdcms
kubectl get svc -n orgdcms
configtxgen   -profile Canale1   -outputAnchorPeersUpdate /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   -channelID canale1   -asOrg OrgDCMS
peer channel update   -o localhost:7050   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
unset FABRIC_CFG_PATH
peer channel update   -o localhost:7050   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
2026-02-07 18:54:54.579 UTC 0001 ERRO [main] InitCmd -> Fatal error when initializing core config : error when reading core config file: Config File "core" Not Found in "[/home/asantopadre]"
mkdir -p /home/asantopadre/fabric-deploy/peer-config
cp /path/to/fabric/sampleconfig/core.yaml /home/asantopadre/fabric-deploy/peer-config/core.yaml
mkdir -p /home/asantopadre/fabric-deploy/peer-config
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
peer channel update   -o localhost:7050   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
peer channel update   -o localhost:7050   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel update   -o localhost:7050   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
cd fabric-deploy/orgdcms
# 1) Issuer del tuo admin usato per firmare
openssl x509 -in /home/asantopadre/fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem -noout -issuer -subject
# 2) CA del canale per OrgDCMS (quella in MSPDir usata in configtxgen)
ls -l /home/asantopadre/fabric-deploy/configtx/orgdcms/msp/cacerts
openssl x509 -in /home/asantopadre/fabric-deploy/configtx/orgdcms/msp/cacerts/*.pem -noout -subject
openssl x509 -in /home/asantopadre/fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem -noout -issuer -subject
ls -l /home/asantopadre/fabric-deploy/configtx/orgdcms/msp/cacerts
openssl x509 -in /home/asantopadre/fabric-deploy/configtx/orgdcms/msp/cacerts/*.pem -noout -subject
openssl x509   -in /home/asantopadre/fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem   -noout -issuer -subject
openssl x509   -in /home/asantopadre/fabric-deploy/configtx/orgdcms/msp/cacerts/*.pem   -noout -subject
openssl x509   -in /home/asantopadre/ca-client-orgdcms/msp/signcerts/cert.pem   -noout -issuer -subject
openssl x509   -in /home/asantopadre/fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem   -noout -issuer -subject
kubectl get pods -A | grep ca
kubectl get svc -A | grep ca
tree fabric-deploy/orgdcms/admin/msp
openssl x509 -in signcerts/cert.pem -noout -issuer -subject
cd ~/
tree fabric-deploy/orgdcms/admin/msp
openssl x509 -in signcerts/cert.pem -noout -issuer -subject
tree /home/asantopadre/fabric-deploy/orgdcms/admin/msp
openssl x509   -in /home/asantopadre/fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem   -noout -issuer -subject
cd /home/asantopadre/fabric-deploy/orgdcms/peers/peer1
tree
openssl x509 -in /home/asantopadre/fabric-deploy/peer1-orgdcms/msp/signcerts/cert.pem -noout -issuer -subject
cd
kubectl get pods -n dcms
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
kubectl port-forward -n orgdcms deployment/orderer1 9443:9443
kubectl -n monitoring port-forward svc/kps-grafana 3000:80
openssl x509  -in fabric-deploy/orgdcms/admin/msp/signcerts/cert.pem  -noout -issuer -subject
export ORGMSP=/home/asantopadre/fabric-deploy/configtx/orgdcms/msp
rm -rf "$ORGMSP"
mkdir -p "$ORGMSP"/{cacerts,tlscacerts}
cp /home/asantopadre/fabric-deploy/orgdcms/admin/msp/cacerts/*.pem    "$ORGMSP/cacerts/"
cp /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt    "$ORGMSP/tlscacerts/tls-ca-cert.pem"
cp /home/asantopadre/fabric-deploy/orgdcms/admin/msp/config.yaml    "$ORGMSP/config.yaml"
tree "$ORGMSP"
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
ls $FABRIC_CFG_PATH/configtx.yaml
configtxgen -inspectChannelCreateTx /dev/null 2>&1 | grep Canale1
configtxgen -printOrg OrgDCMS
configtxgen -profile Canale1 -channelID test -outputBlock /tmp/test.block
rm /tmp/test.block
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1.block
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/fabric-deploy/channels/canale1.block   -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
peer channel getinfo -c canale1
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel update   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors.tx   -o orderer1.orgdcms.svc.cluster.local:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-Anchors.tx   -o orderer1.orgdcms.svc.cluster.local:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   -o orderer1.orgdcms.svc.cluster.local:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
Error: got unexpected status: FORBIDDEN -- config update for existing channel did not pass initial checks: implicit policy evaluation failed - 0 sub-policies were satisfied, but this policy requires 1 of the 'Writers' sub-policies to be satisfied: permission denied
peer channel update   -c canale1   -f /home/asantopadre/fabric-deploy/channels/OrgDCMS-anchors.tx   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1_v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1_v2.block
osnadmin channel join   --channelID canale1_v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1_v2.block   -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1_v2.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1_v2.block
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1_v2   -asOrg OrgDCMS   -outputAnchorPeersUpdate   /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_v2.tx
peer channel update   -c canale1_v2   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_v2.tx   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel update   -c canale1_v2   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_v2.tx   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1_v2   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_v2.tx   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen -profile Canale1 -channelID canale1v2 -asOrg OrgDCMS   -outputAnchorPeersUpdate /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_canale1v2.tx
peer channel update -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_canale1v2.tx   -o localhost:7050 --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
peer channel update -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_canale1v2.tx   -o localhost:7050 --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -asOrg OrgDCMS   -outputAnchorPeersUpdate   /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_canale1v2.tx
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
peer channel update   -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgDCMSAnchors_canale1v2.tx   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
peer channel fetch config config_block.pb   -c canale1v2   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem   --ordererTLSHostnameOverride orderer1.orgdcms.svc.cluster.local
configtxlator proto_decode   --input config_block.pb   --type common.Block   --output config_block.json
jq .data.data[0].payload.data.config config_block.json > config.json
jq '
 .channel_group.groups.Application.groups.OrgDCMS.values += {
   "AnchorPeers": {
     "mod_policy": "Admins",
     "value": {
       "anchor_peers": [
         {
           "host": "peer1.orgdcms.svc.cluster.local",
           "port": 7051
         }
       ]
     },
     "version": 0
   }
 }
' config.json > config_modified.json
configtxlator proto_encode   --input config.json   --type common.Config   --output config.pb
configtxlator proto_encode   --input config_modified.json   --type common.Config   --output config_modified.pb
configtxlator compute_update   --channel_id canale1v2   --original config.pb   --updated config_modified.pb   --output anchor_update.pb
jq '.channel_group.groups.Application.groups.OrgDCMS.values.AnchorPeers' config.json
kubectl get pods -n orgdcms | grep ca


kubectl delete pods inspect-ca-data
kubectl get pods -n orgdcms | grep ca

kubectl delete pods -n orgdcms inspect-ca-data
kubectl delete pods -n orgdcms fabric-ca-orgdcms-init-4gcgh
kubectl get pods -n orgdcms | grep orderer
kubectl get pods -n orgdcms | grep peer
kubectl delete pods -n orgdcms pvc-shell-peer1-msp
osnadmin channel list
osnadmin
osnadmin --help
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/*_sk
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer1-dcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-orgdcm/tls/keystore/*_sk
osnadmin channel list   --orderer-address localhost:7053   --ca-file fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/*_sk
kubectl port-forward -n orgx svc/orderer3 8053:7053
osnadmin channel list   --orderer-address localhost:8053   --ca-file fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/*_sk
snadmin channel list   --orderer-address localhost:8053   --ca-file fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/*_sk
osnadmin channel list   --orderer-address localhost:8053   --ca-file fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/*_sk
kubectl logs -n orgdcms orderer1 | grep -i canale1v2
kubectl get secret -n monitoring -l app.kubernetes.io/component=admin-secret -o jsonpath="{.items[0].data.admin-password}" | base64 --decode ; echo
kubectl exec -n orgdcms orderer1 -- env | grep METRICS
kubectl edit deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms | grep orderer
kubectl port-forward -n orgdcms svc/peer1 7051:7051
kubectl port-forward -n orgdcms deploy/orderer1 7053:7053
kubectl port-forward -n orgdcms deploy/orderer1 7050:7050
kubectl port-forward -n orgdcms deploy/orderer1 7053:7053
kubectl port-forward -n orgdcms deploy/orderer2 7053:7053
kubectl port-forward -n orgx deploy/orderer3 7053:7053
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
kubectl port-forward -n orgdcms deploy/orderer1 7050:7050
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgx svc/orderer3 8053:7053
curl http://localhost:9443/metrics
peer channel fetch newest /tmp/canale1v2.block -c canale1v2
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer version
peer channel list
cd ~/fabric-samples/asset-transfer-basic/chaincode-go
peer lifecycle chaincode package basic.tar.gz --path . --lang golang --label basic_1.0
peer lifecycle chaincode package basic.tar.gz   --path ./chaincode/basic   --lang golang   --label basic_1
tree
sudo apt update
sudo apt install -y golang-go
go version
peer lifecycle chaincode package basic.tar.gz --path . --lang golang --label basic_1.0
go version
peer lifecycle chaincode package basic.tar.gz --path . --lang golang --label basic_1.0
peer lifecycle chaincode install basic.tar.gz
cd ~/
sudo mkdir -p /opt/hyperledger/ccaas
sudo chmod 755 /opt/hyperledger/ccaas
sudo mkdir -p /opt/hyperledger/ccaas
sudo chmod 755 /opt/hyperledger/ccaas
kubectl edit deployment peer1 -n orgdcms
kubectl exec -n orgdcms peer1 -- ls /opt/hyperledger/ccaas
kubectl get pods -n dcms
peer channel list
kubectl get svc -n orgdcms
kubectl get pods -n dcms
kubectl get pods -n orgdcms
kubectl exec -n orgdcms peer1-cd78c9db4-h8xn6 -- ls /opt/hyperledger/ccaas
peer lifecycle chaincode package basic.tar.gz --path . --lang golang --label basic_1.0
cd ~/fabric-samples/asset-transfer-basic/chaincode-go
peer lifecycle chaincode package basic.tar.gz   --path .   --lang external   --label basic_1
cd ~/
mkdir -p external-basic
cat > external-basic/metadata.json <<EOF
{
  "type": "external",
  "label": "basic_1"
}
EOF

cd ~/fabric-samples/asset-transfer-basic/chaincode-go
peer lifecycle chaincode package basic.tar.gz   --path external-basic   --lang external   --label basic_1
cd ~/fabric-samples/asset-transfer-basic
mkdir -p external-basic
cat > external-basic/metadata.json <<EOF
{
  "type": "external",
  "label": "basic_1"
}
EOF

peer lifecycle chaincode package basic.tar.gz   --path external-basic   --lang external   --label basic_1
peer lifecycle chaincode package basic.tar.gz   --path external-basic   --label basic_1
peer lifecycle chaincode package basic.tar.gz   --path external-basic   --label basic_1
cd /home/asantopadre/fabric-samples/asset-transfer-basic
peer lifecycle chaincode package basic.tar.gz   --path ./external-basic   --lang external   --label basic_1
peer lifecycle chaincode package basic.tar.gz   --path ./external-basic   --lang external   --label basic_1
peer lifecycle chaincode package basic.tar.gz   --path ./external-basic   --lang golang   --label basic_1
cd ~/
kubectl apply -f ~/fabric-2.5/manifests/fabric-toool-orgdcms.yaml
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f fabric-tools-orgdcms.yaml
kubectl apply -f ~/fabric-2.5/manifests/fabric-toool-orgdcms.yaml
kubectl delete pod -n orgdcms fabric-tools
kubectl apply -f ~/fabric-2.5/manifests/fabric-toool-orgdcms.yaml
Poi:
kubectl get pods -n orgdcms

kubectl get pods -n orgdcms
kubectl describe pod -n orgdcms fabric-tools
kubectl apply -f ~/fabric-2.5/manifests/fabric-toool-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl describe pod -n orgdcms fabric-tools
kubectl delete pod -n orgdcms fabric-tools

kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- ls /etc/hyperledger/fabric/tlscacerts
kubectl exec -n orgdcms -it fabric-tools -- bash
cp /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/tls-ca/peer-tls-ca.pem
cp /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tlscacert/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/tls-ca/peer-tls-ca.pem
cp /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tlscacerts/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/tls-ca/peer-tls-ca.pem
cp /home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/tlscacerts/tls-localhost-7054.pem  /home/asantopadre/fabric-deploy/tls-ca/peer-tls-ca.pem
kubectl delete pod -n orgdcms fabric-tools
kubectl apply -f ~/fabric-2.5/manifests/fabric-tools-orgdcms.yaml
kubectl exec -n orgdcms -it fabric-tools -- bash
peer channel list
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 37053:7053
kubectl port-forward -n orgdcms pod/orderer2-5848b959fd-rl6q7 27053:7053
kubectl delete pod -n orgdcms fabric-tools
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl delete pod -n orgdcms fabric-tools
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgdcms.yaml

kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgdcms -it deploy/peer1 -- env | grep EXTERNAL
kubectl exec -n orgdcms -it fabric-tools -- bash
sudo mkdir -p /opt/hyperledger/ccaas/bin
sudo tee /opt/hyperledger/ccaas/bin/detect >/dev/null <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
METADIR="$2"
grep -q '"type"[[:space:]]*:[[:space:]]*"ccaas"' "$METADIR/metadata.json"
EOF

sudo tee /opt/hyperledger/ccaas/bin/build >/dev/null <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
SRCDIR="$1"
BUILDDIR="$3"
mkdir -p "$BUILDDIR"
tar -xzf "$SRCDIR/code.tar.gz" -C "$BUILDDIR"
EOF

sudo tee /opt/hyperledger/ccaas/bin/release >/dev/null <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
BUILDDIR="$1"
RELEASEDIR="$2"
mkdir -p "$RELEASEDIR"
cp -a "$BUILDDIR/." "$RELEASEDIR/"
EOF

sudo tee /opt/hyperledger/ccaas/bin/run >/dev/null <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
# CCaaS: il chaincode gira esternamente; il peer usa connection.json dal release dir.
tail -f /dev/null
EOF

sudo chmod +x /opt/hyperledger/ccaas/bin/*
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl get pods -n orgdcms
ls -l /opt/hyperledger/ccaas/bin
ls
ls -l
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
sudo nano /opt/hyperledger/ccaas/bin/build
sudo chmod +x /opt/hyperledger/ccaas/bin/build
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl logs -n orgdcms deploy/peer1 | tail -50
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
sudo nano /opt/hyperledger/ccaas/bin/build
sudo chmod +x /opt/hyperledger/ccaas/bin/build
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
kubectl exec -n orgdcms -it fabric-tools -- bash
sudo nano /opt/hyperledger/ccaas/bin/build
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
sudo nano /opt/hyperledger/ccaas/bin/build
sudo chmod +x /opt/hyperledger/ccaas/bin/build
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
sudo nano /opt/hyperledger/ccaas/bin/build
sudo chmod +x /opt/hyperledger/ccaas/bin/build
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -50
sudo nano /opt/hyperledger/ccaas/bin/build
sudo chmod +x /opt/hyperledger/ccaas/bin/build
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
kubectl exec -n orgdcms -it fabric-tools -- bash
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
kubectl get deployment peer1 -n orgdcms -o yaml | grep -A20 production
kubectl get pvc -n orgdcms
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/peer1-pvc.yaml
kubectl rollout restart deployment/peer1 -n orgdcms
kubectl get pvc -n orgdcms
kubectl exec -n orgdcms -it deploy/peer1 -- ls /var/hyperledger/production
kubectl exec -n orgdcms -it deploy/peer1 -- ls /var/hyperledger/production/ledgersData/chains
kubectl exec -n orgdcms -it deploy/peer1 -- ls /var/hyperledger/production/ledgersData/chains/chains
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl delete pod -n orgdcms fabric-tools
kubectl apply -f fabric-tools-orgdcms.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgdcms.yaml
kubectl exec -n orgdcms -it fabric-tools -- bash
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -outputBlock canale1v2.block   -channelID canale1v2
cd /home/asantopadre/fabric-deploy/configtx/orderers
tree
cd ~/
cd /home/asantopadre/fabric-deploy/osnadmin
tree
cd ~/
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl get pods -dcms
kubectl get pods -n orgdcms
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl get pods -n orgx
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list --channelID canale1v2
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -outputBlock canale1v2.block   -channelID canale1v2
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl exec -n orgdcms <peer1-pod> -- printenv | grep EXTERNAL
kubectl get pod -n orgdcms
kubectl exec -n orgdcms peer1-58dfddfb88-pz8gm -- printenv | grep EXTERNAL
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f basic-ccaas.yaml
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp orgdcms/fabric-tools:/chaincode/basiccc   /home/asantopadre/fabric-deploy/ccaas/basiccc
cd /home/asantopadre/fabric-deploy/ccaas
cd ~/
kubectl apply -f /home/asantopadre/deployment-CCAASS.yaml
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get pods -n orgdcms
kubectl exec -n orgdcms peer1-58dfddfb88-pz8gm -- ls -l /opt/hyperledger/ccaas/bin
kubectl exec -n orgdcms peer1-58dfddfb88-pz8gm -- cat /etc/hyperledger/fabric/core.yaml | grep externalBuilders -A5
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl apply -f /home/asantopadre/deployment-CCAASS.yaml
kubectl get pods -n orgdcms -l app=basic-ccaas
kubectl delete pods -n orgdcms -l app=basic-ccaas
kubectl apply -f /home/asantopadre/deployment-CCAASS.yaml
kubectl get pods -n orgdcms -l app=basic-ccaas
kubectl exec -n orgdcms -it fabric-tools -- bash
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block
osnadmin channel remove   --channelID canale1   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
peer channel fetch config config_block.pb   -o orderer1.orgdcms.svc.cluster.local:7050   -c canale1v2   --tls   --cafile /etc/hyperledger/fabric/tlscacerts/orderer1-tls-ca.pem
export FABRIC_CFG_PATH=/etc/hyperledger/fabric
peer channel fetch config config_block.pb   -o orderer1.orgdcms.svc.cluster.local:7050   -c canale1v2   --tls   --cafile /etc/hyperledger/fabric/tlscacerts/orderer1-tls-ca.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl rollout restart deploy/peer1 -n orgdcms
kubectl rollout status deploy/peer1 -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
peer channel list
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl get pvc -n orgdcms
kubectl get pod -n orgdcms -l app=peer1
kubectl describe pod peer1-5c97f758c4-gzgfd -n orgdcm
kubectl get pvc -n orgdcms
kubectl rollout restart deployment peer1 -n orgdcms
kubectl get pvc -n orgdcms
kubectl exec -n orgdcms -it  peer1-5c97f758c4-gzgfd -- ls /var/hyperledger/production
kubectl get pod -n orgdcms
kubectl exec -n orgdcms -it  peer1-7cddd47d9d-nn658 -- ls /var/hyperledger/production
kubectl get pvc -n orgdcms
kubectl delete pod peer1-7cddd47d9d-nn658
kubectl get pod -n orgdcms
kubectl describe pvc peer1-orgdcms-ledger-pvc -n orgdcms
kubectl get storageclass
kubectl get pods -n kube-system | grep local-path
kubectl get pod -n orgdcms
kubectl describe pod peer1-7cddd47d9d-nn658 -n orgdcms
kubectl get deployment peer1 -n orgdcms -o yaml | grep -A5 production
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl rollout restart deployment peer1 -n orgdcms
kubectl get pod -n orgdcms
kubectl get deployment peer1 -n orgdcms
kubectl get pod -n orgdcms
kubectl delete pod peer1-9dbdb84d6-f59p5[D
kubectl delete pod -n orgdcms peer1-9dbdb84d6-f59p5
kubectl delete pod -n orgdcms peer1-5c67c7678d-mq65j
kubectl get pod -n orgdcms

kubectl get pvc -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl port-forward -n orgdcms svc/peer1 7051:7051
kubectl exec -n orgdcms -it fabric-tools -- mkdir -p /channels
kubectl cp /home/asantopadre/fabric-deploy/channels/canale1v2.block orgdcms/fabric-tools:/channels/canale1v2.block
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/orderer1 | grep -i lifecycle

kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | grep -i deliver
kubectl port-forward -n orgx svc/orderer1 37053:7053
kubectl port-forward -n orgx svc/orderer3 37053:7053
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl port-forward -n orgx svc/orderer3 37053:7053
kubectl get pod -n orgdcms
kubectl port-forward -n orgdcms pod/orderer1-5bc569d958-qtkw2 17053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 17053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 17053:7053
kubectl port-forward -n orgdcms svc/orderer2 27053:7053
kubectl get svc -n orgdcms
kubectl get svc -n orgx
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp   /home/asantopadre/fabric-deploy/channels/canale1v2.block   orgdcms/fabric-tools:/channel-blocks/canale1v2.block
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl cp /home/asantopadre/fabric-deploy/channels/canale1v2.block orgdcms/fabric-tools:/tmp/channel-blocks/canale1v2.block
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl scale deploy peer1 --replicas=0 -n orgdcms
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms | grep peer1
kubectl delete pvc peer1-orgdcms-ledger-pvc -n orgdcms
kubectl get pvc -n orgdcms
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/peer1-pvc.yaml
kubectl scale deploy peer1 -n orgdcms --replicas=1
kubectl get pvc -n orgdcms
kubectl get pod -n orgdcms
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | grep orderer
kubectl exec -n orgdcms -it fabric-tools -- bash
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:17053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join --channelID canale1v2 --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block --orderer-address orderer1.orgdcms.svc.cluster.local:17053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:17053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/orderer1 | tail -n 40
kubectl logs -n orgx deploy/orderer3 | tail -n 40
kubectl logs -n orgdcms deploy/peer1 | tail -n 60
kubectl exec -n orgx -it deploy/orderer3 -- sh -c 'grep -n "LocalMSPID" -n /var/hyperledger/orderer/orderer.yaml || true'
kubectl exec -n orgx -it deploy/orderer3 -- sh -c 'grep -n "General.LocalMSPID" -n /var/hyperledger/orderer/orderer.yaml || true'
kubectl exec -n orgx -it deploy/orderer3 -- printenv | grep LOCALMSP
kubectl get deploy orderer3 -n orgx -o yaml | grep LOCALMSP -n
kubectl exec -n orgx -it deploy/orderer2 -- printenv | grep LOCALMSP
kubectl exec -n orgdcms -it deploy/orderer2 -- printenv | grep LOCALMSP
kubectl exec -n orgdcms -it deploy/orderer1 -- printenv | grep LOCALMSP
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl rollout restart deploy/orderer2 -n orgdcms
kubectl rollout restart deploy/orderer3 -n orgx
kubectl exec -n orgdcms -it deploy/orderer1 -- printenv | grep LOCALMSP
kubectl logs -n orgdcms deploy/orderer1 | tail -n 40
kubectl logs -n orgx deploy/orderer3 | tail -n 40
kubectl logs -n orgdcms deploy/orderer1 | tail -n 40
kubectl logs -n orgdcms deploy/orderer2 | tail -n 40
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:17053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join --channelID canale1v2 --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block --orderer-address orderer1.orgdcms.svc.cluster.local:17053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/orderer2 | tail -n 40
kubectl logs -n orgdcms deploy/orderer1 | tail -n 40
kubectl get deploy orderer2 -n orgdcms -o yaml | grep -n Admin -n
kubectl get deploy orderer1 -n orgdcms -o yaml | grep -n Admin -n
kubectl get svc orderer2 -n orgdcms -o yaml
osnadmin channel list   --orderer-address localhost:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address localhost:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/orderer1 | tail -n 40
kubectl logs -n orgdcms deploy/orderer | tail -n 40
nslookup orderer3.orgx.svc.cluster.local
nslookup orderer2.orgdcms.svc.cluster.local
nslookup orderer1.orgdcms.svc.cluster.local
kubectl logs -n orgdcms deploy/peer1 | tail -n 60
kubectl exec -n orgdcms -it fabric-tools -- bash
cat /etc/hosts | grep orderer
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | tail -n 60
peer channel getinfo -c canale1v2
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/peer1 | grep -i MSP -A 3
kubectl logs -n orgdcms deploy/peer1 | tail -n 40
kubectl apply -f kubectl apply -f orderer1-deployment.yaml
kubectl apply /home/asantopadre/fabric-2.5/manifests/orderer1.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer1.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer2.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer3.yaml
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address localhost:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address localhost:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer3.orgx.svc.cluster.local:37053  --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/peer1 | grep DeliverBlocks
kubectl logs -n orgdcms deploy/orderer1 | tail -n 40
kubectl logs -n orgdcms deploy/orderer2 | tail -n 40
kubectl logs -n orgx deploy/orderer3 | tail -n 40
kubectl logs -n orgdcms deploy/orderer2 | tail -n 40
kubectl get pods -n orgdcms
kubectl exec -n orgdcms deploy/orderer2 -- sh -c 'getent hosts orderer1.orgdcms.svc.cluster.local; nc -zvw3 orderer1.orgdcms.svc.cluster.local 7050 || true'
kubectl exec -n orgdcms deploy/orderer1 -- env | grep ORDERER_GENERAL_LOCALMSPID
kubectl exec -n orgdcms deploy/orderer2 -- env | grep ORDERER_GENERAL_LOCALMSPID
kubectl exec -n orgx deploy/orderer3     -- env | grep ORDERER_GENERAL_LOCALMSPID
kubectl exec -n orgdcms -it fabric-tools -- bash -lc 'peer channel fetch config /tmp/cfg.block -o orderer1.orgdcms.svc.cluster.local:7050 -c canale1v2 --tls --cafile /etc/hyperledger/fabric/tlscacerts/orderer1-tls-ca.pem && echo OK'
kubectl exec -n orgdcms -it fabric-tools -- bash -lc 'peer channel fetch config /tmp/cfg.block -o orderer1.orgdcms.svc.cluster.local:7050 -c canale1v2 --tls --cafile /etc/hyperledger/fabric/tlscacerts/orderer2-tls-ca.pem && echo OK'
kubectl exec -n orgdcms -it fabric-tools -- bash
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:27053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:17053 --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-localhost-7054.pem --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/orderer1 | grep "Writing block"
kubectl logs -n orgdcms deploy/orderer2 | grep "Writing block"
kubectl logs -n orgx deploy/orderer3 | grep "Writing block"
kubectl get pvc -n orgdcms | grep orderer
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl logs -n orgdcms deploy/orderer2 | tail -n 10
kubectl exec -n orgdcms -it fabric-tools -- bash
kubectl port-forward -n orgdcms svc/fabric-tls-ca 7054:7054
kubectl port-forward -n orgx svc/fabric-ca-orgx 7054:7054
kubectl port-forward -n orgdcms svc/fabric-tls-ca 7054:7054
kubectl port-forward -n orgx svc/fabric-ca-orgx 7054:7054
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get pvc -n orgx
kubectl get svc -n orgx
kubectl delete deploy,svc,job -n orgx -l app=fabric-ca-orgx --ignore-not-found
kubectl get svc -n orgx
kubectl get deploy,svc,job -n orgx --show-labels
kubectl delete deploy fabric-ca-orgx -n orgx --ignore-not-found
kubectl delete svc fabric-ca-orgx -n orgx --ignore-not-found
kubectl delete job fabric-ca-orgx-init -n orgx --ignore-not-found
kubectl get all -n orgx
kubectl delete job --all -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx-pvc.yaml
kubectl get pvc -n orgx
kubectl delete fabric-ca-orgx-pvc -n orgx
kubectl delete pvc fabric-ca-orgx-pvc -n orgx
kubectl get pvc -n orgx
kubectl patch pvc fabric-ca-orgx-pvc -n orgx   -p '{"metadata":{"finalizers":null}}'
kubectl delete pvc fabric-ca-orgx-pvc -n orgx
kubectl get pvc -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx-pvc.yaml
kubectl get pvc -n orgx
kubectl get storageclass
kubectl describe pvc fabric-ca-orgx-pvc -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx-init.yaml
kubectl wait --for=condition=complete job/fabric-ca-orgx-init -n orgx
kubectl logs job/fabric-ca-orgx-init -n orgx
kubectl run inspect-ca-data -n orgx --restart=Never --image=busybox  --overrides='{"spec":{"restartPolicy":"Never","containers":[{"name":"c","image":"busybox","command":["sh","-c","sleep 36000"],"volumeMounts":[{"name":"v","mountPath":"/data"}]}],"volumes":[{"name":"v","persistentVolumeClaim":{"claimName":"fabric-ca-orgx-pvc"}}]}}'
kubectl exec -it inspect-ca-data -n orgx -- sh
# ls -l data
kubectl get pvc -n orgx
kubectl run inspect-ca-data -n orgx --restart=Never --image=busybox --overrides='{"spec":{"restartPolicy":"Never","containers":[{"name":"c","image":"busybox","command":["sh","-c","sleep 36000"],"volumeMounts":[{"name":"v","mountPath":"/data"}]}],"volumes":[{"name":"v","persistentVolumeClaim":{"claimName":"fabric-ca-orgx-pvc"}}]}}'
kubectl get pods -n orgx
kubectl exec -it inspect-ca-data -n orgx -- sh
kubectl delete pod inspect-ca-data -n orgx
kubectl get deploy fabric-ca-orgdcms -n orgdcms -o yaml
kubectl get secret fabric-ca-orgx-tls -n orgx
kubectl get pvc -n orgdcms
kubectl run inspect-tls-ca -n orgdcms --restart=Never --image=busybox --overrides='{"spec":{"restartPolicy":"Never","containers":[{"name":"c","image":"busybox","command":["sh","-c","sleep 36000"],"volumeMounts":[{"name":"v","mountPath":"/data"}]}],"volumes":[{"name":"v","persistentVolumeClaim":{"claimName":"fabric-tls-ca-pvc"}}]}}'
kubectl exec -it inspect-tls-ca -n orgdcms -- sh
ls -d ~/*tls*
ls -d ~/fabric-*/*
ls -d ~/*tls*
find ~/fabric-deploy -type d -name "msp"
cd /home/asantopadre/ca-client-orgdcms
tree
cd ~/
kubectl get pods -n orgdcms
ls -R /home/asantopadre/fabric-deploy/ca
/home/asantopadre/ca-client-orgdcms
cd //home/asantopadre/ca-client-orgdcms
cd `/
cd ~/
/home/asantopadre/ca-client-orgdcms
tree
cd /home/asantopadre/ca-client-orgdcms
tree
cd ~/
mkdir -p ~/fabric-clients
mv ~/ca-client-orgdcms ~/fabric-clients/ca-orgdcms-admin
mkdir -p ~/fabric-clients/tls-ca-admin
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/tls-ca-admin
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
kubectl get pods -n orgdcms
kubectl exec -it fabric-tls-ca-666c69bb4d-f6b7r -n orgdcms -- sh
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/tls-ca-admin
fabric-ca-client enroll   -u https://boot:bootpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
rm -rf ~/fabric-clients/tls-ca-admin
mkdir -p ~/fabric-clients/tls-ca-admin
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/tls-ca-admin
fabric-ca-client enroll   -u https://boot:bootpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/tls-ca-admin
fabric-ca-client register   --id.name fabric-ca-orgx   --id.secret fabric-ca-orgxpw   --id.type server   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
kubectl get svc -n orgdcms
mkdir -p ~/fabric-clients/fabric-ca-orgx-tls
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/fabric-ca-orgx-tls
fabric-ca-client enroll   -u https://fabric-ca-orgx:fabric-ca-orgxpw@localhost:7054   --enrollment.profile tls   --csr.hosts fabric-ca-orgx   --csr.hosts fabric-ca-orgx.orgx   --csr.hosts fabric-ca-orgx.orgx.svc   --csr.hosts fabric-ca-orgx.orgx.svc.cluster.local   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
ls -R ~/fabric-clients/fabric-ca-orgx-tls
kubectl get pods -n orgx
kubectl get pvc -n orgx
cd ~/fabric-clients/fabric-ca-orgx-tls/ms
cd /home/asantopadre/fabric-clients
cd ~/fabric-clients/fabric-ca-orgx-tls/msp
TLS_CERT=~/fabric-clients/fabric-ca-orgx-tls/msp/signcerts/cert.pem
TLS_KEY=$(ls ~/fabric-clients/fabric-ca-orgx-tls/msp/keystore/*_sk)
echo $TLS_CERT
echo $TLS_KEY
kubectl create secret generic fabric-ca-orgx-tls -n orgx   --from-file=cert.pem=$TLS_CERT   --from-file=key.pem=$TLS_KEY
kubectl get secret fabric-ca-orgx-tls -n orgx
cd ~/
kubectl get deployment fabric-ca-orgdcms -n orgdcms -o yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgdcms.yaml
kubectl get pods -n orgx
kubectl logs -n orgx deploy/fabric-ca-orgx
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx.yaml
kubectl get pods -n orgx
kubectl logs -n orgx deploy/fabric-ca-orgx
cd /home/asantopadre/fabric-clients
tree -1
tree 1
tree -L
tree -L 1
kubectl get secret fabric-ca-orgdcms-tls -n orgdcms
kubectl get secret fabric-ca-orgdcms-tls -n orgdcms   -o jsonpath='{.data.cert\.pem}' | base64 -d > ~/fabric-clients/fabric-ca-orgdcms-tls-cert.pem
kubectl get secret fabric-ca-orgdcms-tls -n orgdcms   -o jsonpath='{.data.key\.pem}' | base64 -d > ~/fabric-clients/fabric-ca-orgdcms-tls-key.pem
mkdir -p ~/fabric-clients/fabric-ca-orgdcms-tls/msp/{signcerts,keystore}
mv ~/fabric-clients/fabric-ca-orgdcms-tls-cert.pem    ~/fabric-clients/fabric-ca-orgdcms-tls/msp/signcerts/cert.pem
mv ~/fabric-clients/fabric-ca-orgdcms-tls-key.pem    ~/fabric-clients/fabric-ca-orgdcms-tls/msp/keystore/server_sk
openssl x509 -in ~/fabric-clients/fabric-ca-orgdcms-tls/msp/signcerts/cert.pem   -noout -subject -issuer
openssl x509 -in ~/fabric-clients/fabric-ca-orgdcms-tls/msp/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
mkdir -p ~/fabric-clients/ca-orgx-admin
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/ca-orgx-admin
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/tls-ca-admin
rm -rf ~/fabric-clients/fabric-ca-orgx-tls
mkdir -p ~/fabric-clients/fabric-ca-orgx-tls
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/fabric-ca-orgx-tls
fabric-ca-client enroll   -u https://fabric-ca-orgx:fabric-ca-orgxpw@localhost:7054   --enrollment.profile tls   --csr.hosts fabric-ca-orgx   --csr.hosts fabric-ca-orgx.orgx   --csr.hosts fabric-ca-orgx.orgx.svc   --csr.hosts fabric-ca-orgx.orgx.svc.cluster.local   --csr.hosts localhost   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
kubectl delete secret fabric-ca-orgx-tls -n orgx
TLS_CERT=~/fabric-clients/fabric-ca-orgx-tls/msp/signcerts/cert.pem
TLS_KEY=$(ls ~/fabric-clients/fabric-ca-orgx-tls/msp/keystore/*_sk)
kubectl create secret generic fabric-ca-orgx-tls -n orgx   --from-file=cert.pem=$TLS_CERT   --from-file=key.pem=$TLS_KEY
kubectl rollout restart deployment fabric-ca-orgx -n orgx
kubectl logs -n orgx deploy/fabric-ca-orgx
openssl x509 -in ~/fabric-clients/fabric-ca-orgx-tls/msp/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
export FABRIC_CA_CLIENT_HOME=~/fabric-clients/ca-orgx-admin
mkdir -p $FABRIC_CA_CLIENT_HOME
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
peer channel fetch config config_block.pb   -o orderer1.orgdcms.svc.cluster.local:7050   -c canale1   --tls   --cafile /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl cp orgdcms/fabric-tools:/config_block.pb .
configtxlator proto_decode   --input config_block.pb   --type common.Block   --output config_block.json
kubectl cp orgdcms/fabric-tools:/config_block.pb
kubectl cp orgdcms/fabric-tools:/config_block.pb ./config_block.pb
ls -l config_block.pb
configtxlator proto_decode   --input config_block.pb   --type common.Block   --output config_block.json
jq '.data.data[0].payload.data.config.channel_group.groups.Application.groups | keys' config_block.json
cd ~/
kubectl get pods -n orgx
ls /home/asantopadre/fabric-clients/ca-orgx-admin/msp/keystore
openssl x509 -noout -subject -in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/signcerts/cert.pem
openssl x509 -noout -modulus -in msp/signcerts/cert.pem | openssl md5
openssl rsa  -noout -modulus -in msp/keystore/NOME_CHIAVE_sk | openssl md5
openssl x509 -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/signcerts/cert.pem | openssl md5
openssl rsa -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/keystore/06ca3fce285c501975dea914ae54ca5e2b916d5537f784630a4a6a934b0e7484_sk | openssl md5
openssl rsa -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/keystore/afc4ad2db77e78eecf004b68a9cb37b25ccab584acd8f0e7312999b378f21ad1_sk | openssl md5
openssl pkey -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/keystore/06ca3fce285c501975dea914ae54ca5e2b916d5537f784630a4a6a934b0e7484_sk | openssl md5
openssl x509 -in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/signcerts/cert.pem -pubkey -noout | openssl pkey -pubin -outform DER | openssl sha256
for k in /home/asantopadre/fabric-clients/ca-orgx-admin/msp/keystore/*_sk; do   echo "== $k";   openssl pkey -in "$k" -pubout   | openssl pkey -pubin -outform DER   | openssl sha256; done
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/ca-orgx-admin
ls /home/asantopadre/fabric-clients/ca-orgx-admin/msp/signcerts
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   -u https://localhost:7054
mkdir -p /home/asantopadre/fabric-clients/ca-orgx-admin/msp/tlscacerts
cp /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem /home/asantopadre/fabric-clients/ca-orgx-admin/msp/tlscacerts/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/ca-orgx-admin
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   -u https://localhost:7054
mkdir -p /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/tlscacerts
cp /home/asantopadre/fabric-clients/ca-orgx-admin/msp/tlscacerts/tls-ca-cert.pem /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/tlscacerts/tls-ca-cert.pem
cat > /home/asantopadre/fabric-deploy/orgx/peers/peer2/fabric-ca-client-config.yaml <<EOF
tls:
  enabled: true
  certfiles:
    - /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/tlscacerts/tls-ca-cert.pem
EOF

fabric-ca-client enroll   -u https://peer2:peer2pw@localhost:7054   --csr.hosts peer2   --csr.hosts peer2.orgx.svc.cluster.local
cd /home/asantopadre/fabric-clients/ca-orgx-admin/msp/
cd ~/
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/ca-orgx-admin
ls /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/signcerts
ls /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/keystore
openssl x509 -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/signcerts/cert.pem | openssl md5
openssl rsa -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/keystore/*_sk | openssl md5
openssl x509 -in /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/signcerts/cert.pem -noout -text | grep OU
openssl x509 -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/signcerts/cert.pem | openssl md5
openssl ec -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/keystore/*_sk | openssl md5
openssl ec -noout -modulus -in /home/asantopadre/fabric-clients/ca-orgdcms-admin/msp/keystore/da47bf0323aace3e05021436f29ff31543420cd9cdb03ca2764efe188aa8215a_sk | openssl md5
L’output deve essere identico:
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/ca-orgx-admin
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem
ls msp/signcerts
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgx/peers/peer2
mkdir -p /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/tlscacerts
cp /home/asantopadre/fabric-deploy/ca/orgdcms-admin/msp/tlscacerts/tls-ca-cert.pem /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/tlscacerts/tls-ca-cert.pem
fabric-ca-client enroll   -u https://peer2:peer2pw@localhost:7054   --csr.hosts peer2   --csr.hosts peer2.orgx.svc.cluster.local
ls /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/signcerts
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgx/peers/peer2
fabric-ca-client enroll   -u https://peer2:peer2pw@localhost:7055   --enrollment.profile tls   --csr.hosts peer2   --csr.hosts peer2.orgx.svc.cluster.local   -M /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/ca-orgdcms-admin
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   -u https://localhost:7055
cat /home/asantopadre/fabric-clients/ca-orgdcms-admin/fabric-ca-client-config.yaml
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/fabric-ca-orgdcms-tls
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   -u https://localhost:7055
mkdir -p /home/asantopadre/fabric-clients/fabric-ca-orgdcms-tls/msp/tlscacerts
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/fabric-ca-orgdcms-tls
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   -u https://localhost:7055
ls -l /home/asantopadre/fabric-clients/fabric-ca-orgdcms-tls/msp/tlscacerts/tls-ca-cert.pem
fabric-ca-client register   --id.name peer2   --id.secret peer2pw   --id.type peer   -u https://localhost:7055   --tls.certfiles /home/asantopadre/fabric-clients/fabric-ca-orgdcms-tls/msp/tlscacerts/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgx/peers/peer2
fabric-ca-client enroll   -u https://peer2:peer2pw@localhost:7054   --enrollment.profile tls   --csr.hosts peer2   --csr.hosts peer2.orgx.svc.cluster.local   -M /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls
cd /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls
cp tlscacerts/*.pem ca.crt
cp signcerts/cert.pem server.crt
cp keystore/*_sk server.key
ls /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp
cat > /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/config.yaml <<'EOF'
NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: orderer
EOF

ls -l /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/config.yaml
cd ~/
kubectl get pvc -n orgx
kubectl run pvc-shell-peer2-msp -n orgx --rm -it --image=busybox:1.36 --restart=Never   --overrides='{
    "spec": {
      "containers": [{
        "name": "c",
        "image": "busybox:1.36",
        "command": ["sh","-c","ls -R /msp; sleep 5"],
        "volumeMounts": [{"name":"msp","mountPath":"/msp"}]
      }],
      "volumes": [{
        "name":"msp",
        "persistentVolumeClaim":{"claimName":"peer2-orgx-msp-pvc"}
      }]
    }
  }'
kubectl get pod -n orgx
cat > /home/asantopadre/fabric-deploy/orgx/peers/peer2/populate-peer2-pvc.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: populate-peer2-pvc
  namespace: orgx
spec:
  restartPolicy: Never
  containers:
    - name: populate
      image: busybox:1.36
      command:
        - sh
        - -lc
        - |
          set -e
          rm -rf /msp/* /tls/*
          cp -R /src/msp/* /msp/
          cp /src/tls/ca.crt /tls/ca.crt
          cp /src/tls/server.crt /tls/server.crt
          cp /src/tls/server.key /tls/server.key
          echo "PVC populated"
          sleep 5
      volumeMounts:
        - name: src
          mountPath: /src
          readOnly: true
        - name: msp
          mountPath: /msp
        - name: tls
          mountPath: /tls
  volumes:
    - name: src
      hostPath:
        path: /home/asantopadre/fabric-deploy/orgx/peers/peer2
        type: Directory
    - name: msp
      persistentVolumeClaim:
        claimName: peer2-orgx-msp-pvc
    - name: tls
      persistentVolumeClaim:
        claimName: peer2-orgx-tls-pvc
EOF

kubectl apply -f /home/asantopadre/fabric-deploy/orgx/peers/peer2/populate-peer2-pvc.yaml
kubectl logs -n orgx populate-peer2-pvc
kubectl delete pod -n orgx populate-peer2-pvc
kubectl run pvc-shell-peer2-msp -n orgx --rm -it --image=busybox:1.36 --restart=Never   --overrides='{
    "spec": {
      "containers": [{
        "name": "c",
        "image": "busybox:1.36",
        "command": ["sh","-c","ls -R /msp; sleep 5"],
        "volumeMounts": [{"name":"msp","mountPath":"/msp"}]
      }],
      "volumes": [{
        "name":"msp",
        "persistentVolumeClaim":{"claimName":"peer2-orgx-msp-pvc"}
      }]
    }
  }'
cat > /home/asantopadre/pvc-shell-peer2-msp.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: pvc-shell-peer2-msp
  namespace: orgx
spec:
  restartPolicy: Never
  containers:
    - name: shell
      image: busybox:1.36
      command: ["sh","-lc","sleep 3600"]
      volumeMounts:
        - name: msp
          mountPath: /msp
  volumes:
    - name: msp
      persistentVolumeClaim:
        claimName: peer2-orgx-msp-pvc
EOF

kubectl apply -f /home/asantopadre/pvc-shell-peer2-msp.yaml
kubectl exec -n orgx -it pvc-shell-peer2-msp -- sh
cat > /home/asantopadre/pvc-shell-peer2-tls.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: pvc-shell-peer2-tls
  namespace: orgx
spec:
  restartPolicy: Never
  containers:
    - name: shell
      image: busybox:1.36
      command: ["sh","-lc","sleep 3600"]
      volumeMounts:
        - name: tls
          mountPath: /tls
  volumes:
    - name: tls
      persistentVolumeClaim:
        claimName: peer2-orgx-tls-pvc
EOF

kubectl apply -f /home/asantopadre/pvc-shell-peer2-tls.yaml
kubectl exec -n orgx -it pvc-shell-peer2-tls -- sh
cat > /home/asantopadre/fabric-deploy/orgx/peers/peer2/peer2-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: peer2
  namespace: orgx
spec:
  selector:
    app: peer2
  ports:
    - name: grpc
      port: 7051
      targetPort: 7051
    - name: chaincode
      port: 7052
      targetPort: 7052
EOF

kubectl apply -f /home/asantopadre/fabric-deploy/orgx/peers/peer2/peer2-service.yaml
cat > /home/asantopadre/fabric-deploy/orgx/peers/peer2/peer2-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: peer2
  namespace: orgx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: peer2
  template:
    metadata:
      labels:
        app: peer2
    spec:
      containers:
        - name: peer
          image: hyperledger/fabric-peer:2.5
          env:
            - name: CORE_PEER_ID
              value: peer2.orgx
            - name: CORE_PEER_ADDRESS
              value: peer2.orgx.svc.cluster.local:7051
            - name: CORE_PEER_LISTENADDRESS
              value: 0.0.0.0:7051

            - name: CORE_PEER_LOCALMSPID
              value: OrgXMSP

            - name: CORE_PEER_CHAINCODELISTENADDRESS
              value: 0.0.0.0:7052
            - name: CORE_PEER_CHAINCODEADDRESS
              value: peer2.orgx.svc.cluster.local:7052

            - name: CORE_PEER_MSPCONFIGPATH
              value: /var/hyperledger/peer/msp

            - name: CORE_PEER_TLS_ENABLED
              value: "true"
            - name: CORE_PEER_TLS_CERT_FILE
              value: /var/hyperledger/peer/tls/server.crt
            - name: CORE_PEER_TLS_KEY_FILE
              value: /var/hyperledger/peer/tls/server.key
            - name: CORE_PEER_TLS_ROOTCERT_FILE
              value: /var/hyperledger/peer/tls/ca.crt

            - name: CORE_PEER_GOSSIP_EXTERNALENDPOINT
              value: peer2.orgx.svc.cluster.local:7051
            - name: CORE_PEER_GOSSIP_USELEADERELECTION
              value: "true"
            - name: CORE_PEER_GOSSIP_ORGLEADER
              value: "false"
          ports:
            - containerPort: 7051
            - containerPort: 7052
          volumeMounts:
            - name: msp
              mountPath: /var/hyperledger/peer/msp
              readOnly: true
            - name: tls
              mountPath: /var/hyperledger/peer/tls
              readOnly: true
      volumes:
        - name: msp
          persistentVolumeClaim:
            claimName: peer2-orgx-msp-pvc
        - name: tls
          persistentVolumeClaim:
            claimName: peer2-orgx-tls-pvc
EOF

kubectl apply -f /home/asantopadre/fabric-deploy/orgx/peers/peer2/peer2-deployment.yaml
kubectl rollout status -n orgx deploy/peer2
kubectl logs -n orgx deploy/peer2 --tail=80
kubectl get pvc -n orgx
cat > /home/asantopadre/fabric-deploy/orgx/peers/peer2/peer2-ledger-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: peer2-orgx-ledger-pvc
  namespace: orgx
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
  storageClassName: local-path
EOF

kubectl apply -f /home/asantopadre/fabric-deploy/orgx/peers/peer2/peer2-ledger-pvc.yaml
get pvc -n orgx
kubectl get pvc -n orgx
kubectl get storageclass
kubectl apply -f peer2-deployment.yaml
kubectl get pvc -n orgx
kubectl get pod -n orgx
kubectl delete enroll-peer2-orgx pod -n orgx
kubectl delete enroll-peer2-orgx  -n orgx
kubectl delete pod enroll-peer2-orgx  -n orgx
kubectl logs -n orgx deploy/peer2 --tail=50
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-clients/ca-orgx-admin
fabric-ca-client register   --id.name orgx-admin   --id.secret orgx-adminpw   --id.type admin   -u https://localhost:7054
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgx/admin
mkdir -p /home/asantopadre/fabric-deploy/orgx/admin/msp/tlscacerts
cp /home/asantopadre/fabric-deploy/orgx/peers/peer2/msp/tlscacerts/tls-ca-cert.pem /home/asantopadre/fabric-deploy/orgx/admin/msp/tlscacerts/tls-ca-cert.pem
fabric-ca-client enroll   -u https://orgx-admin:orgx-adminpw@localhost:7054
ls -l /home/asantopadre/fabric-deploy/orgx/admin/msp/tlscacerts/tls-ca-cert.pem
# 1) Verifica che il trust esista davvero
ls -l /home/asantopadre/fabric-deploy/orgx/admin/msp/tlscacerts/tls-ca-cert.pem
# 2) Enroll forzando il trust (ignora eventuale config errato)
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/orgx/admin
fabric-ca-client enroll   -u https://orgx-admin:orgx-adminpw@localhost:7054   --tls.certfiles /home/asantopadre/fabric-deploy/orgx/admin/msp/tlscacerts/tls-ca-cert.pem
cat > /home/asantopadre/fabric-deploy/orgx/admin/msp/config.yaml <<'EOF'
NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-7054.pem
    OrganizationalUnitIdentifier: orderer
EOF

ls /home/asantopadre/fabric-deploy/orgx/admin/msp
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -asOrg OrgX   -outputAnchorPeersUpdate /home/asantopadre/fabric-deploy/channels/OrgXAnchors_canale1v2.tx
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
export ORDERER_CA=/home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgXAnchors_canale1v2.tx   -o localhost:7050   --tls   --cafile $ORDERER_CA
export ORDERER_CA=/home/asantopadre/fabric-deploy/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgXAnchors_canale1v2.tx   -o localhost:7050   --tls   --cafile $ORDERER_CA
cd/home/asantopadre/fabric-deploy/orderer1/tls/tlscacerts
export ORDERER_CA=/home/asantopadre/fabric-deploy/orderers/orderer1/tls/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgXAnchors_canale1v2.tx   -o localhost:7050   --tls   --cafile $ORDERER_CA
export ORDERER_CA=export ORDERER_CA=/home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem
peer channel update   -c canale1v2   -f /home/asantopadre/fabric-deploy/channels/OrgXAnchors_canale1v2.tx   -o localhost:7050   --tls   --cafile $ORDERER_CA
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
ls $CORE_PEER_MSPCONFIGPATH/cacerts
openssl x509 -in $CORE_PEER_MSPCONFIGPATH/signcerts/cert.pem -noout -subject -issuer
peer channel fetch config /tmp/config_block.pb -c canale1v2 -o localhost:7050 --tls   --cafile /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-ca-cert.pem
peer channel fetch config /tmp/config_block.pb -c canale1v2 -o localhost:7050 --tls   --cafile /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
ubectl get pvc -n orgx
kubectl get pvc -n orgx
kubectl scale -n orgdcms deploy/peer1 --replicas=0
cat > /home/asantopadre/clean-peer1-ledger.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: clean-peer1-ledger
  namespace: orgdcms
spec:
  restartPolicy: Never
  containers:
  - name: c
    image: busybox:1.36
    command: ["sh","-lc","rm -rf /prod/ledgersData /prod/transientStore /prod/chaincodes; echo OK; sleep 3"]
    volumeMounts:
    - name: ledger
      mountPath: /prod
  volumes:
  - name: ledger
    persistentVolumeClaim:
      claimName: peer1-orgdcms-ledger-pvc
EOF

kubectl apply -f /home/asantopadre/clean-peer1-ledger.yaml
kubectl logs -n orgdcms clean-peer1-ledger
kubectl delete pod -n orgdcms clean-peer1-ledger
kubectl scale -n orgdcms deploy/peer1 --replicas=1
kubectl scale -n orgx deploy/peer2 --replicas=0
# PEER2 – pulizia ledger PVC
cat > /home/asantopadre/clean-peer2-ledger.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: clean-peer2-ledger
  namespace: orgx
spec:
  restartPolicy: Never
  containers:
  - name: c
    image: busybox:1.36
    command: ["sh","-lc","rm -rf /prod/ledgersData /prod/transientStore /prod/chaincodes; echo OK; sleep 3"]
    volumeMounts:
    - name: ledger
      mountPath: /prod
  volumes:
  - name: ledger
    persistentVolumeClaim:
      claimName: peer2-orgx-ledger-pvc
EOF

kubectl apply -f /home/asantopadre/clean-peer2-ledger.yaml
kubectl logs -n orgx clean-peer2-ledger
kubectl scale -n orgx deploy/peer2 --replicas=1
ubectl get pods -n orgx
kubectl get pods -n orgx
kubectl get pods -n orgdcms
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
kubectl scale -n orgdcms deploy/peer1 --replicas=0
cat > /home/asantopadre/clean-peer1-ledger.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: clean-peer1-ledger
  namespace: orgdcms
spec:
  restartPolicy: Never
  containers:
  - name: c
    image: busybox:1.36
    command: ["sh","-lc","rm -rf /prod/ledgersData /prod/transientStore /prod/chaincodes; echo OK; sleep 3"]
    volumeMounts:
    - name: ledger
      mountPath: /prod
  volumes:
  - name: ledger
    persistentVolumeClaim:
      claimName: peer1-orgdcms-ledger-pvc
EOF

kubectl apply -f /home/asantopadre/clean-peer1-ledger.yaml
kubectl logs -n orgdcms clean-peer1-ledger
kubectl scale -n orgdcms deploy/peer1 --replicas=1
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
kubectl get pods -n orgdcms
kubectl logs orderer1-66b4499b44-9p4lh -n orgdcms
kubectl logs orderer2-79959f4fd6-8fjwb -n orgdcms
kubectl get pods -n orgx
kubectl logs orderer3-orderer3-8496744d96-t284m -n orgx
kubectl logs orderer3-8496744d96-t284m -n orgx
kubectl get pods -n orgdcms -o wide
kubectl get svc  -n orgdcms -o wide
kubectl get pods -n orgdcms
kubectl delete job inspect-orderer1
kubectl delete job -n orgdcms inspect-orderer1
kubectl delete pod -n orgdcms inspect-orderer1
kubectl delete pod -n orgdcms inspect-orderer1-pvc
kubectl delete pod -n orgdcms inspect-orderer1-pvcs
kubectl delete pod -n orgdcms clean-peer1-ledger
kubectl get pods -n orgdcms
kubectl get pods -n orgx
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel list
# === OrgX / peer2 context (adatta i path al tuo repo runtime/artifacts) ===
export CORE_PEER_LOCALMSPID="OrgXMSP"
export CORE_PEER_MSPCONFIGPATH=~/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:9051              # port-forward peer2
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=~/fabric-deploy/orgx/peer2/tls/tlscacerts/tls-ca-cert.pem
peer channel list
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
peer channel list
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel list
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgx.yaml
kubectl get deploy peer2 -n orgx -o yaml
kubectl edit deployment peer1 -n orgdcms
kubectl rollout restart deploy peer2 -n orgx
kubectl apply -f peer2-deployment.yaml
peer channel list
kubectl get pods -n orgx
kubectl describe pod -n orgx peer2-56fb944d5f-bbwm7 | tail -n 60
kubectl logs -n orgx peer2-56fb944d5f-bbwm7 -c peer --previous
kubectl scale deploy -n orgx peer2 --replicas=0
kubectl wait --for=delete pod -n orgx -l app=peer2 --timeout=60s
kubectl scale deploy -n orgx peer2 --replicas=1
kubectl get pods -n orgx -l app=peer2
kubectl port-forward -n orgx deploy/peer2 7051:7051
kubectl port-forward -n orgdcms deploy/orderer1 7050:7050
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
kubectl port-forward -n orgx deploy/peer2 7051:7051
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
kubectl port-forward -n orgdcms deploy/orderer1 7050:7050
kubectl port-forward -n orgx deploy/peer2 9051:7051
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
peer channel fetch config /tmp/config_block.pb -c canale1v2 -o localhost:7050 --tls   --cafile /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem
configtxlator proto_decode --input /tmp/config_block.pb --type common.Block > /tmp/config_block.json
jq -r '.data.data[0].payload.data.config.channel_group.groups.Application.groups.OrgXMSP.values.MSP.value.config.root_certs[0]' /tmp/config_block.json   > /tmp/orgx_root_from_channel.pem
openssl x509 -in /tmp/orgx_root_from_channel.pem -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/cacerts/*.pem -noout -fingerprint -sha256
openssl x509 -in /tmp/orgx_root_from_channel.pem -noout -fingerprint -sha256
configtxlator proto_decode --input /tmp/config_block.pb --type common.Block > /tmp/config_block.json
jq -r '.data.data[0].payload.data.config.channel_group.groups.Application.groups | keys[]' /tmp/config_block.json
jq -r '.data.data[0].payload.data.config.channel_group.groups.Application.groups.OrgX.values.MSP.value.config.root_certs[]'   /tmp/config_block.json > /tmp/orgx_root_from_channel.b64
base64 -d /tmp/orgx_root_from_channel.b64 > /tmp/orgx_root_from_channel.pem
openssl x509 -in /tmp/orgx_root_from_channel.pem -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/cacerts/*.pem -noout -fingerprint -sha256
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl port-forward -n orgdcms pod/orderer2-79959f4fd6-8fjwb 37052:7053
kubectl port-forward -n orgdcms deploy/peer2 9051:7051
kubectl port-forward -n orgx deploy/peer2 9051:7051
kubectl port-forward -n orgx svc/peer2 9051:7051
kubectl port-forward -n orgdcms svc/orderer1 37051:7053
kubectl port-forward -n orgx pod/orderer3-8496744d96-t284m 37053:7053
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
kubectl port-forward -n orgx svc/orderer3 37053:7053
kubectl port-forward -n orgdcms pod/orderer1-66b4499b44-9p4lh 37051:7053
kubectl port-forward -n orgx    deploy/peer2 8051:7051
kubectl get pods -n orgdcms
kubectl port-forward -n orgdcms pod/orderer2-79959f4fd6-8fjwb 37052:7053
kubectl port-forward -n orgdcms svc/orderer2 37052:7053
peer channel list
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=~/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:9051 # port-forward peer2
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=~/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel list
kubectl get deploy -n orgx peer2
kubectl get rs -n orgx -l app=peer2
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="CORE_CHAINCODE_EXTERNALBUILDERS")].value}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[?(@.name=="ccaas")].mountPath}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.volumes[?(@.name=="ccaas")].hostPath.path}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="CORE_CHAINCODE_EXTERNALBUILDERS")].value}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[?(@.name=="ccaas")].mountPath}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.volumes[?(@.name=="ccaas")].hostPath.path}{"\n"}'
kubectl apply -f peer2-deployment.yaml
kubectl rollout status -n orgx deploy/peer2
kubectl get pods -n orgx -l app=peer2 -o wide
kubectl delete pod -n orgx -l app=peer2 --field-selector=status.phase!=Running
kubectl get pods -n orgx -l app=peer2 -o wide
kubectl logs -n orgx peer2-85494d5d7b-ff4vv -c peer --previous
kubectl scale -n orgx deploy/peer2 --replicas=0
kubectl wait --for=delete pod -n orgx -l app=peer2 --timeout=60s
kubectl scale -n orgx deploy/peer2 --replicas=1
kubectl get pods -n orgx -l app=peer2
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[?(@.name=="ccaas")].mountPath}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.volumes[?(@.name=="ccaas")].hostPath.path}{"\n"}'
peer channel list
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
peer channel list
kubectl get pod -n orgx -l app=peer2
kubectl describe pod -n orgx -l app=peer2 | tail -n 40
kubectl logs -n orgx -l app=peer2 -c peer --tail=120
export CORE_PEER_ADDRESS=localhost:9051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel list
kubectl logs -n orgdcms deploy/peer1 -c peer --tail=200
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl get svc -n orgdcms orderer2 -o yaml | sed -n '1,120p'
kubectl get endpoints -n orgdcms orderer2 -o wide
osnadmin channel list   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer2/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=300
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=800 | grep -E "canale1v2|participation|Join|channel|Deliver|NOT_FOUND|etcdraft|consenter|ledger|panic|error"
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=300
kubectl get deploy -n orgdcms orderer2 -o jsonpath='{.spec.template.spec.volumes[*].persistentVolumeClaim.claimName}{"\n"}'
orderer2-ledger-pvc orderer2-msp-pvc orderer2-tls-pvc
kubectl get deploy -n orgdcms orderer2 -o yaml | grep -n "/var/hyperledger/production" -n
kubectl get deploy -n orgdcms orderer2 -o jsonpath='{.spec.template.spec.volumes[*].persistentVolumeClaim.claimName}{"\n"}'
kubectl get deploy -n orgdcms orderer2 -o yaml | grep -n "/var/hyperledger/production" -n
kubectl get deploy -n orgdcms orderer2 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[*].mountPath}{"\n"}'
kubectl get deploy -n orgdcms orderer2 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[*].name}{"\n"}'
kubectl get deploy -n orgdcms orderer1 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[*].mountPath}{"\n"}'
kubectl get deploy -n orgx orderer3 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[*].mountPath}{"\n"}'
kubectl logs -n orgx deploy/peer2 -c peer --tail=200 | grep Deliver
kubectl logs -n orgdcms deploy/orderer2
kubectl logs -n orgdcms deploy/orderer2 -c
kubectl logs -n orgdcms deploy/orderer2 -c orderer
kubectl logs -n orgdcms deploy/orderer1 -c orderer
kubectl logs -n orgdcms deploy/orderer1 -200
kubectl logs -n orgdcms deploy/peer1 -c peer --tail=200
kubectl logs -n orgx deploy/peer2 -c peer --tail=200
kubectl logs -n orgdcms deploy/orderer1 -c orderer --tail=200
kubectl logs -n orgx deploy/o -c peer --tail=400
kubectl logs -n orgx deploy/peer1 -c peer --tail=400
kubectl logs -n orgx deploy/peer2 -c peer --tail=400
kubectl scale -n orgdcms deploy/orderer1 --replicas=0
kubectl wait --for=delete pod -n orgdcms -l app=orderer1 --timeout=60s
kubectl patch -n orgdcms deploy/orderer1 --type='json' -p='[
  {"op":"replace","path":"/spec/template/spec/containers/0/volumeMounts/0/mountPath","value":"/var/hyperledger/production"}
]'
kubectl scale -n orgdcms deploy/orderer1 --replicas=1
kubectl rollout status -n orgdcms deploy/orderer1
kubectl logs -n orgdcms deploy/orderer1 -c orderer --tail=120
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer1/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl scale -n orgdcms deploy/orderer2 --replicas=0
kubectl wait --for=delete pod -n orgdcms -l app=orderer2 --timeout=60s
kubectl patch -n orgdcms deploy/orderer2 --type='json' -p='[
  {"op":"replace","path":"/spec/template/spec/containers/0/volumeMounts/0/mountPath","value":"/var/hyperledger/production"}
]'
kubectl scale -n orgdcms deploy/orderer2 --replicas=1
kubectl rollout status -n orgdcms deploy/orderer2
kubectl port-forward -n orgdcms svc/orderer2 37052:7053
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer2/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
cd ~/fabric-deploy/osnadmin
tree -3
tree 3
tree -L 3
tree -L 4
cd ~/
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/orgdcms/orderers/orderer2/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl scale -n orgx deploy/orderer3 --replicas=0
kubectl wait --for=delete pod -n orgx -l app=orderer3 --timeout=60s
kubectl patch -n orgx deploy/orderer3 --type='json' -p='[
  {"op":"replace","path":"/spec/template/spec/containers/0/volumeMounts/0/mountPath","value":"/var/hyperledger/production"}
]'
kubectl scale -n orgx deploy/orderer3 --replicas=1
kubectl rollout status -n orgx deploy/orderer3
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/peer1 -c peer --tail=120 | grep -E "NOT_FOUND|DeliverBlocks"
kubectl logs -n orgx deploy/peer2 -c peer --tail=120 | grep -E "NOT_FOUND|DeliverBlocks"
kubectl logs -n orgdcms deploy/peer1 -c peer --tail=120 | grep -E "NOT_FOUND|DeliverBlocks"
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=200 | grep -E "canale1v2|Created|Starting|Registrar|Join|consenter|etcdraft|error|NOT_FOUND"
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=200
kubectl exec -n orgdcms deploy/orderer2 -c orderer -- env | grep -E 'ORDERER_FILELEDGER_LOCATION|ORDERER_LEDGER|FABRIC_CFG_PATH'
kubectl exec -n orgdcms deploy/orderer2 -c orderer -- ls -la /var/hyperledger/production/orderer/chains
kubectl exec -n orgdcms deploy/orderer2 -c orderer -- ls -la /var/hyperledger/production/orderer/etcdraft
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=300 | grep -E 'canale1v2|Start|Starting|Created|etcdraft|Chain|ERROR|panic'
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=300 | grep -E 'INFO'
kubectl logs -n orgdcms deploy/orderer2 -c orderer --tail=200 | grep -E "height|Created block|Appended"
kubectl exec -it -n orgx fabric-tools -- bash
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-tools-orgx.yaml
kubectl get pods -n orgx
kubectl exec -it -n orgx fabric-tools -- bash
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="CORE_CHAINCODE_EXTERNALBUILDERS")].value}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[?(@.name=="ccaas")].mountPath}{"\n"}'
kubectl get deploy -n orgx peer2 -o jsonpath='{.spec.template.spec.volumes[?(@.name=="ccaas")].hostPath.path}{"\n"}'
kubectl exec -n orgx deploy/peer2 -c peer -- ls -la /opt/hyperledger/ccaas
kubectl exec -n orgx deploy/peer2 -c peer -- ls -la /opt/hyperledger/ccaas/bin
kubectl exec -it -n orgx fabric-tools -- bash
kubectl get pods -A | grep basic
kubectl get svc -A | grep basic
kubectl logs -n orgdcms basic-ccaas-74fb65598b-k8f52
kubectl get svc -orgdcms
kubectl get svc -n orgdcms
nerdctl --version
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl exec -it -n orgx fabric-tools -- bash
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl exec -it -n orgx fabric-tools -- bash
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl exec -it -n orgx fabric-tools -- bash
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/ca-cert.pem -noout -fingerprint -sha256
openssl x509 -in ~/fabric-deploy/orgx/admin/msp/cacerts/* -noout -fingerprint -sha256
kubectl exec -it -n orgx fabric-tools -- bash
kubectl exec -n orgx deploy/peer2 -c peer -- peer channel list
kubectl exec -n orgx deploy/peer2 -c peer -- peer channel getinfo -c canale1v2
kubectl exec -it -n orgx fabric-tools -- bash
kubectl exec -it -n orgdcms fabric-tools -- bash
kubectl exec -it -n orgx fabric-tools -- bash
kubectl exec -n orgx deploy/peer2 -c peer -- ls /var/hyperledger/peer/msp/cacerts
kubectl exec -n orgx deploy/peer2 -c peer -- openssl x509 -in /var/hyperledger/peer/msp/cacerts/* -noout -fingerprint -sha256
kubectl exec -it -n orgx deploy/peer2 -c peer -- sh
kubectl exec -n orgx deploy/peer2 -c peer -- cat /var/hyperledger/peer/msp/cacerts/localhost-7054.pem
cat ~/fabric-deploy/orgx/admin/msp/cacerts/localhost-7054.pem
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx
kubectl get pvc -orgx
kubectl get pvc -n orgx
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl get pods -n orgx
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx
kubectl get pods -n orgx
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pvc -n orgx
kubectl scale deployment peer2 -n orgx --replicas=0
kubectl get pvc peer2-orgx-ledger-pvc -n orgx -o yaml
kubectl patch pvc peer2-orgx-ledger-pvc   -n orgx   -p '{"metadata":{"finalizers":null}}'
kubectl get pvc -n orgx
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pvc -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/peer2-pvc.yaml
kubectl get pvc -n orgx
kubectl scale deployment peer2 -n orgx --replicas=1
kubectl get pods -n orgx
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
export CORE_PEER_ADDRESS=localhost:9051
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=~/fabric-deploy/orgx/admin/msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=~/fabric-deploy/orgx/peers/peer2/tls/ca.crt
peer channel join -b ~/fabric-deploy/channels/canale1v2.block
peer channel getinfo -c canale1v2
peer channel join -b ~/fabric-deploy/channels/canale1v2.block
peer channel getinfo -c canale1v2
fabric-ca-client register   --id.name orgx-client   --id.secret orgxpw   --id.type client
fabric-ca-client register   --id.name orgx-client   --id.secret orgxpw   --id.type client   --tls.certfiles ~/fabric-deploy/tls-ca/tls-ca-cert.pem
kubectl exec -it -n orgx fabric-tools -- bash
kubectl exec -n orgx deploy/peer2 -c peer -- cat /var/hyperledger/peer/msp/config.yaml
kubectl port-forward -n orgdcms deploy/peer1 7051:7051
kubectl port-forward -n orgdcms svc/orderer2 37052:7053
kubectl port-forward -n orgx svc/orderer3 37053:7053
kubectl port-forward -n orgdcms svc/orderer1 37051:7053
kubectl get pod -n orgdcms
kubectl get pod -n orgx
osnadmin channel list \
osnadmin channel remove   --channelID canale1v2   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37053   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer3/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel remove   --channelID canale1v2   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
Status: 204
osnadmin channel list   --orderer-address localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
kubectl get pvc -n orgdcms
kubectl delete pvc orderer1-ledger -n orgdcms
kubectl delete pvc orderer1-ledger-pvc -n orgdcms
kubectl delete pvc orderer2-ledger-pvc -n orgdcms
kubectl delete pvc peer1-orgdcms-ledger-pvc -n orgdcms
kubectl get pvc -n orgdcms
kubectl get pvc -n orgx
kubectl delete pvc peer2-orgx-ledger-pvc -n orgx
kubectl delete pvc orderer3-ledger-pvc -n orgx
kubectl delete deployment orderer1 -n orgdcms
kubectl get pvc -n orgdcms
kubectl get pvc -A | egrep 'Pending|Terminating'
kubectl patch pvc orderer1-ledger-pvc -n orgdcms   -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch pvc orderer2-ledger-pvc -n orgdcms   -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch pvc peer1-orgdcms-ledger-pvc -n orgdcms   -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch pvc orderer3-ledger-pvc -n orgx   -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch pvc peer2-orgx-ledger-pvc -n orgx   -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl get pvc -A
kubectl delete deployment orderer2 -n orgdcms
kubectl delete deployment orderer3 -n orgx
kubectl delete deployment peer1 -n orgdcms
kubectl delete deployment peer2 -n orgx
kubectl get pod -n orgdcms
kubectl get pod -n orgx
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1v2   -outputBlock ./canale1v2.block
ls -lh canale1v2.block
ls -lh /home/asantopadre/fabric-deploy/channels/canale1v2.block
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer1.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer2.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/orderer3.yaml
kubectl get pods -A
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get pvc -A
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37053   --ca-file /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37051   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1v2   --config-block /home/asantopadre/fabric-deploy/channels/canale1v2.block   -o localhost:37052   --ca-file /home/asantopadre/fabric-deploy/configtx/orderers/orderer2/msp/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl apply -f /home/asantopadre/peer1-deployment.yaml
kubectl apply -f /home/asantopadre/peer1-deployment.yaml/home/asantopadre/peer2-deployment.yaml
kubectl apply -f /home/asantopadre/peer2-deployment.yaml
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl get pvc -A
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-samples/config
peer channel join   -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgdx.svc.cluster.local
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel join -b /home/asantopadre/fabric-deploy/channels/canale1v2.block
peer channel list
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel getinfo -c canale1v2
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel getinfo -c canale1v2
export CORE_PEER_LOCALMSPID=OrgXMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgx/admin/msp
export CORE_PEER_ADDRESS=localhost:7052
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer2.orgx.svc.cluster.local
peer channel getinfo -c canale1v2
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel getinfo -c canale1v2
echo "== OrgX admin cert (subject/issuer) =="
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/cert.pem -noout -subject -issuer || true
echo "== OrgX MSPDir quick check =="
ls -la /home/asantopadre/fabric-deploy/orgx/admin/msp/{signcerts,cacerts,tlscacerts,keystore} 2>/dev/null
echo "== Subject / Issuer OrgX admin =="
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/cert.pem -noout -subject -issuer
kubectl exec -n orgx deploy/peer2 -- sh -lc '
echo "== MSP folders ==";
ls -la /var/hyperledger/peer/msp;
echo "== config.yaml ==";
cat /var/hyperledger/peer/msp/config.yaml 2>/dev/null || echo "NO config.yaml";
echo "== cacerts ==";
ls -la /var/hyperledger/peer/msp/cacerts 2>/dev/null;
echo "== signcerts ==";
ls -la /var/hyperledger/peer/msp/signcerts 2>/dev/null;
'
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/home/asantopadre/fabric-deploy/orgdcms/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/home/asantopadre/fabric-deploy/orgdcms/peers/peer1/tls/ca.crt
export CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer1.orgdcms.svc.cluster.local
peer channel fetch config /tmp/config.block -c canale1v2 -o localhost:7050 --tls --cafile <ORDERER_TLS_CA>
configtxlator proto_decode --input /tmp/config.block --type common.Block > /tmp/config.json
peer channel fetch config /tmp/config.block   -c canale1v2   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
peer channel fetch config /tmp/config.block   -c canale1v2   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem
peer channel fetch config /tmp/config.block   -c canale1v2   -o localhost:37051   --tls   --cafile /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem
peer channel fetch config /tmp/config.block   -c canale1v2   -o localhost:7050   --tls   --cafile /home/asantopadre/fabric-deploy/configtx/orderers/orderer1/msp/tlscacerts/tls-ca-cert.pem
configtxlator proto_decode   --input /tmp/config.block   --type common.Block > /tmp/config.json
jq -r '.data.data[0].payload.data.config.channel_group.groups.Application.groups | keys[]' /tmp/config.json | sort
jq -r '.data.data[0].payload.data.config.channel_group.groups.Application.groups | keys[]' /tmp/config.json
# estrai root CA OrgX dal canale
jq -r '.data.data[0].payload.data.config.channel_group.groups.Application.groups.OrgX.values.MSP.value.config.root_certs[0]' /tmp/config.json | base64 -d > /tmp/orgx_root_from_channel.pem
echo "== fingerprint root CA dal canale =="
openssl x509 -in /tmp/orgx_root_from_channel.pem -noout -fingerprint -sha256
echo "== fingerprint root CA locale usata dall’admin OrgX =="
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/cacerts/localhost-7054.pem -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/configtx/orgx/msp/cacerts/*.pem -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt   -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/configtx/orgx/msp/tlscacerts/*.pem   -noout -fingerprint -sha256
openssl x509   -in /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt   -noout -fingerprint -sha256
openssl x509   -in /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt   -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/signcerts/cert.pem -noout -issuer
kubectl get pods -n orgx
kubectl exec -n orgx deploy/fabric-ca-orgx -- cat /etc/hyperledger/fabric-ca-server-config.yaml | grep certfile -A2
kubectl exec -n orgx deploy/fabric-ca-orgx -- ls -l /etc/hyperledger/fabric-ca-server
kubectl exec -n orgx deploy/fabric-ca-orgx --   openssl x509 -in /etc/hyperledger/fabric-ca-server/ca-cert.pem   -noout -fingerprint -sha256
kubectl cp orgx/$(kubectl get pod -n orgx -l app=fabric-ca-orgx -o jsonpath='{.items[0].metadata.name}'):/etc/hyperledger/fabric-ca-server/ca-cert.pem /tmp/orgx_fabric_ca.pem
openssl x509 -in /tmp/orgx_fabric_ca.pem -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/admin/msp/cacerts/localhost-7054.pem -noout -fingerprint -sha256
openssl x509 -in /home/asantopadre/fabric-deploy/orgx/peers/peer2/tls/ca.crt -noout -fingerprint -sha256
kubectl exec -n orgx deploy/fabric-ca-orgx -- cat /etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml | grep csr -A5
kubectl exec -n orgx deploy/fabric-ca-orgx -- cat /etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml | grep -A5 "ca:"
kubectl get pods -n orgx
kubectl delete deployment fabric-ca-orgx -n orgx
kubectl delete job fabric-ca-orgx-init -n orgx
kubectl delete pvc fabric-ca-orgx-pvc -n orgx
kubectl get pvc -n orgx
kubectl patch pvc fabric-ca-orgx-pvc -n orgx -p '{"metadata":{"finalizers":null}}'
kubectl get pvc -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx-pvc.yaml
kubectl get pvc -n orgx
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgx-init.yaml
kubectl get jobs -n orgx
kubectl get pvc -n orgx
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
