osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl port-forward -n orgdcms deployment/orderer2 7053:7053
kubectl edit deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout status deployment orderer2 -n orgdcms
kubectl port-forward -n orgdcms deployment/orderer2 7053:7053
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
kubectl port-forward -n orgdcms deployment/orderer2 7053:7053
kubectl port-forward -n orgx deployment/orderer3 7053:7053
kubectl port-forward -n orgdcms deployment/orderer1 2 7053:7053
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl scale deployment orderer3 -n orgx    --replicas=0
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl port-forward -n orgdcms deployment/orderer1 17053:7053
kubectl port-forward -n orgdcms deployment/orderer2 27053:7053
kubectl port-forward -n orgdcms pod/orderer1-56c5994dbf-dkvt4 17053:7053
kubectl port-forward -n orgdcms deployment/orderer1 7054:7054
kubectl port-forward -n orgdcms deployment/orderer1 7054:7054kubectl port-forward -n orgdcms deployment/fabric-ca 7054:7054
kubectl port-forward -n orgdcms deployment/fabric-ca 7054:7054
ls /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/orgdcms/orderer2/tls
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M /home/asantopadre/runtime/orgdcms/orderer2/tls   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
kubectl port-forward -n orgdcms deployment/fabric-ca 7054:7054
kubectl port-forward -n orgdcms deployment/orderer2 7053:7053
kubectl port-forward -n orgdcms pod/orderer2-885b778fb-28v5m 27053:7053
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/msp/admin/keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/msp/admin/keystore/*_sk
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M /home/asantopadre/runtime/orgdcms/orderer2/tls   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/admin/signcerts/*.pem    /home/asantopadre/runtime/orgdcms/orderer2/msp/admincerts/cert.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/admin/signcerts/*.pem    /home/asantopadre/runtime/orgdcms/orderer2/msp/admincerts/cert.pem
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/msp/admincerts/cert.pem -noout -subject
# OU = admin
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
fabric-ca-client enroll   -u https://ordererAdmin:ordererAdminpw@localhost:7054   -M /home/asantopadre/runtime/orgdcms/orderer2/msp/admin   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
fabric-ca-client enroll   -u https://ordererAdmin:ordererAdminpw@localhost:7054   -M /home/asantopadre/runtime/orgdcms/orderer2/msp/admin   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/admin/signcerts/*.pem    /home/asantopadre/runtime/orgdcms/orderer2/msp/admincerts/cert.pem
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/msp/admincerts/cert.pem -noout -subject
# OU = admin
kubectl port-forward -n orgdcms deployment/orderer2 7053:7053
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   -noout -pubkey | openssl sha256
for k in /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/*_sk; do   echo "== $k";   openssl pkey -in "$k" -pubout | openssl sha256; done
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/ddd9ccd5b4c88ff0dd8f670eb044aa57c6c03f7386db30d7fe2b0fdab459ded1_sk
kubectl edit deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
# "Beginning to serve requests"
/home/asantopadre/runtime/orgdcms/orderer2/tls
cd /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore
ls
mv 1ff29529b99052ce201a4dc6c2463c53155e6f2ab347ae9d0a48a7c0d5670a28_sk 1ff29529b9.bak
mv 32f422f2bc177d1c4d37371730d3f66b187964a730e3f50c3c133bae699785b0_sk 32f422f2bc.bak
rm -f key.pem
ln -s ddd9ccd5b4c88ff0dd8f670eb044aa57c6c03f7386db30d7fe2b0fdab459ded1_sk key.pem
openssl x509 -in ../signcerts/cert.pem -noout -pubkey | openssl sha256
openssl pkey -in key.pem -pubout | openssl sha256
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
kubectl get deployment orderer2 -n orgdcms
kubectl get svc orderer2 -n orgdcms
cat <<EOF | kubectl apply -n orgdcms -f -
apiVersion: v1
kind: Service
metadata:
  name: orderer2
spec:
  selector:
    app: orderer2
  ports:
    - name: grpc
      port: 7050
      targetPort: 7050
    - name: admin
      port: 7053
      targetPort: 7053
EOF

kubectl get svc orderer2 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
kubectl get deployment orderer2 -n orgdcms -o yaml > artifacts/deploy/orderer2-deployment.yaml
kubectl get svc orderer2 -n orgdcms -o yaml > artifacts/deploy/orderer2-service.yaml
kubectl get deployment orderer2 -n orgdcms -o yaml > artifacts/orgdcms/orderer2-deployment.yaml
kubectl get svc orderer2 -n orgdcms -o yaml > /artifacts/ordere/orderer2-service.yaml
ls /home/asantopadre/runtime/orgdcms/orderer2/msp/signcerts
kubectl get deployment orderer2 -n orgdcms -o yaml | grep -A4 hostPath
kubectl edit deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
ls -R /home/asantopadre/runtime/orgdcms/orderer2/msp
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
cd /home/asantopadre/runtime/orgdcms/orderer2/msp/cacerts
ln -sf localhost-7054-ca-orgdcms.pem ca-cert.pem
ls -l ca-cert.pem
kubectl logs -n orgdcms deployment/orderer2
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
kubectl get deployment orderer2 -n orgdcms -o yaml | grep -A6 hostPath
kubectl get deployment orderer1 -n orgdcms -o yaml | grep -A6 hostPath
kubectl get deployment orderer2 -n orgdcms -o yaml | grep -A6 hostPath
ls -ld /home/asantopadre/runtime/orgdcms/orderer2/msp
ls -ld /home/asantopadre/runtime/orgdcms/orderer2/msp/signcerts
kubectl delete pod -n orgdcms -l app=orderer2 --force --grace-period=0
kubectl get pods -n orgdcms -l app=orderer2
kubectl logs -n orgdcms deployment/orderer2
kubectl get deployment orderer2 -n orgdcms -o yaml | sed -n '/containers:/,/volumes:/p'
kubectl get deployment orderer2 -n orgdcms -o yaml
kubectl edit deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl get deployment orderer2 -n orgdcms -o yaml
kubectl logs -n orgdcms deployment/orderer2
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
export FABRIC_CFG_PATH=/home/asantopadre/artifacts
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl get pods -n orgdcms -l app=orderer2
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel fetch config canale1_config.block   --channelID canale1   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1 | grep -i raft
kubectl logs -n orgdcms deployment/orderer2 | grep -i raft
kubectl logs -n orgdcms deployment/orderer1 | grep -i raft
kubectl logs -n orgdcms deployment/orderer2 | grep -i raft
openssl x509   -in /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
ls /home/asantopadre/runtime/orgx/orderer3/msp/signcerts/cert.pem
ls /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/*.pem
ls /home/asantopadre/runtime/orgx/orderer3/msp/config.yaml
ls /home/asantopadre/runtime/orgx/orderer3/msp/signcerts/cert.pem
ls /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/*.pem
ls /home/asantopadre/runtime/orgx/orderer3/msp/config.yaml
kubectl get deployment orderer3 -n orgx -o yaml
kubectl edit deployment orderer3 -n orgx
kubectl rollout restart deployment orderer2 -n orgdcms
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl edit deployment orderer3 -n orgx
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgx/orderer3/tls/keystore/key.pem
~cd ~
cd ~
kubectl edit deployment orderer3 -n orgx
kubectl rollout restart deployment orderer3 -n orgx
kubectl rollout status deployment orderer3 -n orgx
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgx/orderer3/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgx/orderer3/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl get pods -n orgdcms -l app=orderer1
kubectl get pods -n orgdcms -l app=orderer2
kubectl get pods -n orgx    -l app=orderer3
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pods -n orgdcms -l app=orderer1
kubectl get pods -n orgdcms -l app=orderer2
kubectl get pods -n orgx    -l app=orderer3
kubectl get pods -n orgdcms -l app=orderer1
kubectl get pods -n orgdcms -l app=orderer2
kubectl get pods -n orgx    -l app=orderer3
kubectl get pods -n orgdcms -l app=orderer1
kubectl get pods -n orgdcms --show-labels
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get deployment -n orgdcms
kubectl get deployment -n orgx
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl scale deployment orderer3 -n orgx    --replicas=1
kubectl get deployment -n orgx
kubectl get deployment -n orgdcms
kubectl get pods -n orgx
kubectl get pods -n orgdcms
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl get pods -n orgdcms | grep orderer2
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/artifacts/canale1.block   --orderer-address localhost:27053   --ca-file /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
kubectl get pods -n orgdcms | grep orderer2| grep orderer1
kubectl get pods -n orgdcms | grep orderer2
kubectl get pods -n orgdcms | grep orderer1
kubectl get pods -n orgx | grep orderer3
kubectl get pods -n orgdcms | grep orderer1
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl get pods -n orgdcms | grep orderer1
kubectl delete deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms | grep orderer1
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl get pods -n orgdcms | grep orderer1
kubectl logs -n orgdcms deployment/orderer1 --tail=50
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl get deployment orderer1 -n orgdcms -o yaml | grep ORDERER_GENERAL_TLS_CERTIFICATE
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml --force
kubectl patch deployment orderer1 -n orgdcms   -p '{"spec":{"template":{"metadata":{"annotations":{"restartedAt":"'$(date +%s)'"}}}}'
kubectl patch deployment orderer1 -n orgdcms   -p '{"spec":{"template":{"metadata":{"annotations":{"restartedAt":"'$(date +%s)'"}}}}'
kubectl get pods -n orgdcms | grep orderer1
kubectl delete deployment orderer1 -n orgdcms
kubectl get deployment -n orgdcms | grep orderer1
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl get deployment orderer1 -n orgdcms -o yaml | grep ORDERER_GENERAL_TLS
kubectl delete deployment orderer1 -n orgdcms
kubectl get deployment -n orgdcms | grep orderer1
grep ORDERER_GENERAL_TLS_PRIVATEKEY k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl delete deployment orderer1 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl get pods -n orgdcms | grep orderer1
kubectl get pods -n orgdcms | grep orderer2
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl get pods -n orgdcms | grep orderer2
kubectl apply -f k8s/orgdcms/orderer/bootstrap-orderer2.yaml
kubectl logs -n orgdcms job/bootstrap-orderer2
kubectl get pods -n orgdcms | grep orderer2
kubectl get pods -n orgdcms 
kubectl get pvc -n orgdcms | grep orderer2
kubectl apply -f k8s/orgdcms/pvc/orderer2-msp-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer2-tls-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer2-ledger-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer2
kubectl delete job bootstrap-orderer2 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/bootstrap-orderer2.yaml
kubectl get pods -n orgdcms | grep bootstrap-orderer2
kubectl get pvc -n orgdcms | grep orderer2
kubectl get pods -n orgdcms 
kubectl apply -f k8s/orgdcms/orderer/inspect-orderer2-pvc.yaml
kubectl logs -n orgdcms pod/inspect-orderer2-pvc
kubectl apply -f k8s/orgdcms/orderer/inspect-orderer2-pvc.yaml
kubectl logs -n orgdcms pod/inspect-orderer2-pvc
kubectl delete deployment orderer2 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/orderer2-deployment.yaml
kubectl rollout status deployment/orderer2 -n orgdcms
kubectl get pods -n orgdcms | grep orderer2
kubectl logs -n orgdcms deployment/orderer2 --tail=20
kubectl scale deployment orderer3 -n orgx --replicas=0
kubectl get pods -n orgx | grep orderer3
kubectl apply -f k8s/orgx/orderer/bootstrap-orderer3.yaml

kubectl apply -f k8s/orgx/orderer/bootstrap-orderer3.yaml
kubectl get pods -n orgx | grep orderer3
kubectl logs -n orgx job/bootstrap-orderer3
kubectl get pvc -n orgx | grep orderer3
kubectl apply -f k8s/orgx/pvc/orderer3-msp-pvc.yaml
kubectl apply -f k8s/orgx/pvc/orderer3-tls-pvc.yaml
kubectl apply -f k8s/orgx/pvc/orderer3-ledger-pvc.yaml
kubectl get pvc -n orgx | grep orderer3
kubectl get pvc -n orgdcms | grep orderer2
kubectl delete job bootstrap-orderer3 -n orgx
kubectl apply -f k8s/orgx/orderer/bootstrap-orderer3.yaml
kubectl get pods -n orgx | grep bootstrap-orderer3
kubectl apply -f k8s/orgx/orderer/inspect-orderer3-pvc.yaml
kubectl logs -n orgx pod/inspect-orderer3-pvc
kubectl delete deployment orderer3 -n orgx
kubectl apply -f k8s/orgx/orderer/orderer3-deployment.yaml
kubectl rollout status deployment/orderer3 -n orgx
kubectl get pods -n orgdcms
kubectl describe pod orderer1-c5f4bb7d8-zqnrm -n orgdcms
kubectl get pvc -n orgdcms | grep orderer1
kubectl apply -f k8s/orgdcms/pvc/orderer1-msp-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer1-tls-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer1-ledger-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer1-msp-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer1-tls-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/orderer1-ledger-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer1
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl get pvc -n orgdcms | grep orderer1
kubectl get pods -n orgdcms | grep orderer1
orderer1-c5f4bb7d8-h96jc         0/1     Error     3 (34s ago)     47s
kubectl logs -n orgdcms deployment/orderer1 --tail=50
kubectl get pods -n orgdcms | grep orderer1
kubectl delete pod pvc-init-orderer1 -n orgdcms
kubectl delete pod orderer1-c5f4bb7d8-h96jc -n orgdcms
kubectl get pods -n orgdcms | grep orderer1
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl get pods -n orgdcms | grep orderer1
kubectl apply -f k8s/orgdcms/orderer/inspect-orderer1-pvc.yaml
kubectl logs -n orgdcms pod/inspect-orderer1-pvc
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl logs -n orgdcms deployment/orderer1 --tail=30
kubectl get pods -n orgdcms | grep orderer1
kubectl delete job bootstrap-orderer1 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/bootstrap-orderer1.yaml
kubectl logs -n orgdcms job/bootstrap-orderer1
kubectl get pods -n orgdcms | grep orderer1
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl get pods -n orgx | grep orderer3
orderer3-64bfc7db75-5h8pr        0/1     CrashLoopBackOff   2 (15s ago)   31s
kubectl logs -n orgx deployment/orderer3 --tail=20
kubectl exec -n orgx deployment/orderer3 -- ls /var/hyperledger/orderer/msp/cacerts
8s/orgx/orderer/orderer3-deployment.yaml
k8s/orgx/orderer/orderer3-deployment.yaml
kubectl exec -n orgx deployment/orderer3 -- ls /var/hyperledger/orderer/msp/cacerts
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout restart deployment/orderer1 -n orgdcms
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl logs -n orgdcms deployment/orderer1 --tail=10
kubectl apply -f k8s/orgdcms/orderer/orderer3-deployment.yaml
kubectl rollout restart deployment/orderer2 -n orgdcms
kubectl rollout status deployment/orderer2 -n orgdcms
kubectl logs -n orgdcms deployment/orderer2 --tail=10
kubectl rollout restart deployment/orderer3 -n orgx
ubectl apply -f k8s/orgx/orderer/orderer3-deployment.yaml
kubectl rollout restart deployment/orderer3 -n orgx
kubectl rollout status deployment/orderer3 -n orgx
kubectl version > cluster/kubectl-version.txt
kubectl config current-context > cluster/context.txt
kubectl get nodes -o wide > cluster/nodes.txt
kubectl version
kubectl config current-context
kubectl get nodes -o wide
kubectl get all -n orgdcms > orgdcms/all.txt
kubectl get all -n orgx
mkdir -p orgdcms/deployments
kubectl get deployment orderer1 -n orgdcms -o yaml   > orgdcms/deployments/orderer1.yaml
kubectl get deployment orderer2 -n orgdcms -o yaml   > orgdcms/deployments/orderer2.yaml
kubectl get deployment peer0 -n orgdcms -o yaml   > orgdcms/deployments/peer0-LEGACY.yaml
mkdir -p orgx/deployments
kubectl get deployment -n orgx -o yaml   > orgx/deployments/all-deployments.yaml
kubectl get deployment orderer3 -n orgx -o yaml   > orgx/deployments/orderer3.yaml
kubectl get deployment -n orgdcms -o yaml   > orgdcms/deployments/all-deployments.yaml
mkdir -p orgdcms/pods
kubectl get pods -n orgdcms -o wide   > orgdcms/pods/pods-list.txt
kubectl get pods -n orgdcms --show-labels   > orgdcms/pods/pods-labels.txt
mkdir -p orgx/pods
kubectl get pods -n orgx -o wide   > orgx/pods/pods-list.txt
kubectl get pods -n orgx --show-labels   > orgx/pods/pods-labels.txt
mkdir -p orgdcms/logs orgx/logs
kubectl logs -n orgdcms deployment/orderer1   > orgdcms/logs/orderer1.log
kubectl logs -n orgdcms deployment/orderer2   > orgdcms/logs/orderer2.log
kubectl logs -n orgx deployment/orderer3   > orgx/logs/orderer3.log
mkdir -p orgdcms/services orgx/services
kubectl get svc -n orgdcms -o yaml   > orgdcms/services/services.yaml
kubectl get svc -n orgx -o yaml   > orgx/services/services.yaml
mkdir -p orgdcms/config orgx/config
kubectl get configmap -n orgdcms -o yaml   > orgdcms/config/configmaps.yaml
kubectl get configmap -n orgx -o yaml   > orgx/config/configmaps.yaml
kubectl get pvc -n orgdcms > orgdcms/pvc.txt
kubectl get pvc -n orgx    > orgx/pvc.txt
kubectl get pvc -n orgdcms
kubectl get pvc -n orgx
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:17053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem   > orgdcms/orderer1-channels.json
kubectl get all -A -o yaml > freeze-all.yaml
kubectl get pvc -A -o yaml > freeze-pvc.yaml
kubectl get svc -A -o yaml > freeze-svc.yaml
kubectl get configmap -A -o yaml > freeze-configmap.yaml
kubectl get secret -A -o yaml > freeze-secret.yaml
kubectl get deployment -n orgdcms -o yaml > freeze-orgdcms-deploy.yaml
kubectl get deployment -n orgx -o yaml > freeze-orgx-deploy.yaml
tar -czf freeze-runtime-orgdcms.tar.gz /home/asantopadre/runtime/orgdcms
tar -czf freeze-runtime-orgx.tar.gz /home/asantopadre/runtime/orgx
sudo tar -czf freeze-k3s-local-path.tar.gz /var/lib/rancher/k3s/storage
kubectl get pods -A
kubectl get pvc -A
mkdir -p k8s/{base,orgdcms,orgx}/{pvc,ca,tlsca,orderer,peer}
mkdir -p k8s/base/storage
kubectl apply -f k8s/orgdcms/pvc/ca-pvc.yaml
kubectl apply -f k8s/orgdcms/pvc/tlsca-pvc.yaml
kubectl apply -f k8s/orgdcms/ca/ca-deployment.yaml
kubectl apply -f k8s/orgdcms/ca/ca-service.yaml
kubectl apply -f k8s/orgdcms/tlsca/tlsca-deployment.yaml
kubectl apply -f k8s/orgdcms/tlsca/tlsca-service.yaml
kubectl get pods -n orgdcms
kubectl get svc -n orgdcms
kubectl get pvc -n orgdcms
kubectl apply -f k8s/orgx/pvc/ca-pvc.yaml
kubectl apply -f k8s/orgx/pvc/tlsca-pvc.yaml
kubectl apply -f k8s/orgx/ca/ca-deployment.yaml
kubectl apply -f k8s/orgx/ca/ca-service.yaml
kubectl apply -f k8s/orgx/tlsca/tlsca-deployment.yaml
kubectl apply -f k8s/orgx/tlsca/tlsca-service.yaml
kubectl get pods -n orgx
kubectl get svc -n orgx
kubectl get pvc -n orgx
ls artifacts/orderer*/msp/{cacerts,signcerts,keystore,config.yaml}
ls artifacts/orderer1/msp/{cacerts,signcerts,keystore,config.yaml}
ls artifacts/orderer2/msp/{cacerts,signcerts,keystore,config.yaml}
ls artifacts/orderer3/msp/{cacerts,signcerts,keystore,config.yaml}
ls /home/asantopadre/runtime/orgdcms/orderer1
ls /home/asantopadre/runtime/orgdcms/orderer1/msp
ls /home/asantopadre/runtime/orgdcms/orderer1/tls
ls /home/asantopadre/runtime/orgdcms/orderer1/msp/{cacerts,signcerts,keystore}
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/{signcerts,keystore,tlscacerts}
# Estrai SKI dal certificato di firma MSP
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/signcerts/cert.pem   -noout -text | grep -A1 "Subject Key Identifier"
for k in /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/*_sk; do   echo "== $k";   openssl pkey -in "$k" -pubout |   openssl sha256; done
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/signcerts/cert.pem   -pubkey -noout | openssl sha256
mkdir -p artifacts/orgdcms/orderer1/{msp/{cacerts,signcerts,keystore},tls/{signcerts,keystore,tlscacerts}}
cp /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/*    artifacts/orgdcms/orderer1/msp/cacerts/
cp /home/asantopadre/runtime/orgdcms/orderer1/msp/signcerts/cert.pem    artifacts/orgdcms/orderer1/msp/signcerts/
cp /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk    artifacts/orgdcms/orderer1/msp/keystore/key.pem
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer2/msp/signcerts/cert.pem   -noout -text | grep -A1 "Subject Key Identifier"
for k in /home/asantopadre/runtime/orgdcms/orderer2/msp/keystore/*_sk; do   echo "== $k";   openssl pkey -in "$k" -pubout |   openssl sha256; done
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer2/msp/signcerts/cert.pem   -pubkey -noout | openssl sha256
# Struttura
mkdir -p artifacts/orgdcms/orderer2/{msp/{cacerts,signcerts,keystore},tls/{signcerts,keystore,tlscacerts}}
# MSP
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/cacerts/*    artifacts/orgdcms/orderer2/msp/cacerts/
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/signcerts/cert.pem    artifacts/orgdcms/orderer2/msp/signcerts/
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/keystore/3c2494345a86eb128f84fc89ac65a42a4f926e3c244240d76c364f0b2ea845d8_sk    artifacts/orgdcms/orderer2/msp/keystore/key.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/msp/config.yaml    artifacts/orgdcms/orderer2/msp/
# TLS
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem    artifacts/orgdcms/orderer2/tls/signcerts/
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem    artifacts/orgdcms/orderer2/tls/keystore/
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/*    artifacts/orgdcms/orderer2/tls/tlscacerts/
cp /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem    artifacts/orgdcms/orderer1/tls/signcerts/
cp /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem    artifacts/orgdcms/orderer1/tls/keystore/
cp /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/*    artifacts/orgdcms/orderer1/tls/tlscacerts/
tree artifacts/orgdcms/orderer1
sudo apt  install tree  # version 2.0.2-1
tree artifacts/orgdcms/orderer1
# Identifica SKI
openssl x509   -in /home/asantopadre/runtime/orgx/orderer3/msp/signcerts/cert.pem   -noout -text | grep -A1 "Subject Key Identifier"
# Trova la chiave corrispondente
for k in /home/asantopadre/runtime/orgx/orderer3/msp/keystore/*_sk; do   echo "== $k";   openssl pkey -in "$k" -pubout | openssl sha256; done
openssl x509   -in /home/asantopadre/runtime/orgx/orderer3/msp/signcerts/cert.pem   -pubkey -noout | openssl sha256
mkdir -p artifacts/orgx/orderer3/{msp/{cacerts,signcerts,keystore},tls/{signcerts,keystore,tlscacerts}}
cp /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/*    artifacts/orgx/orderer3/msp/cacerts/
cp /home/asantopadre/runtime/orgx/orderer3/msp/signcerts/cert.pem    artifacts/orgx/orderer3/msp/signcerts/
cp /home/asantopadre/runtime/orgx/orderer3/msp/keystore/043203df5e20fcc41509f3946e811ded6c2a41f159101db8369a3f07a4cf6cd9_sk    artifacts/orgx/orderer3/msp/keystore/key.pem
cp /home/asantopadre/runtime/orgx/orderer3/msp/config.yaml    artifacts/orgx/orderer3/msp/
cp /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem    artifacts/orgx/orderer3/tls/signcerts/
cp /home/asantopadre/runtime/orgx/orderer3/tls/keystore/key.pem    artifacts/orgx/orderer3/tls/keystore/
cp /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/*    artifacts/orgx/orderer3/tls/tlscacerts/
# orderer1
openssl x509  -in artifacts/orgdcms/orderer1/tls/signcerts/cert.pem  -noout -text | grep -A1 "Subject Alternative Name"
# orderer2
openssl x509  -in artifacts/orgdcms/orderer2/tls/signcerts/cert.pem  -noout -text | grep -A1 "Subject Alternative Name"
# orderer3
openssl x509  -in artifacts/orgx/orderer3/tls/signcerts/cert.pem  -noout -text | grep -A1 "Subject Alternative Name"
openssl x509  -in artifacts/orgdcms/orderer1/tls/signcerts/cert.pem  -noout -text | grep -A1 "Subject Alternative Name"
# 1) orderer1
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl run pvc-init-orderer1   -n orgdcms   --rm -it   --image=alpine   --restart=Never   --overrides='
{
  "spec": {
    "containers": [{
      "name": "init",
      "image": "alpine",
      "command": ["sh"],
      "volumeMounts": [
        {"name": "msp", "mountPath": "/dst/msp"},
        {"name": "tls", "mountPath": "/dst/tls"}
      ]
    }],
    "volumes": [
      {"name": "msp", "persistentVolumeClaim": {"claimName": "orderer1-msp-pvc"}},
      {"name": "tls", "persistentVolumeClaim": {"claimName": "orderer1-tls-pvc"}}
    ]
  }
}'
kubectl run pvc-init-orderer1   -n orgdcms   --image=alpine   --restart=Never   --command -- sleep 3600   --overrides='
{
  "spec": {
    "containers": [{
      "name": "init",
      "image": "alpine",
      "command": ["sleep","3600"],
      "volumeMounts": [
        {"name": "msp", "mountPath": "/dst/msp"},
        {"name": "tls", "mountPath": "/dst/tls"}
      ]
    }],
    "volumes": [
      {"name": "msp", "persistentVolumeClaim": {"claimName": "orderer1-msp-pvc"}},
      {"name": "tls", "persistentVolumeClaim": {"claimName": "orderer1-tls-pvc"}}
    ]
  }
}'
kubectl get pod pvc-init-orderer1 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/bootstrap-orderer1.yaml
kubectl logs -n orgdcms job/bootstrap-orderer1
kubectl get pods -n orgdcms | grep bootstrap
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/msp/signcerts
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/tls/signcerts
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/msp/signcerts

kubectl rollout status deployment/orderer1 -n orgdcms
kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].spec.containers[*].name}'
kubectl apply -f k8s/orgx/orderer/inspect-orderer3-pvc.yaml
kubectl logs -n orgx pod/inspect-orderer3-pvc
kubectl apply -f k8s/orgx/orderer/orderer3-deployment.yaml
kubectl rollout restart deployment/orderer3 -n orgx
kubectl rollout status deployment/orderer3 -n orgx
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl logs -n orgdcms deployment/orderer1 | grep -i leader
kubectl port-forward -n orgdcms svc/orderer2 7054:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl apply -f orderer3-service.yaml
kubectl apply -f k8s/orgx/orderer/orderer3-service.yaml
kubectl get svc -n orgx | grep orderer3
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl rollout restart deployment/orderer2 -n orgdcms
kubectl get pod -n orgdcms | grep orderer2
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl get pod -n orgdcms | grep orderer1
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/msp
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/msp/signcerts
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/msp/cacerts
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/msp/config.yaml
kubectl exec -n orgdcms deployment/orderer1 --   netstat -tlnp | grep 7053
openssl s_client  -connect orderer1.orgdcms.svc.cluster.local:7053  -CAfile artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem
kubectl get svc -n orgdcms orderer1 -o yaml
openssl s_client  -connect localhost:7053  -CAfile artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1 | grep -i raft
osnadmin channel list   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
sudo sh -c 'echo "127.0.0.1 orderer1.orgdcms.svc.cluster.local" >> /etc/hosts'
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
ubectl get pod -n orgdcms | grep orderer2
kubectl get pod -n orgdcms | grep orderer2
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
Error: Post "https://orderer2.orgdcms.svc.cluster.local:7053/participation/v1/channels": tls: failed to verify certificate: x509: certificate is valid for orderer1, orderer1.orgdcms.svc.cluster.local, not orderer2.orgdcms.svc.cluster.local
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
cat /etc/hosts
getent hosts orderer2.orgdcms.svc.cluster.local
cd etc
cd /etc
ls
cd ~
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1 | grep -i leader
kubectl logs -n orgdcms deployment/orderer2 | grep -i leader
kubectl logs -n orgx   deployment/orderer3 | grep -i leader
kubectl logs -n orgdcms deployment/orderer2 | grep -i leader
kubectl logs -n orgx   deployment/orderer3 | grep -i leader
kubectl logs -n orgdcms deployment/orderer1
kubectl logs -n orgdcms deployment/orderer2
kubectl logs -n orgx   deployment/orderer3
kubectl get pod -n orgdcms 
kubectl get pod -n orgx 
kubectl logs -f -n orgdcms deployment/orderer1
kubectl logs -n orgdcms deployment/orderer1
kubectl logs -n orgdcms deployment/orderer2
kubectl logs -n orgx   deployment/orderer3
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl logs -n orgx   deployment/orderer3
kubectl get deployment orderer1 -n orgdcms -o yaml
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout restart deployment/orderer1 -n orgdcms
kubectl get pod -n orgx 
kubectl get pod -n orgdcms
kubectl rollout restart deployment/orderer2 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/orderer2-deployment.yaml
kubectl rollout restart deployment/orderer2 -n orgdcms
kubectl get pod -n orgdcms
kubectl apply -f k8s/orgx/orderer/orderer3-deployment.yaml
kubectl rollout restart deployment/orderer3 -n orgx
kubectl get pod -n orgx
kubectl get deployment orderer1 -n orgdcms -o yaml
kubectl logs -n orgx   deployment/orderer3
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/canale1.block   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/canale1.block   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artif~~~~~~~~~~~acts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/canale1.block   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl get deployment orderer1 -n orgdcms -o yaml
kubectl logs -n orgx   deployment/orderer3
kubectl logs -n orgx   deployment/orderer3 | grep -i leader
kubectl logs -n orgx   deployment/orderer3
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl logs -n orgx   deployment/orderer3 
kubectl logs -n orgdcms   deployment/orderer2
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer2/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer2/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file artifacts/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert artifacts/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file artifacts/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem   --client-cert artifacts/orgx/orderer3/tls/signcerts/cert.pem   --client-key artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl exec -n orgdcms deployment/orderer1 -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl exec -n orgdcms orderer1 -- openssl x509 -in /var/hyperledger/orderer/tls/signcerts/cert.pem -noout -fingerprint -sha256
kubectl get pods -n orgdcms
kubectl exec -n orgdcms orderer1-orderer1-645f7498f-xqrxt -- openssl x509 -in /var/hyperledger/orderer/tls/signcerts/cert.pem -noout -fingerprint -sha256
kubectl exec -n orgdcms orderer1-645f7498f-xqrxt -- openssl x509 -in /var/hyperledger/orderer/tls/signcerts/cert.pem -noout -fingerprint -sha256
kubectl cp -n orgdcms orderer1-645f7498f-xqrxt:/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-cert.pem
openssl x509 -in /tmp/orderer1-cert.pem -noout -fingerprint -sha256
openssl x509 -in ~/fabric-deploy/orderer1-tls/signcerts/cert.pem -noout -fingerprint -sha256
kubectl cp -n orgdcms orderer2-5977f8bf5c-sqnkv:/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-cert.pem
openssl x509 -in /tmp/orderer2-cert.pem -noout -fingerprint -sha256
kubectl get pods -n orgx
kubectl cp -n orgdcms orderer2-5977f8bf5c-sqnkv:/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer2-cert.pem
openssl x509 -in /tmp/orderer2-cert.pem -noout -fingerprint -sha256
openssl x509 -in ~/fabric-deploy/orderer2-tls/signcerts/cert.pem -noout -fingerprint -sha256
kubectl cp -n orgx orderer3-85bbcbfd4f-thfzd:/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer3-cert.pem
openssl x509 -in /tmp/orderer3-cert.pem -noout -fingerprint -sha256
openssl x509 -in ~/fabric-deploy/orderer3-tls/signcerts/cert.pem -noout -fingerprint -sha256
mkdir -p ~/fabric-deploy/artifacts/tls/orderer1
mkdir -p ~/fabric-deploy/artifacts/tls/orderer2
mkdir -p ~/fabric-deploy/artifacts/tls/orderer3
mkdir -p ~/artifacts/tls/orderer1
mkdir -p ~/artifacts/tls/orderer2
mkdir -p ~/artifacts/tls/orderer3
kubectl cp -n orgdcms orderer1-645f7498f-xqrxt:/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/tls/orderer1/cert.pem
kubectl cp -n orgdcms orderer2-orderer2-5977f8bf5c-sqnkv:/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/tls/orderer2/cert.pem
kubectl cp -n orgdcms orderer2-5977f8bf5c-sqnkv:/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/tls/orderer2/cert.pem
kubectl cp -n orgx    orderer3--85bbcbfd4f-thfzd:/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/tls/orderer3/cert.pem
kubectl cp -n orgx    orderer3-85bbcbfd4f-thfzd:/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/tls/orderer3/cert.pem
export FABRIC_CFG_PATH=~/artifacts
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./canale1.block
export FABRIC_CFG_PATH=~/artifacts
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
ls -l ~/artifacts/channel-artifacts/canale1.block
kubectl scale deployment orderer1 --replicas=0 -n orgdcms
kubectl scale deployment orderer2 --replicas=0 -n orgdcms
kubectl scale deployment orderer3 --replicas=0 -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl scale deployment orderer1 --replicas=1 -n orgdcms
kubectl scale deployment orderer2 --replicas=1 -n orgdcms
kubectl scale deployment orderer3 --replicas=1 -n orgx
kubectl rollout status deployment/orderer1 -n orgdcms
kubectl rollout status deployment/orderer2 -n orgdcms
kubectl rollout status deployment/orderer3 -n orgx
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address ordererX.orgY.svc.cluster.local:7053   --ca-file ~/artifacts/tls/ordererX/cert.pem   --client-cert ~/artifacts/tls/ordererX/cert.pem   --client-key  ~/artifacts/tls/ordererX/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/tls/orderer1/cert.pem   --client-cert ~/artifacts/tls/orderer1/cert.pem   --client-key  ~/artifacts/tls/orderer1/key.pem
mv ~/artifacts/tls/orderer1/cert.pem ~/artifacts/orgdcms/orderer1/tls/cert.pem
mv ~/artifacts/tls/orderer2/cert.pem ~/artifacts/orgdcms/orderer2/tls/cert.pem
mv ~/artifacts/tls/orderer3/cert.pem ~/artifacts/orgx/orderer3/tls/cert.pem
kubectl get pods -n orgx
kubectl cp -n orgx orderer3-85bbcbfd4f-wm6kf:/var/hyperledger/orderer/tls/keystore/*.pem ~/artifacts/orgx/orderer3/tls/keystore/key.pem
openssl x509 -in ~/artifacts/orgx/orderer3/tls/cert.pem -noout -modulus | openssl sha256
openssl rsa  -in ~/artifacts/orgx/orderer3/tls/keystore/key.pem -noout -modulus | openssl sha256
openssl x509 -in ~/artifacts/orgx/orderer3/tls/cert.pem -noout -modulus | openssl sha256
openssl rsa  -in ~/artifacts/orgx/orderer3/tls/keystore/key.pem -noout -modulus | openssl sha256
kubectl cp -n orgx orderer3-85bbcbfd4f-wm6kf:/var/hyperledger/orderer/tls/keystore/<NOME_FILE>.pem ~/artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl cp -n orgx orderer3-85bbcbfd4f-wm6kf:/var/hyperledger/orderer/tls/keystore/key.pem ~/artifacts/orgx/orderer3/tls/keystore/key.pem
openssl rsa -in ~/artifacts/orgx/orderer3/tls/keystore/<NOME_FILE>.pem -noout -modulus | openssl sha256
openssl x509 -in ~/artifacts/orgx/orderer3/tls/cert.pem -noout -modulus | openssl sha256
openssl rsa -in ~/artifacts/orgx/orderer3/tls/keystore/key.pem -noout -modulus | openssl sha256
openssl rsa -in ~/artifacts/orgx/orderer3/tls/keystore/<NOME_FILE>.pem -noout -modulus | openssl sha256
openssl x509 -in ~/artifacts/orgx/orderer3/tls/cert.pem -noout -modulus | openssl sha256
openssl rsa -in ~/artifacts/orgx/orderer3/tls/keystore/key.pem -noout -modulus | openssl sha256
openssl pkey -in ~/artifacts/orgx/orderer3/tls/keystore/key.pem -pubout | openssl sha256
openssl x509 -in ~/artifacts/orgx/orderer3/tls/cert.pem -pubkey -noout | openssl sha256
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key  ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key  ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1 | grep -E "Raft|leader|election"
kubectl logs -n orgdcms deployment/orderer2 | grep -E "Raft|leader|election"
kubectl logs -n orgx deployment/orderer3 | grep -E "Raft|leader|election"
kubectl logs -n orgdcms deployment/orderer1 --since=10m
kubectl logs -n orgdcms deployment/orderer2 --since=10m
kubectl logs -n orgdcms deployment/orderer3 --since=10m
kubectl logs -n orgx deployment/orderer3 --since=10m
kubectl exec -n orgx orderer3-<POD> -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl get pods -n orgx
kubectl exec -n orgx orderer3-85bbcbfd4f-wm6kf -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl exec -n orgx deployment/orderer3 -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl cp -n orgdcms fabric-ca-<POD>:/etc/hyperledger/fabric-ca-server/tls-cert.pem ~/artifacts/tlsca-orgdcms.pem
kubectl get pods -n orgdcms
kubectl cp -n orgdcms fabric-ca-fcdc4d796-nz5js:/etc/hyperledger/fabric-ca-server/tls-cert.pem ~/artifacts/tlsca-orgdcms.pem
kubectl get pods -n orgx
kubectl cp ~/artifacts/tlsca-orgdcms.pem -n orgx orderer3-85bbcbfd4f-wm6kf:/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgdcms.pem
kubectl exec -n orgx orderer3-<POD> -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl exec -n orgx orderer3-85bbcbfd4f-wm6kf -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl rollout restart deployment/orderer3 -n orgx
kubectl get pods -n orgx
kubectl logs -n orgx deployment/orderer3 --since=10m
kubectl exec -n orgx orderer3-9465f6558-8vxpx -- printenv | grep ORDERER_GENERAL_TLS_ROOTCAS
kubectl edit deployment orderer3 -n orgx
kubectl rollout restart deployment/orderer3 -n orgx
kubectl get pods -n orgx
kubectl exec -n orgx orderer3-55d79857d6-kjfcb -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl logs -n orgx deployment/orderer3 | grep -i "bad certificate"
kubectl exec -n orgdcms deployment/orderer1 -- printenv | grep ORDERER_GENERAL_TLS_ROOTCAS
kubectl get pods -n orgdcms
kubectl cp ~/artifacts/orgx/orderer3/tls/tlscacerts/tlsca-orgx.pem -n orgdcms orderer1-645f7498f-85cps:/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgx.pem
kubectl cp ~/artifacts/orgx/orderer3/tls/tlscacerts/tlsca-orgx.pem -n orgdcms orderer2-5977f8bf5c-bjqhk:/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgx.pem
kubectl cp -n orgx orderer3-9465f6558-8vxpx:/var/hyperledger/orderer/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem ~/artifacts/tlsca-orgx.pem
kubectl get pods -n orgx
kubectl cp -n orgx orderer3-55d79857d6-kjfcb:/var/hyperledger/orderer/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem ~/artifacts/tlsca-orgx.pem
kubectl cp ~/artifacts/tlsca-orgx.pem -n orgdcms orderer1-645f7498f-85cps:/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgx.pem
kubectl cp ~/artifacts/tlsca-orgx.pem -n orgdcms orderer2-5977f8bf5c-bjqhk:/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgx.pem
kubectl exec -n orgdcms orderer1-645f7498f-85cps -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl exec -n orgdcms orderer2-5977f8bf5c-bjqhk -- ls /var/hyperledger/orderer/tls/tlscacerts
kubectl edit deployment orderer1 -n orgdcms
kubectl edit deployment orderer2 -n orgdcms
kubectl rollout restart deployment/orderer1 -n orgdcms
kubectl rollout restart deployment/orderer2 -n orgdcms
ubectl logs -n orgdcms deployment/orderer1 | grep -i "bad certificate"
kubectl logs -n orgdcms deployment/orderer2 | grep -i "bad certificate"
kubectl logs -n orgx    deployment/orderer3 | grep -i "bad certificate"
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs -n orgdcms orderer1-c789fb9bf-tqp7z --previous
kubectl logs -n orgdcms orderer2-6b759878f-rdqnr --previous
kubectl edit deployment orderer1 -n orgdcms
kubectl edit deployment orderer2 -n orgdcms
kubectl rollout restart deployment/orderer1 -n orgdcms
kubectl rollout restart deployment/orderer2 -n orgdcms
kubectl get pods -n orgdcms
kubectl delete pod orderer1-5bc64889c5-g9hdh -n orgdcms
kubectl delete pod orderer1-849858699b-q9bxc -n orgdcms
kubectl delete pod orderer2-5456456c87-vc75r -n orgdcms
kubectl rollout restart deployment/orderer1 -n orgdcms
kubectl rollout restart deployment/orderer2 -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl exec -n orgdcms orderer2-5977f8bf5c-bjqhk -- printenv | grep ORDERER_GENERAL
kubectl get pods -n orgdcms
kubectl get pods -n orgdcms --show-all
kubectl get rs -n orgdcms
kubectl get events -n orgdcms --sort-by=.metadata.creationTimestamp
kubectl describe pod orderer1-5bc64889c5-6bkcv -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl describe pod orderer1-7dd9c8d7c5-88lvz -n orgdcms
kubectl logs -n orgdcms orderer1-7dd9c8d7c5-88lvz --previous
kubectl edit deployment orderer1 -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl logs -n orgdcms orderer1-7dd9c8d7c5-88lvz --previous
kubectl edit deployment orderer1 -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl scale deployment orderer3 -n orgx --replicas=0
kubectl exec -n orgdcms inspect-orderer1-pvc -- ls /var/hyperledger/orderer/tls
kubectl exec -n orgdcms inspect-orderer1-pvc -- ls /var/hyperledger/orderer/msp
kubectl run inspect-orderer1   -n orgdcms   --rm -it   --image=busybox   --overrides='
{
  "spec": {
    "containers": [{
      "name": "inspect",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [
        {
          "name": "tls",
          "mountPath": "/mnt/tls"
        },
        {
          "name": "msp",
          "mountPath": "/mnt/msp"
        }
      ]
    }],
    "volumes": [
      {
        "name": "tls",
        "persistentVolumeClaim": {
          "claimName": "orderer1-tls-pvc"
        }
      },
      {
        "name": "msp",
        "persistentVolumeClaim": {
          "claimName": "orderer1-msp-pvc"
        }
      }
    ]
  }
}'
kubectl run inspect-orderer1   -n orgdcms   --rm -it   --image=busybox   --overrides='
{
  "spec": {
    "containers": [{
      "name": "inspect",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [
        {
          "name": "tls",
          "mountPath": "/mnt/tls"
        },
        {
          "name": "msp",
          "mountPath": "/mnt/msp"
        }
      ]
    }],
    "volumes": [
      {
        "name": "tls",
        "persistentVolumeClaim": {
          "claimName": "orderer1-tls-pvc"
        }
      },
      {
        "name": "msp",
        "persistentVolumeClaim": {
          "claimName": "orderer1-msp-pvc"
        }
      }
    ]
  }
}'
kubectl delete pod inspect-orderer1 -n orgdcms
kubectl run inspect-orderer1   -n orgdcms   --rm -it   --image=busybox   --overrides='
{
  "spec": {
    "containers": [{
      "name": "inspect",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [
        {
          "name": "tls",
          "mountPath": "/mnt/tls"
        },
        {
          "name": "msp",
          "mountPath": "/mnt/msp"
        }
      ]
    }],
    "volumes": [
      {
        "name": "tls",
        "persistentVolumeClaim": {
          "claimName": "orderer1-tls-pvc"
        }
      },
      {
        "name": "msp",
        "persistentVolumeClaim": {
          "claimName": "orderer1-msp-pvc"
        }
      }
    ]
  }
}'
kubectl get pods -n orgdcms
kubectl delete pod inspect-orderer1 -n orgdcms
kubectl run inspect-orderer1   -n orgdcms   --rm -it   --image=busybox   --overrides='
{
  "spec": {
    "containers": [{
      "name": "inspect",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [
        {
          "name": "tls",
          "mountPath": "/mnt/tls"
        },
        {
          "name": "msp",
          "mountPath": "/mnt/msp"
        }
      ]
    }],
    "volumes": [
      {
        "name": "tls",
        "persistentVolumeClaim": {
          "claimName": "orderer1-tls-pvc"
        }
      },
      {
        "name": "msp",
        "persistentVolumeClaim": {
          "claimName": "orderer1-msp-pvc"
        }
      }
    ]
  }
}'
kubectl get pods -n orgdcms
kubectl delete pod inspect-orderer1 -n orgdcms
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer1
spec:
  restartPolicy: Never
  containers:
  - name: inspect
    image: busybox
    command: ["sleep", "3600"]
    volumeMounts:
    - name: tls
      mountPath: /mnt/tls
    - name: msp
      mountPath: /mnt/msp
  volumes:
  - name: tls
    persistentVolumeClaim:
      claimName: orderer1-tls-pvc
  - name: msp
    persistentVolumeClaim:
      claimName: orderer1-msp-pvc
EOF

kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it inspect-orderer1 -- sh
kubectl delete pod inspect-orderer1 -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl logs -n orgdcms orderer1-74b9b8dc87-qlx5t --previous
kubectl logs -n orgdcms orderer1-74b9b8dc87-qlx5t
kubectl edit deployment orderer1 -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl get pods -n orgdcms
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms orderer1-987c7b847-kdwq5 --previous
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl delete replicaset -n orgdcms -l app=orderer1
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deployment/orderer1 | grep FATA
kubectl get deployment orderer1 -n orgdcms -o yaml | grep ROOTCAS
kubectl get pods -n orgdcms
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer1
spec:
  restartPolicy: Never
  containers:
  - name: inspect
    image: busybox
    command: ["sleep", "3600"]
    volumeMounts:
    - name: tls
      mountPath: /mnt/tls
    - name: msp
      mountPath: /mnt/msp
  volumes:
  - name: tls
    persistentVolumeClaim:
      claimName: orderer1-tls-pvc
  - name: msp
    persistentVolumeClaim:
      claimName: orderer1-msp-pvc
EOF

kubectl exec -n orgdcms -it inspect-orderer1 -- sh
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl logs -n orgdcms deployment/orderer1
kubectl edit deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl logs -n orgdcms deployment/orderer1
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deployment/orderer1 | grep FATA
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it inspect-orderer1 -- sh
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer2
spec:
  restartPolicy: Never
  containers:
  - name: inspect
    image: busybox
    command: ["sleep", "3600"]
    volumeMounts:
    - name: tls
      mountPath: /mnt/tls
    - name: msp
      mountPath: /mnt/msp
  volumes:
  - name: tls
    persistentVolumeClaim:
      claimName: orderer2-tls-pvc
  - name: msp
    persistentVolumeClaim:
      claimName: orderer2-msp-pvc
EOF

kubectl get pods -n orgdcms
kubectl apply -f k8s/orgdcms/orderer/orderer2-deployment.yaml
kubectl exec -n orgdcms -it inspect-orderer2 -- sh
kubectl apply -f k8s/orgdcms/orderer/orderer2-deployment.yaml
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment orderer3 -n orgdx --replicas=1
kubectl scale deployment orderer3 -n orgx --replicas=1
kubectl get pods -n orgx
kubectl apply -n orgx -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer3
spec:
  restartPolicy: Never
  containers:
  - name: inspect
    image: busybox
    command: ["sleep", "3600"]
    volumeMounts:
    - name: tls
      mountPath: /mnt/tls
    - name: msp
      mountPath: /mnt/msp
  volumes:
  - name: tls
    persistentVolumeClaim:
      claimName: orderer3-tls-pvc
  - name: msp
    persistentVolumeClaim:
      claimName: orderer3-msp-pvc
EOF

kubectl exec -n orgx -it inspect-orderer3 -- sh
kubectl apply -f k8s/orgx/orderer/orderer3-deployment.yaml
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pods -n orgx
osnadmin channel list   --orderer-address <host>:7053   --ca-file <tlsca.pem>   --client-cert <admin-cert.pem>   --client-key <admin-key.pem>
osnadmin channel list  --orderer-address orderer1.orgdcms.svc.cluster.local:7053  --ca-file ~/artifacts/orgdcms/tls-ca.pem  --client-cert ~/artifacts/orgdcms/admin-tls/cert.pem  --client-key  ~/artifacts/orgdcms/admin-tls/key.pem
~/artifacts/orgdcms/tls-ca.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/tls/orderer1/cert.pem   --client-cert ~/artifacts/tls/orderer1/cert.pem   --client-key ~/artifacts/tls/orderer1/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/tls/orderer1/cert.pem   --client-cert ~/artifacts/tls/orderer1/cert.pem   --client-key  ~/artifacts/tls/orderer1/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer1/tls/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key  ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key  ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key  ~/artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1 | grep -E "Raft|consenter|onboard"
kubectl logs -n orgdcms deployment/orderer2 | grep -E "Raft|consenter|onboard"
kubectl logs -n orgdcms deployment/orderer1
kubectl logs -n orgdcms deployment/orderer2
kubectl logs -n orgx deployment/orderer3
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it $(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}') -- sh
kubectl cp -n orgdcms $(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}'):/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-tls-cert.pem
kubectl cp -n orgdcms $(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}'):/var/hyperledger/orderer/tls/tlscacerts /tmp/orderer1-tlscacerts
penssl x509 -in /tmp/orderer1-tls-cert.pem -noout -issuer -subject
openssl x509 -in /tmp/orderer1-tls-cert.pem -noout -issuer -subject
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer1
spec:
  restartPolicy: Never
  containers:
  - name: inspect
    image: busybox
    command: ["sleep", "3600"]
    volumeMounts:
    - name: tls
      mountPath: /mnt/tls
    - name: msp
      mountPath: /mnt/msp
  volumes:
  - name: tls
    persistentVolumeClaim:
      claimName: orderer1-tls-pvc
  - name: msp
    persistentVolumeClaim:
      claimName: orderer1-msp-pvc
EOF

kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it inspect-orderer1 -- sh
kubectl delete pod inspect-orderer1 -n orgdcms
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer1
spec:
  restartPolicy: Never
  containers:
  - name: inspect
    image: busybox
    command: ["sleep", "3600"]
    volumeMounts:
    - name: tls
      mountPath: /mnt/tls
    - name: msp
      mountPath: /mnt/msp
  volumes:
  - name: tls
    persistentVolumeClaim:
      claimName: orderer1-tls-pvc
  - name: msp
    persistentVolumeClaim:
      claimName: orderer1-msp-pvc
EOF

kubectl exec -n orgdcms -it inspect-orderer1 -- sh
kubectl cp -n orgdcms $(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}'):/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-tls-cert.pem
openssl x509 -in /tmp/orderer1-tls-cert.pem -noout -issuer -subject
cd /tmp
ls
cd 
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-cert.pem
kubectl cp -n orgdcms "$POD":/mnt/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-cert.pem
kubectl cp -n orgdcms "$POD":/mnt/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-cert.pem
kubectl cp -n orgdcms "$POD":/mnt/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
echo "$POD"
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-cert.pem
kubectl cp -n orgdcms "$POD":/mnt/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
kubectl exec -n orgdcms -it "$POD" -- sh
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
openssl verify -CAfile /tmp/raft-rootcas.pem /tmp/orderer1-cert.pem
openssl x509 -in /tmp/orderer1-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
POD2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD2":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer2-cert.pem
kubectl cp -n orgdcms "$POD2":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
openssl verify -CAfile /tmp/raft-rootcas.pem /tmp/orderer2-cert.pem
openssl x509 -in /tmp/orderer2-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
POD3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
echo "$POD3"
kubectl cp -n orgx "$POD3":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer3-cert.pem
kubectl cp -n orgx "$POD3":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas.pem
openssl verify -CAfile /tmp/raft-rootcas.pem /tmp/orderer3-cert.pem
openssl x509 -in /tmp/orderer3-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
echo "$POD"
kubectl exec -n orgdcms "$POD" -- sh -lc 'env | sort | grep -E "ORDERER_GENERAL|ADMIN|TLS"'
kubectl exec -n orgdcms "$POD" -- sh -lc 'grep -R "Admin.ListenAddress" /var/hyperledger/orderer'
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout status deployment orderer1 -n orgdcms
kubectl exec -n orgdcms "$POD" -- sh -lc 'env | grep ORDERER_.*_TLS_ROOTCAS'
# 1) Prendi il pod di orderer1
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
echo "$POD"
kubectl exec -n orgdcms "$POD" -- sh -lc 'env | grep ORDERER_.*_TLS_ROOTCAS'
kubectl get deployment orderer1 -n orgdcms -o yaml | grep -A2 ORDERER_.*_TLS_ROOTCAS
kubectl apply -f k8s/orgdcms/orderer/orderer1-deployment.yaml
kubectl rollout status deployment orderer1 -n orgdcms
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
echo "$POD"
kubectl exec -n orgdcms "$POD" -- sh -lc 'env | grep ORDERER_.*_TLS_ROOTCAS'
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /tmp/raft-rootcas.pem   --client-cert /tmp/orderer1-cert.pem   --client-key /tmp/orderer1-key.pem
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/keystore/key.pem /tmp/orderer1-key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /tmp/raft-rootcas.pem   --client-cert /tmp/orderer1-cert.pem   --client-key /tmp/orderer1-key.pem
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem /tmp/admin-tlsca-orgdcms.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /tmp/admin-tlsca-orgdcms.pem   --client-cert /tmp/orderer1-cert.pem   --client-key /tmp/orderer1-key.pem
kubectl apply -f k8s/orgdcms/orderer/orderer2-deployment.yaml
kubectl rollout status deployment orderer2 -n orgdcms
# Verifica ROOTCAS
POD2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms "$POD2" -- sh -lc 'env | grep ORDERER_.*_TLS_ROOTCAS'
kubectl apply -f k8s/orgx/orderer/orderer3-deployment.yaml
kubectl rollout status deployment orderer3 -n orgx
POD3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx "$POD3" -- sh -lc 'env | grep ORDERER_.*_TLS_ROOTCAS'
osnadmin channel join   --channelID canale1   --config-block /tmp/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /tmp/admin-tlsca-orgdcms.pem   --client-cert /tmp/orderer1-cert.pem   --client-key /tmp/orderer1-key.pem
osnadmin channel list  --orderer-address orderer1.orgdcms.svc.cluster.local:7053  --ca-file ~/artifacts/orgdcms/tls-ca.pem  --client-cert ~/artifacts/orgdcms/admin-tls/cert.pem  --client-key  ~/artifacts/orgdcms/admin-tls/key.pem
osnadmin channel list  --orderer-address orderer3.orgx.svc.cluster.local:7053  --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem  --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem  --client-key  ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel list  --orderer-address orderer1.orgdcms.svc.cluster.local:7053  --ca-file ~/artifacts/orgdcms/tls-ca.pem  --client-cert ~/artifacts/orgdcms/admin-tls/cert.pem  --client-key  ~/artifacts/orgdcms/admin-tls/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1
kubectl exec -n orgdcms "$POD" -- sh -lc 'cd /var/hyperledger/orderer/tls/tlscacerts && ls -l && openssl x509 -in raft-rootcas.pem -noout -issuer -subject'
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-orderer1.pem
openssl x509 -in /tmp/raft-rootcas-orderer1.pem -noout -issuer -subject
awk 'BEGIN{c=0} /BEGIN CERT/{c++} {print > ("/tmp/ca_" c ".pem")}' /tmp/raft-rootcas-orderer1.pem
for f in /tmp/ca_*.pem; do echo "== $f =="; openssl x509 -in "$f" -noout -issuer -subject; done
kubectl exec -n orgdcms "$POD" -- sh -lc '
cd /var/hyperledger/orderer/tls/tlscacerts &&
rm -f raft-rootcas.pem &&
cat tls-localhost-7052-tlsca-orgdcms.pem tlsca-orgx.pem > raft-rootcas.pem &&
ls -l raft-rootcas.pem
'
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-orderer1.pem
awk "BEGIN{c=0} /BEGIN CERT/{c++} {print > (\"/tmp/ca_\" c \".pem\")}" /tmp/raft-rootcas-orderer1.pem
for f in /tmp/ca_*.pem; do echo "== $f =="; openssl x509 -in "$f" -noout -issuer -subject; done
openssl x509 -in ~/artifacts/orgx/tls-ca/tlscacerts/*.pem -noout -issuer -subject
for f in ~/artifacts/orgx/tls-ca/tlscacerts/*.pem; do   echo "== $f ==";   openssl x509 -in "$f" -noout -issuer -subject; done
ls -l ~/artifacts/orgx/tls-ca/
for f in ~/artifacts/orgx/orderer3/tls/tlscacerts/*.pem; do   echo "== $f ==";   openssl x509 -in "$f" -noout -issuer -subject; done
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
exec -n orgdcms "$POD" -- sh -lc '
cd /var/hyperledger/orderer/tls/tlscacerts &&
rm -f raft-rootcas.pem &&
cp tls-localhost-7052-tlsca-orgdcms.pem raft-rootcas.pem &&
ls -l raft-rootcas.pem

exit
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-o1.pem
openssl x509 -in /tmp/raft-rootcas-o1.pem -noout -issuer -subject
awk 'BEGIN{c=0} /BEGIN CERT/{c++} {print > ("/tmp/ca_" c ".pem")}' /tmp/raft-rootcas-o1.pem
ls /tmp/ca_*.pem
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-o1.pem
awk 'BEGIN{c=0} /BEGIN CERT/{c++} END{print c}' /tmp/raft-rootcas-o1.pem
# orderer1
POD1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD1":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-o1.pem
openssl x509 -in /tmp/raft-rootcas-o1.pem -noout -issuer -subject
awk 'BEGIN{c=0} /BEGIN CERT/{c++} {print > ("/tmp/ca_" c ".pem")}' /tmp/raft-rootcas-o1.pem
ls /tmp/ca_*.pem
kubectl exec -n orgdcms "$POD1" -- sh -lc '
cd /var/hyperledger/orderer/tls/tlscacerts &&
awk "
/BEGIN CERTIFICATE/{c++; buf=\"\"}
{buf=buf \$0 ORS}
 /END CERTIFICATE/{
   cmd=\"echo \\\"\" buf \"\\\" | openssl x509 -noout -fingerprint\"
   cmd | getline fp
   close(cmd)
   if (!seen[fp]++) print buf
 }
" raft-rootcas.pem > raft-rootcas.clean.pem &&
mv raft-rootcas.clean.pem raft-rootcas.pem
'
kubectl cp -n orgdcms "$POD1":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-o1.pem
awk '
/BEGIN CERTIFICATE/{c++; buf=""}
{buf=buf $0 ORS}
/END CERTIFICATE/{
  if (!seen[buf]++) print buf
}
' /tmp/raft-rootcas-o1.pem > /tmp/raft-rootcas-o1.clean.pem
awk 'BEGIN{c=0} /BEGIN CERT/{c++} END{print c}' /tmp/raft-rootcas-o1.clean.pem
kubectl cp -n orgdcms /tmp/raft-rootcas-o1.clean.pem "$POD1":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem
POD2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD2":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-o2.pem
awk '
/BEGIN CERTIFICATE/{buf=""}
{buf=buf $0 ORS}
/END CERTIFICATE/{
  if (!seen[buf]++) print buf
}
' /tmp/raft-rootcas-o2.pem > /tmp/raft-rootcas-o2.clean.pem
awk 'BEGIN{c=0} /BEGIN CERT/{c++} END{print c}' /tmp/raft-rootcas-o2.clean.pem
kubectl cp -n orgdcms /tmp/raft-rootcas-o2.clean.pem   "$POD2":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem
POD3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgx "$POD3":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem /tmp/raft-rootcas-o3.pem
awk '
/BEGIN CERTIFICATE/{buf=""}
{buf=buf $0 ORS}
/END CERTIFICATE/{
  if (!seen[buf]++) print buf
}
' /tmp/raft-rootcas-o3.pem > /tmp/raft-rootcas-o3.clean.pem
awk 'BEGIN{c=0} /BEGIN CERT/{c++} END{print c}' /tmp/raft-rootcas-o3.clean.pem
kubectl cp -n orgx /tmp/raft-rootcas-o3.clean.pem   "$POD3":/var/hyperledger/orderer/tls/tlscacerts/raft-rootcas.pem
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer3 -n orgx
kubectl logs -n orgdcms deployment/orderer1 | grep -E "unknown authority|ECDSA|Handshake"
osnadmin channel list  --orderer-address orderer1.orgdcms.svc.cluster.local:7053  --ca-file ~/artifacts/orgdcms/tls-ca.pem  --client-cert ~/artifacts/orgdcms/admin-tls/cert.pem  --client-key  ~/artifacts/orgdcms/admin-tls/key.pem
kubectl logs -n orgdcms deployment/orderer1 | grep -E "leader|follower|elected|became"
kubectl logs -n orgdcms deployment/orderer1 
kubectl logs -n orgdcms deployment/orderer1 | grep -E "Raft|ERROR|panic|fatal"
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/tls-ca/tlscacerts/tls-ca-cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key ~/artifacts/orgx/orderer3/tls/keystore/key.pem
kubectl logs -n orgdcms deployment/orderer1 
kubectl exec -n orgdcms "$POD1" -- sh -lc '
env | grep ORDERER_GENERAL_CLUSTER
'
POD1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
echo "$POD1"
kubectl exec -n orgdcms "$POD1" -- sh -lc '
env | grep ORDERER_GENERAL_CLUSTER
'
POD2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
echo "$POD2"
kubectl exec -n orgdcms "$POD2" -- sh -lc '
env | grep ORDERER_GENERAL_CLUSTER
'
POD3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
echo "$POD3"
kubectl exec -n orgx "$POD3" -- sh -lc '
env | grep ORDERER_GENERAL_CLUSTER
kubectl exec -n orgx "$POD3" -- sh -lc '
env | grep ORDERER_GENERAL_CLUSTER 
kubectl exec -n orgx "$POD3" -- sh -lc '
env | grep ORDERER_GENERAL_CLUSTER
'
kubectl cp -n orgdcms "$POD1":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/o1.pem
kubectl cp -n orgdcms "$POD2":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/o2.pem
kubectl cp -n orgx    "$POD3":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/o3.pem
openssl x509 -in /tmp/o1.pem -noout -subject
openssl x509 -in /tmp/o2.pem -noout -subject
openssl x509 -in /tmp/o3.pem -noout -subject
openssl x509 -in /tmp/o1.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in /tmp/o2.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in /tmp/o3.pem -noout -text | grep -A1 "Subject Alternative Name"
POD1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms "$POD1" -- sh -lc 'nc -vz orderer2.orgdcms.svc.cluster.local 7050'
kubectl exec -n orgdcms "$POD1" -- sh -lc 'nc -vz orderer3.orgx.svc.cluster.local 7050'
kubectl logs -n orgdcms deployment/orderer1 --since=5m
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/tls-ca/tlscacerts/tls-ca-cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl exec -n orgdcms "$POD1" -- sh -lc 'nc -vz orderer3.orgx.svc.cluster.local 7050'
kubectl exec -n orgdcms "$POD1" -- sh -lc 'nc -vz orderer2.orgdcms.svc.cluster.local 7050'
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl get pods -n orgdcms -o wide | grep 10.42.0.
kubectl delete deployment peer0 -n orgdcms
kubectl delete svc peer0 -n orgdcms
kubectl delete pvc -n orgdcms -l app=peer0
kubectl get pods -n orgdcms | grep peer
kubectl exec -n orgdcms "$POD1" -- sh -lc '
grep -R "Cluster" /var/hyperledger/orderer
'
kubectl exec -n orgdcms "$POD1" -- sh -lc '
grep -R "Cluster" /var/hyperledger/orderer
'
kubectl get svc -n orgdcms orderer1 -o yaml
kubectl logs -n orgdcms deployment/orderer1 --since=5m | grep -E "bad certificate|unknown authority|Handshake"
kubectl logs -n orgdcms deployment/orderer1
export FABRIC_CA_CLIENT_HOME=~/tmp/enroll-orderer1-tls
rm -rf "$FABRIC_CA_CLIENT_HOME" && mkdir -p "$FABRIC_CA_CLIENT_HOME"
fabric-ca-client enroll   -u https://ORDERER1_TLS_ID:ORDERER1_TLS_SECRET@fabric-tls-ca.orgdcms.svc.cluster.local:7052   --enrollment.profile tls   --csr.hosts orderer1   --csr.hosts orderer1.orgdcms.svc.cluster.local   --csr.hosts orderer1-hl   --csr.hosts orderer1-hl.orgdcms.svc.cluster.local   --tls.certfiles ~/artifacts/orgdcms/tls-ca/tlscacerts/tls-ca-cert.pem
find ~/artifacts -type f -name "*.pem" | grep -i tls
fabric-ca-client identity list   -u https://fabric-tls-ca.orgdcms.svc.cluster.local:7052   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
fabric-ca-client identity list   -u https://fabric-tls-ca.orgdcms.svc.cluster.local:7052   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=~/tmp/tls-ca-admin
rm -rf "$FABRIC_CA_CLIENT_HOME"
mkdir -p "$FABRIC_CA_CLIENT_HOME"
fabric-ca-client enroll   -u https://tls-ca-admin:tls-ca-adminpw@fabric-tls-ca.orgdcms.svc.cluster.local:7052   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
kubectl get pods -n orgdcms 
fabric-ca-client register   --id.name orderer1-tls   --id.secret orderer1tlsPW   --id.type orderer   -u https://fabric-tls-ca.orgdcms.svc.cluster.local:7052   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
kubectl get svc -n orgdcms fabric-tls-ca
export FABRIC_CA_CLIENT_HOME=~/tmp/tls-ca-admin
rm -rf "$FABRIC_CA_CLIENT_HOME"
mkdir -p "$FABRIC_CA_CLIENT_HOME"
fabric-ca-client enroll   -u https://tls-ca-admin:tls-ca-adminpw@10.43.190.112:7052   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
kubectl exec -n orgdcms -it inspect-orderer1 -- sh
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD" -- sh
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_TLS_CA" -- sh
kubectl get pod -n orgdcms -l app=fabric-tls-ca -o yaml | grep -A5 volumeMounts
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_TLS_CA" -- sh
kubectl cp -n orgdcms $(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}'):/tmp/enroll-orderer1-tls/msp/signcerts/cert.pem /tmp/orderer1-tls-cert.pem
openssl x509 -in /tmp/orderer1-tls-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
POD_CA1=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
POD_O1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
echo "$POD_CA1"; echo "$POD_O1"
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/signcerts/cert.pem /tmp/o1-cert.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/keystore/* /tmp/o1-key.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/tlscacerts/* /tmp/o1-tlsca-orgdcms.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/signcerts/cert.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/signcerts/cert.pem /tmp/o1-cert.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/keystore/* /tmp/o1-key.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/tlscacerts/* /tmp/o1-tlsca-orgdcms.pem
kubectl exec -n orgdcms "$POD_CA1" -- sh -lc 'ls -R /tmp/enroll-orderer1-tls/msp'
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/signcerts/cert.pem /tmp/o1-cert.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/keystore/* /tmp/o1-key.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/tlscacerts/tls-localhost-7052.pem /tmp/o1-tlsca-orgdcms.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/signcerts/cert.pem /tmp/o1-cert.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/keystore/427e8442a04892af1a17c186130754c6b1d09aef289cdce6228aed614adbdd27_sk /tmp/o1-key.pem
kubectl cp -n orgdcms "$POD_CA1":/tmp/enroll-orderer1-tls/msp/tlscacerts/tls-localhost-7052.pem /tmp/o1-tlsca-orgdcms.pem
kubectl cp -n orgdcms /tmp/o1-cert.pem "$POD_O1":/var/hyperledger/orderer/tls/signcerts/cert.pem
kubectl cp -n orgdcms /tmp/o1-key.pem  "$POD_O1":/var/hyperledger/orderer/tls/keystore/key.pem
kubectl cp -n orgdcms /tmp/o1-tlsca-orgdcms.pem "$POD_O1":/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgdcms.pem
kubectl exec -n orgdcms "$POD_O1" -- sh -lc 'cd /var/hyperledger/orderer/tls/tlscacerts && cat tlsca-orgdcms.pem tlsca-orgx.pem > raft-rootcas.pem'
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout status deployment orderer1 -n orgdcms
openssl x509   -in ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   -noout -text
openssl x509   -in ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   -noout -issuer -subject
openssl x509 -in ~/fabric-deploy/orderer2-tls/signcerts/cert.pem -pubkey -noout | openssl sha256
openssl pkey -in ~/fabric-deploy/orderer2-tls/keystore/*_sk -pubout | openssl sha256
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer2-tls/keystore/*_sk
openssl x509 -in ~/fabric-deploy/orderer2-tls/signcerts/cert.pem -noout -issuer -subject
openssl x509 -in ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem -noout -subject
openssl verify -CAfile ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   ~/fabric-deploy/orderer2-tls/signcerts/cert.pem
ls -la ~/fabric-deploy/orderer2-tls/tlscacerts/
openssl x509 -in ~/fabric-deploy/orderer2-tls/signcerts/cert.pem -noout -issuer -subject
openssl x509 -in ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem -noout -subject
fabric-ca-client identity remove orderer2-tls   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_TLS_CA" -- sh
export FABRIC_CA_CLIENT_HOME=~/tmp/enroll-orderer2-tls
rm -rf "$FABRIC_CA_CLIENT_HOME" && mkdir -p "$FABRIC_CA_CLIENT_HOME"
fabric-ca-client enroll   -u https://orderer2-tls:orderer2tlsPW@fabric-tls-ca.orgdcms.svc.cluster.local:7052   --enrollment.profile tls   --csr.hosts orderer2   --csr.hosts orderer2.orgdcms.svc.cluster.local   --csr.hosts orderer2-hl   --csr.hosts orderer2-hl.orgdcms.svc.cluster.local   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_TLS_CA" -- sh
kubectl cp /tmp/enroll-orderer2-tls/msp/signcerts/cert.pem   -n orgdcms inspect-orderer2:/mnt/tls/signcerts/cert.pem
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-orderer2-tls/msp/signcerts/cert.pem /tmp/orderer2-cert.pem
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-orderer2-tls/msp/keystore /tmp/orderer2-keystore
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-orderer2-tls/msp/tlscacerts /tmp/orderer2-tlscacerts
kubectl cp /tmp/orderer2-cert.pem   -n orgdcms inspect-orderer2:/mnt/tls/signcerts/cert.pem
kubectl cp /tmp/orderer2-keystore/*   -n orgdcms inspect-orderer2:/mnt/tls/keystore/key.pem
kubectl cp /tmp/orderer2-tlscacerts/*   -n orgdcms inspect-orderer2:/mnt/tls/tlscacerts/tlsca-orgdcms.pem
POD_ORDERER2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-orderer2-tls/msp/signcerts/cert.pem /tmp/orderer2-cert.pem
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-orderer2-tls/msp/keystore /tmp/orderer2-keystore
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-orderer2-tls/msp/tlscacerts /tmp/orderer2-tlscacerts
kubectl cp /tmp/orderer2-cert.pem   -n orgdcms "$POD_ORDERER2":/var/hyperledger/orderer/tls/signcerts/cert.pem
kubectl cp /tmp/orderer2-keystore/*   -n orgdcms "$POD_ORDERER2":/var/hyperledger/orderer/tls/keystore/key.pem
kubectl cp /tmp/orderer2-tlscacerts/*   -n orgdcms "$POD_ORDERER2":/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgdcms.pem
kubectl exec -n orgdcms "$POD_ORDERER2" -- sh -lc 'cd /var/hyperledger/orderer/tls/tlscacerts && cat tlsca-orgdcms.pem tlsca-orgx.pem > raft-rootcas.pem'
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout status deployment orderer2 -n orgdcms
kubectl cp -n orgdcms "$POD_ORDERER2":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer2-cert.pem
POD_ORDERER2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD_ORDERER2":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer2-cert.pem
openssl x509 -in /tmp/orderer2-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
POD_TLS_CA=$(kubectl get pod -n orgx -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx -it "$POD_TLS_CA" -- sh
POD_TLS_CA=$(kubectl get pod -n orgx -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
POD_ORDERER3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgx "$POD_TLS_CA":/tmp/enroll-orderer3-tls/msp/signcerts/cert.pem   /tmp/orderer3-cert.pem
kubectl cp -n orgx "$POD_TLS_CA":/tmp/enroll-orderer3-tls/msp/keystore   /tmp/orderer3-keystore
kubectl cp -n orgx "$POD_TLS_CA":/tmp/enroll-orderer3-tls/msp/tlscacerts   /tmp/orderer3-tlscacerts
kubectl cp /tmp/orderer3-cert.pem   -n orgx "$POD_ORDERER3":/var/hyperledger/orderer/tls/signcerts/cert.pem
kubectl cp /tmp/orderer3-keystore/*   -n orgx "$POD_ORDERER3":/var/hyperledger/orderer/tls/keystore/key.pem
kubectl cp /tmp/orderer3-tlscacerts/*   -n orgx "$POD_ORDERER3":/var/hyperledger/orderer/tls/tlscacerts/tlsca-orgx.pem
kubectl exec -n orgx "$POD_ORDERER3" -- sh -lc 'cd /var/hyperledger/orderer/tls/tlscacerts && cat tlsca-orgx.pem tlsca-orgdcms.pem > raft-rootcas.pem'
kubectl rollout restart deployment orderer3 -n orgx
kubectl rollout status deployment orderer3 -n orgx
POD_ORDERER3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgx "$POD_ORDERER3":/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer3-cert.pem
openssl x509 -in /tmp/orderer3-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl logs -n orgdcms deployment/orderer1
OD=$(kubectl get pod -n <namespace> -l app=<ordererX> -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n <namespace> -it "$POD" -- sh
POD=$(kubectl get pod -n <namespace> -l app=<ordererX> -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n <namespace> -it "$POD" -- sh
kubectl exec -n orgdcms -it "$POD" -- sh
POD_ORDERER1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_ORDERER1" -- sh
POD_ORDERER1=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
POD_ORDERER2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_ORDERER2" -- sh
POD_ORDERER3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx -it "$POD_ORDERER3" -- sh
kubectl get svc -n orgdcms orderer1 orderer2
kubectl get svc -n orgx orderer3
kubectl get endpoints -n orgdcms orderer1 orderer2
kubectl get endpoints -n orgx orderer3
kubectl get svc -n orgdcms orderer1-hl orderer2-hl
kubectl get svc -n orgx orderer3-hl
kubectl run -n orgdcms nettest --rm -it --image=busybox -- sh
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer3 -n orgx
kubectl logs -n orgdcms deploy/orderer1 | grep -i raft
kubectl logs -n orgdcms deploy/orderer2 | grep -i raft
kubectl logs -n orgx deploy/orderer3 | grep -i raft
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl scale deployment orderer3 -n orgx --replicas=0
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD" -- sh
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl scale deployment orderer3 -n orgx --replicas=1
POD=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD" -- sh -c 'rm -rf /var/hyperledger/production/orderer/etcdraft/*'
POD=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD" -- sh -c 'rm -rf /var/hyperledger/production/orderer/etcdraft/*'
POD=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx -it "$POD" -- sh -c 'rm -rf /var/hyperledger/production/orderer/etcdraft/*'
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs -n orgdcms deploy/orderer1 | grep -i raft
kubectl logs -n orgdcms deploy/orderer2 | grep -i raft
kubectl logs -n orgx deploy/orderer3 | grep -i raft
kubectl cp -n orgdcms deploy/orderer1:/var/hyperledger/orderer/tls/signcerts/cert.pem   ~/artifacts/channel-artifacts/orderer1-tls.pem
kubectl cp -n orgdcms deploy/orderer2:/var/hyperledger/orderer/tls/signcerts/cert.pem   ~/artifacts/channel-artifacts/orderer2-tls.pem
kubectl cp -n orgx deploy/orderer3:/var/hyperledger/orderer/tls/signcerts/cert.pem   ~/artifacts/channel-artifacts/orderer3-tls.pem
kubectl cp -n orgdcms deploy/orderer1:/var/hyperledger/orderer/tls/signcerts/cert.pem   ~/artifacts/channel-artifacts/orderer1-tls.pem
POD_ORDERER1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD_ORDERER1":/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/channel-artifacts/orderer1-tls.pem
POD_ORDERER2=$(kubectl get pod -n orgdcms -l app=orderer2 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgdcms "$POD_ORDERER2":/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/channel-artifacts/orderer2-tls.pem
POD_ORDERER3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl cp -n orgx "$POD_ORDERER3":/var/hyperledger/orderer/tls/signcerts/cert.pem ~/artifacts/channel-artifacts/orderer3-tls.pem
ls -l ~/artifacts/channel-artifacts/orderer*-tls.pem
grep -n "Profiles:" -n configtx.yaml
grep -n "^  [A-Za-z]" configtx.yaml | grep -A1 Profiles
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
export FABRIC_CFG_PATH=~/artifacts/config
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
export FABRIC_CFG_PATH=~/artifacts/config
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
ls $FABRIC_CFG_PATH/configtx.yaml
export FABRIC_CFG_PATH=~/artifacts
ls $FABRIC_CFG_PATH/configtx.yaml
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053

kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl apply -f k8s/orgdcms/orderer/orderer1-headless.yaml
kubectl apply -f k8s/orgdcms/orderer/orderer2-headless.yaml
kubectl apply -f k8s/orgx/orderer/orderer3-headless.yaml
POD1=$(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms "$POD1" -- sh -lc 'nslookup orderer2-hl.orgdcms.svc.cluster.local'
kubectl exec -n orgdcms "$POD1" -- sh -lc 'nslookup orderer3-hl.orgx.svc.cluster.local'
osnadmin channel fetch config /tmp/canale1-config.block   --channelID canale1   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
export FABRIC_CFG_PATH=~/artifacts
configtxgen -profile Canale1   -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
kubectl get pvc -n orgdcms
kubectl get pvc -n orgx
kubectl delete pvc -n orgdcms orderer1-ledger-pvc
kubectl delete pvc -n orgdcms orderer2-ledger-pvc
kubectl delete pvc -n orgx   orderer3-ledger-pvc
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer3 -n orgx
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl get pod -n orgdcms 
kubectl describe pod -n orgdcms orderer1-7d57dc77cd-swvnz
kubectl apply -f k8s/orgdcms/orderer/orderer1-ledger-pvc.yaml
kubectl apply -f k8s/orgdcms/orderer/orderer2-ledger-pvc.yaml
kubectl apply -f k8s/orgx/orderer/orderer3-ledger-pvc.yaml
cat > /tmp/orderer1-ledger-pvc.yaml <<'YAML'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: orderer1-ledger-pvc
  namespace: orgdcms
spec:
  accessModes: [ "ReadWriteOnce" ]
  storageClassName: local-path
  resources:
    requests:
      storage: 5Gi
YAML

cat > /tmp/orderer2-ledger-pvc.yaml <<'YAML'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: orderer2-ledger-pvc
  namespace: orgdcms
spec:
  accessModes: [ "ReadWriteOnce" ]
  storageClassName: local-path
  resources:
    requests:
      storage: 5Gi
YAML

kubectl apply -f /tmp/orderer1-ledger-pvc.yaml
kubectl apply -f /tmp/orderer2-ledger-pvc.yaml
kubectl get pvc -n orgdcms orderer1-ledger-pvc
kubectl get pvc -n orgdcms orderer2-ledger-pvc
kubectl get pvc -n orgdcms orderer1-ledger-pvc
kubectl delete pod -n orgdcms orderer1-65cd9f9b5d-h9f4j
kubectl delete pod -n orgdcms orderer2-6db9b6c857-jc7bf
kubectl get pod -n orgx
kubectl delete pod -n orgx   orderer3-784c66fc69-jx655
kubectl get pvc -n orgdcms
kubectl get pvc -n orgx
kubectl get pvc -n orgdcms
kubectl get pod -n orgx
kubectl get pvc -n orgdcms
kubectl get pod -n orgdcms
kubectl apply -f /tmp/orderer1-ledger-pvc.yaml
kubectl apply -f /tmp/orderer2-ledger-pvc.yaml
kubectl apply -f /tmp/orderer3-ledger-pvc.yaml
kubectl get pvc -n orgdcms orderer1-ledger-pvc
kubectl patch pvc orderer1-ledger-pvc -n orgdcms -p '{"metadata":{"finalizers":null}}'
kubectl delete pvc -n orgdcms orderer1-ledger-pvc
cat > /tmp/orderer3-ledger-pvc.yaml <<'YAML'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: orderer3-ledger-pvc
  namespace: orgx
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: local-path
  resources:
    requests:
      storage: 5Gi
YAML

kubectl apply -f /tmp/orderer3-ledger-pvc.yaml
kubectl get pvc -n orgdcms
kubectl get pvc -n orgx
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms orderer1-ledger-pvc
kubectl apply -f /tmp/orderer1-ledger-pvc.yaml
kubectl get pvc -n orgdcms orderer1-ledger-pvc
kubectl get pods -n orgdcms | grep orderer1
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl get pvc -n orgx
kubectl patch pvc orderer3-ledger-pvc -n orgx -p '{"metadata":{"finalizers":null}}'
kubectl delete pvc orderer3-ledger-pvc -n orgx
kubectl get pvc -n orgx | grep orderer3-ledger
kubectl apply -f /tmp/orderer3-ledger-pvc.yaml
kubectl get pvc -n orgx orderer3-ledger-pvc
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer2/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer2/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/orgx/orderer3/tls/cert.pem   --client-cert ~/artifacts/orgx/orderer3/tls/cert.pem   --client-key ~/artifacts/orgx/orderer3/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
kubectl get pods -n orgx
kubectl get pods -n orgdcms
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-cert ~/artifacts/orgdcms/orderer1/tls/cert.pem   --client-key ~/artifacts/orgdcms/orderer1/tls/keystore/key.pem
ls ~/fabric-deploy/orderer1-tls/keystore
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
POD_TLS_CA=$(kubectl get pod -n orgdcms -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgdcms -it "$POD_TLS_CA" -- sh
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-osnadmin-tls/msp/signcerts/cert.pem   ~/osnadmin-tls-cert.pem
kubectl cp -n orgdcms "$POD_TLS_CA":/tmp/enroll-osnadmin-tls/msp/keystore   ~/osnadmin-tls-keystore
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
snadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address localhost:7053   --tls-server-name orderer3.orgx.svc.cluster.local   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
POD_TLS_CA=$(kubectl get pod -n orgx -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx -it "$POD_TLS_CA" -- sh
POD_ORDERER3=$(kubectl get pod -n orgx -l app=orderer3 -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx -it "$POD_ORDERER3" -- sh
osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
sudo nano /etc/hosts
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
POD_TLS_CA=$(kubectl get pod -n orgx -l app=fabric-tls-ca -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx -it "$POD_TLS_CA" -- sh
kubectl cp -n orgx "$POD_TLS_CA":/tmp/enroll-osnadmin-tls/msp/signcerts/cert.pem   ~/osnadmin-orgx-cert.pem
kubectl cp -n orgx "$POD_TLS_CA":/tmp/enroll-osnadmin-tls/msp/keystore   ~/osnadmin-orgx-keystore
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-orgx-cert.pem   --client-key  ~/osnadmin-orgx-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block /path/to/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-orgx-cert.pem   --client-key  ~/osnadmin-orgx-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-orgx-cert.pem   --client-key  ~/osnadmin-orgx-keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-orgx-cert.pem   --client-key  ~/osnadmin-orgx-keystore/*_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-orgx-cert.pem   --client-key  ~/osnadmin-orgx-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgx/tls-ca-cert.pem   --client-cert ~/osnadmin-orgx-cert.pem   --client-key  ~/osnadmin-orgx-keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
kubectl logs -n orgdcms deploy/orderer1 | grep -i raft
export FABRIC_CFG_PATH=~/artifacts/config
configtxgen -profile Canale1 -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl rollout restart deployment orderer3 -n orgx
kubectl logs -n orgdcms deploy/orderer1 | grep -i raft
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel join   --channelID canale1   --config-block ~/artifacts/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
export FABRIC_CFG_PATH=~/artifacts/config
configtxgen -profile Canale1 -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
export FABRIC_CFG_PATH=~/artifacts/config
configtxgen -profile Canale1 -channelID canale1   -outputBlock ~/artifacts/channel-artifacts/canale1.block
kubectl get pods -n orgx
export FABRIC_CFG_PATH=~/artifacts/config
configtxgen -profile Canale1   -channelID canale2   -outputBlock ~/artifacts/channel-artifacts/canale2.block
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
osnadmin channel join   --channelID canale2   --config-block ~/artifacts/channel-artifacts/canale2.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/artifacts/ca/orgdcms/tls-ca-cert.pem   --client-cert ~/osnadmin-tls-cert.pem   --client-key  ~/osnadmin-tls-keystore/*_sk
tree artifacts -L 4
rm -rf artifacts/channel-artifacts
rm -rf artifacts/orgdcms/orderer1 artifacts/orgdcms/orderer2
rm -rf artifacts/orgx/orderer3
rm -rf artifacts/tls
tree artifacts -L 3
rmdir artifacts/orgdcms artifacts/orgx 2>/dev/null
tree artifacts -L 3
kubectl get pods -n orgdcms | grep tls
kubectl exec -n orgdcms fabric-tls-ca-5dd9f75d8d-m8ggc --   cat /etc/hyperledger/fabric-ca-server/tls-cert.pem | openssl x509 -noout -fingerprint -sha256
openssl x509 -in artifacts/ca/orgdcms/tls-ca-cert.pem -noout -fingerprint -sha256
kubectl exec -n orgdcms fabric-tls-ca-5dd9f75d8d-m8ggc --   cat /etc/hyperledger/fabric-ca-server/tls-cert.pem > artifacts/ca/orgdcms/tls-ca-cert.pem
openssl x509 -in artifacts/ca/orgdcms/tls-ca-cert.pem -noout -fingerprint -sha256
kubectl exec -n orgdcms fabric-tls-ca-5dd9f75d8d-m8ggc --   cat /etc/hyperledger/fabric-ca-server/tls-cert.pem | openssl x509 -noout -fingerprint -sha256
openssl x509 -in artifacts/ca/orgdcms/tls-ca-cert.pem -noout -fingerprint -sha256
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl scale deploy orderer1 -n orgdcms --replicas=0
kubectl scale deploy orderer2 -n orgdcms --replicas=0
kubectl scale deploy orderer3 -n orgx   --replicas=0
kubectl run wipe-orderer1-tls -n orgdcms --image=busybox --restart=Never --rm -it -- sh
kubectl run wipe-orderer1-tls -n orgdcms   --image=busybox --restart=Never --rm -it   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "<PVC_TLS_ORDERER1>"
      }
    }]
  }
}'
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
kubectl run wipe-orderer1-tls -n orgdcms   --image=busybox --restart=Never --rm -it   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "orderer1-tls-pvc"
      }
    }]
  }
}'
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl scale deploy orderer1 -n orgdcms --replicas=0
kubectl get pods -n orgdcms | grep orderer1
kubectl delete pod wipe-orderer1-tls -n orgdcms
kubectl run wipe-orderer1-tls -n orgdcms   --image=busybox --restart=Never --rm -it   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "orderer1-tls-pvc"
      }
    }]
  }
}'
kubectl scale deploy orderer1 -n orgdcms --replicas=0
kubectl run wipe-orderer1-tls -n orgdcms   --image=busybox --restart=Never --rm -it   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sh"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "orderer1-tls-pvc"
      }
    }]
  }
}'
kubectl run wipe-orderer1-tls -n orgdcms   --image=busybox --restart=Never   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sleep","3600"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "orderer1-tls-pvc"
      }
    }]
  }
}'
kubectl exec -n orgdcms -it wipe-orderer1-tls -- sh
kubectl get pods -n orgdcms | grep orderer1
kubectl delete pod wipe-orderer1-tls -n orgdcms
kubectl run wipe-orderer2-tls -n orgdcms   --image=busybox --restart=Never   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sleep","3600"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "orderer2-tls-pvc"
      }
    }]
  }
}'
kubectl exec -n orgdcms -it wipe-orderer2-tls -- sh
kubectl delete pod wipe-orderer2-tls -n orgdcms
kubectl scale deploy orderer3 -n orgx --replicas=0
kubectl run wipe-orderer3-tls -n orgx   --image=busybox --restart=Never   --overrides='
{
  "spec": {
    "containers": [{
      "name": "wipe",
      "image": "busybox",
      "command": ["sleep","3600"],
      "volumeMounts": [{
        "mountPath": "/tls",
        "name": "tls"
      }]
    }],
    "volumes": [{
      "name": "tls",
      "persistentVolumeClaim": {
        "claimName": "orderer3-tls-pvc"
      }
    }]
  }
}'
kubectl get pod wipe-orderer3-tls -n orgx
kubectl exec -n orgx -it wipe-orderer3-tls -- sh
kubectl delete pod wipe-orderer3-tls -n orgx
kubectl run enroll-orderer1-tls -n orgdcms   --image=hyperledger/fabric-ca:1.5   --restart=Never -it --rm -- sh
kubectl create configmap orgdcms-tls-ca-cert -n orgdcms   --from-file=tls-ca-cert.pem=artifacts/ca/orgdcms/tls-ca-cert.pem
kubectl run enroll-orderer1-tls -n orgdcms   --image=hyperledger/fabric-ca:1.5   --restart=Never -it --rm   --overrides='
{
  "spec": {
    "containers": [{
      "name": "enroll",
      "image": "hyperledger/fabric-ca:1.5",
      "command": ["sh"],
      "volumeMounts": [{
        "mountPath": "/tls-ca",
        "name": "tls-ca"
      }]
    }],
    "volumes": [{
      "name": "tls-ca",
      "configMap": {
        "name": "orgdcms-tls-ca-cert"
      }
    }]
  }
}'
kubectl get configmap orgdcms-tls-ca-cert -n orgdcms
kubectl run enroll-orderer1-tls -n orgdcms   --image=hyperledger/fabric-ca:1.5   --restart=Never   --overrides='
{
  "spec": {
    "containers": [{
      "name": "enroll",
      "image": "hyperledger/fabric-ca:1.5",
      "command": ["sleep","3600"],
      "volumeMounts": [{
        "mountPath": "/tls-ca",
        "name": "tls-ca"
      }]
    }],
    "volumes": [{
      "name": "tls-ca",
      "configMap": {
        "name": "orgdcms-tls-ca-cert"
      }
    }]
  }
}'
kubectl exec -n orgdcms -it enroll-orderer1-tls -- sh
kubectl get svc -n orgdcms
kubectl exec -n orgdcms -it enroll-orderer1-tls -- sh
kubectl exec -n orgdcms fabric-tls-ca-5dd9f75d8d-m8ggc --   openssl x509 -in /etc/hyperledger/fabric-ca-server/tls-cert.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl cp -n orgdcms fabric-tls-ca-5dd9f75d8d-m8ggc:/etc/hyperledger/fabric-ca-server/tls-cert.pem /tmp/fabric-tls-ca.pem
openssl x509 -in /tmp/fabric-tls-ca.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl delete deploy fabric-tls-ca -n orgdcms
kubectl delete pvc fabric-tls-ca-pvc -n orgdcms
kubectl delete deploy fabric-tls-ca -n orgdcms
kubectl delete pvc fabric-tls-ca-pvc -n orgdcms
kubectl apply -f artifacts/ca/orgdcms/tls-ca-deployment.yaml
kubectl apply -f artifacts/ca/orgdcms/tls-ca-service.yaml
kubectl cp -n orgdcms fabric-tls-ca-*/etc/hyperledger/fabric-ca-server/tls-cert.pem /tmp/tls-ca.pem
openssl x509 -in /tmp/tls-ca.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl get pods -n orgdcms | grep fabric-tls-ca
kubectl get pvc -n orgdcms | grep fabric-tls-ca
kubectl apply -f artifacts/ca/orgdcms/fabric-tls-ca-pvc.yaml
kubectl get pods -n orgdcms | grep fabric-tls-ca
kubectl cp -n orgdcms fabric-tls-ca-*/etc/hyperledger/fabric-ca-server/tls-cert.pem /tmp/tls-ca.pem
openssl x509 -in /tmp/tls-ca.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl get pods -n orgdcms | grep fabric-tls-ca
kubectl cp -n orgdcms fabric-tls-ca-549d8f957-q9x92:/etc/hyperledger/fabric-ca-server/tls-cert.pem /tmp/tls-ca.pem
openssl x509 -in /tmp/tls-ca.pem -noout -text | grep -A1 "Subject Alternative Name"
