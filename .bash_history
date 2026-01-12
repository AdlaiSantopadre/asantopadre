cd fabric-samples
cd ..
./scripts/bootstrap.sh
dir
./scripts/bootstrap.sh
./install-fabric.sh
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.5.9 1.5.13
cd test-network
./network.sh up createChannel -ca
sudo apt install -y jq
./network.sh up createChannel -ca
./network.sh down -v
./network.sh down 
docker system prune -af --volumes
./network.sh up createChannel -ca
sudo systemctl status ssh
ip a
~ip -4 addr show enp1s0
ifconfig enp1s0
/sbin/ip -4 addr show enp1s0
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
SHUTDOWN
shutdown
sudo nano /etc/netplan/01-static.yaml
sudo nano netplan apply
sudo netplan apply
sudo chmod 600 /etc/netplan/01-static.yaml
sudo nano /etc/netplan/01-static.yaml
sudo netplan apply
sudo nano /etc/netplan/01-static.yaml
sudo netplan apply
sudo nano /etc/netplan/01-static.yaml
sudo netplan apply
sudo nano /etc/netplan/01-static.yaml
sudo netplan apply
/sbin/ip -4 addr show enp1s0
sudo systemctl restart systemd-networkd
/sbin/ip -4 addr show enp1s0
sudo nano /etc/netplan/01-static.yaml
sudo netplan apply
/sbin/ip -4 addr show enp1s0
sudo systemctl restart systemd-networkd
/sbin/ip -4 addr show enp1s0
logout
apt list --upgradable
/sbin/ip -4 addr show enp1s0
kubectl create ns orderer
sudo kubectl create ns orderer
sudo kubectl create ns orgdcms
sudo kubectl create ns orgx
sudo kubectl create ns fabric-tools
sudo kubectl get ns
cd ~/fabric-samples/test-network
./network.sh down
./network.sh down || true
docker system prune -af --volumes
docker ps -a
docker volume ls
docker system prune -af --volumes
docker volume ls
docker volume rm compose_orderer.example.com compose_peer0.org1.example.com compose_peer0.org2.example.com
docker volume ls
docker ps -a
sudo kubectl get pods -A | grep fabric
sudo kubectl get svc -A | grep fabric
cd..
cd ..
sudo kubectl get svc -A | grep fabric
sudo kubectl get pods -A | grep fabric
ls ~/fabric-samples
cd ..
sudo kubectl -n orgdcms create secret generic ca-admin --from-literal=CA_ADMIN=admin --from-literal=CA_PASS=adminpw
sudo kubectl -n orgx    create secret generic ca-admin --from-literal=CA_ADMIN=admin --from-literal=CA_PASS=adminpw
cat <<'YAML' | sudo kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata: { name: fabric-ca-pvc, namespace: orgdcms }
spec:
  accessModes: ["ReadWriteOnce"]
  resources: { requests: { storage: 2Gi } }
---
apiVersion: apps/v1
kind: Deployment
metadata: { name: fabric-ca, namespace: orgdcms }
spec:
  replicas: 1
  selector: { matchLabels: { app: fabric-ca } }
  template:
    metadata: { labels: { app: fabric-ca } }
    spec:
      containers:
        - name: ca
          image: hyperledger/fabric-ca:1.5.13
          env:
            - { name: FABRIC_CA_HOME, value: /etc/hyperledger/fabric-ca-server }
            - { name: FABRIC_CA_SERVER_CA_NAME, value: ca-orgdcms }
            - { name: FABRIC_CA_SERVER_TLS_ENABLED, value: "true" }
            - name: FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS
              valueFrom: { secretKeyRef: { name: ca-admin, key: CA_ADMIN } }
            - name: CA_PASS
              valueFrom: { secretKeyRef: { name: ca-admin, key: CA_PASS } }
          command: ["/bin/sh","-lc"]
          args:
            - >
              export FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS="${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}:${CA_PASS}";
              fabric-ca-server start -b "${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}" -p 7054
          ports: [{ containerPort: 7054 }]
          volumeMounts: [{ name: data, mountPath: /etc/hyperledger/fabric-ca-server }]
      volumes: [{ name: data, persistentVolumeClaim: { claimName: fabric-ca-pvc } }]
---
apiVersion: v1
kind: Service
metadata: { name: fabric-ca, namespace: orgdcms }
spec:
  selector: { app: fabric-ca }
  ports: [{ name: https, port: 7054, targetPort: 7054 }]
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata: { name: fabric-ca-pvc, namespace: orgx }
spec:
  accessModes: ["ReadWriteOnce"]
  resources: { requests: { storage: 2Gi } }
---
apiVersion: apps/v1
kind: Deployment
metadata: { name: fabric-ca, namespace: orgx }
spec:
  replicas: 1
  selector: { matchLabels: { app: fabric-ca } }
  template:
    metadata: { labels: { app: fabric-ca } }
    spec:
      containers:
        - name: ca
          image: hyperledger/fabric-ca:1.5.13
          env:
            - { name: FABRIC_CA_HOME, value: /etc/hyperledger/fabric-ca-server }
            - { name: FABRIC_CA_SERVER_CA_NAME, value: ca-orgx }
            - { name: FABRIC_CA_SERVER_TLS_ENABLED, value: "true" }
            - name: FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS
              valueFrom: { secretKeyRef: { name: ca-admin, key: CA_ADMIN } }
            - name: CA_PASS
              valueFrom: { secretKeyRef: { name: ca-admin, key: CA_PASS } }
          command: ["/bin/sh","-lc"]
          args:
            - >
              export FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS="${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}:${CA_PASS}";
              fabric-ca-server start -b "${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}" -p 7054
          ports: [{ containerPort: 7054 }]
          volumeMounts: [{ name: data, mountPath: /etc/hyperledger/fabric-ca-server }]
      volumes: [{ name: data, persistentVolumeClaim: { claimName: fabric-ca-pvc } }]
---
apiVersion: v1
kind: Service
metadata: { name: fabric-ca, namespace: orgx }
spec:
  selector: { app: fabric-ca }
  ports: [{ name: https, port: 7054, targetPort: 7054 }]
YAML

sudo kubectl -n orgdcms get pods,svc
sudo kubectl -n orgx get pods,svc
sudo kubectl get sc
sudo kubectl -n orgdcms describe pod fabric-ca-6cddb5d85c-jnq8q
sudo kubectl -n orgdcms get pods
sudo kubectl -n orgdcms describe pod fabric-ca-5969cf9964-tzs82
sudo kubectl -n orgdcms edit deployment fabric-ca
sudo kubectl -n orgdcms edit deployment fabric-casudo kubectl -n orgdcms get deployment fabric-ca -o yaml | nano
export EDITOR=nano
sudo kubectl -n orgdcms edit deployment fabric-ca

sudo kubectl -n orgdcms patch deployment fabric-ca --type='json' -p='[
  {"op":"add","path":"/spec/template/spec/tolerations","value":[
    {"key":"node-role.kubernetes.io/control-plane","operator":"Exists","effect":"NoSchedule"}
  ]}
]'
sudo kubectl -n orgdcms get pods
sudo kubectl taint nodes --all node-role.kubernetes.io/control-plane-
sudo kubectl describe node beelink-fabric | grep -i taint
sudo kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints
sudo kubectl patch deployment fabric-ca -n orgdcms --type='merge' -p '{
  "spec": {
    "template": {
      "spec": {
        "nodeSelector": {
          "kubernetes.io/hostname": "beelink-fabric"
        }
      }
    }
  }
}'
sudo kubectl -n orgdcms get pods
sudo kubectl -n orgdcms delete deployment fabric-ca
sudo kubectl -n orgdcms delete pvc fabric-ca-pvc
cat <<'YAML' | sudo kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-ca
  namespace: orgdcms
spec:
  replicas: 1
  selector:
    matchLabels:
      app: fabric-ca
  template:
    metadata:
      labels:
        app: fabric-ca
    spec:
      containers:
        - name: ca
          image: hyperledger/fabric-ca:1.5.13
          env:
            - name: FABRIC_CA_HOME
              value: /etc/hyperledger/fabric-ca-server
            - name: FABRIC_CA_SERVER_CA_NAME
              value: ca-orgdcms
            - name: FABRIC_CA_SERVER_TLS_ENABLED
              value: "true"
            - name: FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS
              valueFrom:
                secretKeyRef:
                  name: ca-admin
                  key: CA_ADMIN
            - name: CA_PASS
              valueFrom:
                secretKeyRef:
                  name: ca-admin
                  key: CA_PASS
          command: ["/bin/sh","-lc"]
          args:
            - >
              export FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS="${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}:${CA_PASS}";
              fabric-ca-server start -b "${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}" -p 7054
          ports:
            - containerPort: 7054
---
apiVersion: v1
kind: Service
metadata:
  name: fabric-ca
  namespace: orgdcms
spec:
  selector:
    app: fabric-ca
  ports:
    - port: 7054
      targetPort: 7054
YAML

sudo kubectl -n orgdcms get pods
cat <<'YAML' | sudo kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-ca
  namespace: orgx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: fabric-ca
  template:
    metadata:
      labels:
        app: fabric-ca
    spec:
      containers:
        - name: ca
          image: hyperledger/fabric-ca:1.5.13
          env:
            - name: FABRIC_CA_HOME
              value: /etc/hyperledger/fabric-ca-server
            - name: FABRIC_CA_SERVER_CA_NAME
              value: ca-orgx
            - name: FABRIC_CA_SERVER_TLS_ENABLED
              value: "true"
            - name: FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS
              valueFrom:
                secretKeyRef:
                  name: ca-admin
                  key: CA_ADMIN
            - name: CA_PASS
              valueFrom:
                secretKeyRef:
                  name: ca-admin
                  key: CA_PASS
          command: ["/bin/sh","-lc"]
          args:
            - >
              export FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS="${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}:${CA_PASS}";
              fabric-ca-server start -b "${FABRIC_CA_SERVER_BOOTSTRAP_USER_PASS}" -p 7054
          ports:
            - containerPort: 7054
---
apiVersion: v1
kind: Service
metadata:
  name: fabric-ca
  namespace: orgx
spec:
  selector:
    app: fabric-ca
  ports:
    - port: 7054
      targetPort: 7054
YAML

sudo kubectl -n orgx get pods
sudo kubectl -n fabric-tools run fabric-tools --image=hyperledger/fabric-tools:2.5 --restart=Never -- sleep infinity
sudo kubectl -n fabric-tools get pods
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
sudo kubectl -n fabric-tools run ca-client   --image=hyperledger/fabric-ca:1.5.13   --restart=Never -- sleep infinity
sudo kubectl -n fabric-tools get pods
sudo kubectl -n fabric-tools exec -it ca-client -- bash
sudo kubectl -n orgdcms get svc fabric-ca
sudo kubectl -n fabric-tools exec -it ca-client -- bash
sudo kubectl -n orgdcms get svc fabric-ca
sudo kubectl -n fabric-tools exec -it ca-client -- bash
sudo kubectl -n orgdcms edit deployment fabric-ca
sudo kubectl -n orgdcms get pods
sudo kubectl -n fabric-tools exec -it ca-client -- bash
export FABRIC_CA_CLIENT_HOME=/work/orgdcms
fabric-ca-client register --id.name orderer1 --id.secret orderer1pw --id.type orderer -u http://10.43.76.126:7054
fabric-ca-client enroll -u http://orderer1:orderer1pw@10.43.76.126:7054 -M /work/orgdcms/orderers/orderer1/msp
ls /work/orgdcms/orderers/orderer1/msp/signcerts
export FABRIC_CA_CLIENT_HOME=/work/orgdcms
fabric-ca-client register --id.name orderer1 --id.secret orderer1pw --id.type orderer -u http://10.43.76.126:7054
sudo kubectl -n fabric-tools exec -it ca-client -- bash
sudo kubectl -n orgx get svc fabric-ca
sudo kubectl -n fabric-tools exec -it ca-client -- bash
sudo kubectl -n orgx edit deployment fabric-ca
sudo kubectl -n fabric-tools exec -it ca-client -- bash
mkdir -p ~/fabric-deploy/orderer
cd ~/fabric-deploy/orderer
cat <<'YAML' > orderer0-orgdcms.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: orderer0-orgdcms
  namespace: orderer
spec:
  replicas: 1
  selector:
    matchLabels:
      app: orderer0-orgdcms
  template:
    metadata:
      labels:
        app: orderer0-orgdcms
    spec:
      containers:
        - name: orderer
          image: hyperledger/fabric-orderer:2.5
          env:
            - name: ORDERER_GENERAL_LISTENADDRESS
              value: "0.0.0.0"
            - name: ORDERER_GENERAL_LISTENPORT
              value: "7050"
            - name: ORDERER_GENERAL_LOCALMSPID
              value: "OrdererOrgDCMS"
            - name: ORDERER_GENERAL_LOCALMSPDIR
              value: /var/hyperledger/orderer/msp
            - name: ORDERER_GENERAL_TLS_ENABLED
              value: "true"
            - name: ORDERER_GENERAL_TLS_PRIVATEKEY
              value: /var/hyperledger/orderer/tls/keystore
            - name: ORDERER_GENERAL_TLS_CERTIFICATE
              value: /var/hyperledger/orderer/tls/signcerts
            - name: ORDERER_GENERAL_TLS_ROOTCAS
              value: /var/hyperledger/orderer/tls/tlscacerts
            - name: ORDERER_GENERAL_CLUSTER_CLIENTCERTIFICATE
              value: /var/hyperledger/orderer/tls/signcerts
            - name: ORDERER_GENERAL_CLUSTER_CLIENTPRIVATEKEY
              value: /var/hyperledger/orderer/tls/keystore
            - name: ORDERER_GENERAL_CLUSTER_ROOTCAS
              value: /var/hyperledger/orderer/tls/tlscacerts
          volumeMounts:
            - name: msp
              mountPath: /var/hyperledger/orderer/msp
            - name: tls
              mountPath: /var/hyperledger/orderer/tls
      volumes:
        - name: msp
          hostPath:
            path: /work/orgdcms/orderers/orderer0/msp
        - name: tls
          hostPath:
            path: /work/orgdcms/orderers/orderer0/tls
YAML

cat <<'YAML' > orderer0-orgdcms-svc.yaml
apiVersion: v1
kind: Service
metadata:
  name: orderer0-orgdcms
  namespace: orderer
spec:
  selector:
    app: orderer0-orgdcms
  ports:
    - port: 7050
      targetPort: 7050
YAML

ls -l ~/fabric-deploy/orderer
cat <<'YAML' > ~/fabric-deploy/orderer/orderer1-orgdcms.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: orderer1-orgdcms
  namespace: orderer
spec:
  replicas: 1
  selector:
    matchLabels:
      app: orderer1-orgdcms
  template:
    metadata:
      labels:
        app: orderer1-orgdcms
    spec:
      containers:
        - name: orderer
          image: hyperledger/fabric-orderer:2.5
          env:
            - name: ORDERER_GENERAL_LISTENADDRESS
              value: "0.0.0.0"
            - name: ORDERER_GENERAL_LISTENPORT
              value: "8050"
            - name: ORDERER_GENERAL_LOCALMSPID
              value: "OrdererOrgDCMS"
            - name: ORDERER_GENERAL_LOCALMSPDIR
              value: /var/hyperledger/orderer/msp
            - name: ORDERER_GENERAL_TLS_ENABLED
              value: "true"
            - name: ORDERER_GENERAL_TLS_PRIVATEKEY
              value: /var/hyperledger/orderer/tls/keystore
            - name: ORDERER_GENERAL_TLS_CERTIFICATE
              value: /var/hyperledger/orderer/tls/signcerts
            - name: ORDERER_GENERAL_TLS_ROOTCAS
              value: /var/hyperledger/orderer/tls/tlscacerts
            - name: ORDERER_GENERAL_CLUSTER_CLIENTCERTIFICATE
              value: /var/hyperledger/orderer/tls/signcerts
            - name: ORDERER_GENERAL_CLUSTER_CLIENTPRIVATEKEY
              value: /var/hyperledger/orderer/tls/keystore
            - name: ORDERER_GENERAL_CLUSTER_ROOTCAS
              value: /var/hyperledger/orderer/tls/tlscacerts
          volumeMounts:
            - name: msp
              mountPath: /var/hyperledger/orderer/msp
            - name: tls
              mountPath: /var/hyperledger/orderer/tls
      volumes:
        - name: msp
          hostPath:
            path: /work/orgdcms/orderers/orderer1/msp
        - name: tls
          hostPath:
            path: /work/orgdcms/orderers/orderer1/tls
YAML

cat <<'YAML' > ~/fabric-deploy/orderer/orderer1-orgdcms-svc.yaml
apiVersion: v1
kind: Service
metadata:
  name: orderer1-orgdcms
  namespace: orderer
spec:
  selector:
    app: orderer1-orgdcms
  ports:
    - port: 8050
      targetPort: 8050
YAML

cat <<'YAML' > ~/fabric-deploy/orderer/orderer0-orgx.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: orderer0-orgx
  namespace: orderer
spec:
  replicas: 1
  selector:
    matchLabels:
      app: orderer0-orgx
  template:
    metadata:
      labels:
        app: orderer0-orgx
    spec:
      containers:
        - name: orderer
          image: hyperledger/fabric-orderer:2.5
          env:
            - name: ORDERER_GENERAL_LISTENADDRESS
              value: "0.0.0.0"
            - name: ORDERER_GENERAL_LISTENPORT
              value: "9050"
            - name: ORDERER_GENERAL_LOCALMSPID
              value: "OrdererOrgX"
            - name: ORDERER_GENERAL_LOCALMSPDIR
              value: /var/hyperledger/orderer/msp
            - name: ORDERER_GENERAL_TLS_ENABLED
              value: "true"
            - name: ORDERER_GENERAL_TLS_PRIVATEKEY
              value: /var/hyperledger/orderer/tls/keystore
            - name: ORDERER_GENERAL_TLS_CERTIFICATE
              value: /var/hyperledger/orderer/tls/signcerts
            - name: ORDERER_GENERAL_TLS_ROOTCAS
              value: /var/hyperledger/orderer/tls/tlscacerts
            - name: ORDERER_GENERAL_CLUSTER_CLIENTCERTIFICATE
              value: /var/hyperledger/orderer/tls/signcerts
            - name: ORDERER_GENERAL_CLUSTER_CLIENTPRIVATEKEY
              value: /var/hyperledger/orderer/tls/keystore
            - name: ORDERER_GENERAL_CLUSTER_ROOTCAS
              value: /var/hyperledger/orderer/tls/tlscacerts
          volumeMounts:
            - name: msp
              mountPath: /var/hyperledger/orderer/msp
            - name: tls
              mountPath: /var/hyperledger/orderer/tls
      volumes:
        - name: msp
          hostPath:
            path: /work/orgx/orderers/orderer0/msp
        - name: tls
          hostPath:
            path: /work/orgx/orderers/orderer0/tls
YAML

cat <<'YAML' > ~/fabric-deploy/orderer/orderer0-orgx-svc.yaml
apiVersion: v1
kind: Service
metadata:
  name: orderer0-orgx
  namespace: orderer
spec:
  selector:
    app: orderer0-orgx
  ports:
    - port: 9050
      targetPort: 9050
YAML

ls -l ~/fabric-deploy/orderer
cd ..
sudo kubectl apply -f ~/fabric-deploy/orderer/
sudo kubectl -n orderer get pods
sudo kubectl -n orderer get svc
sudo kubectl -n orderer get pods
mkdir -p ~/fabric-deploy/channel
cat <<'YAML' > ~/fabric-deploy/channel/configtx.yaml
Organizations:
  - &OrdererOrgDCMS
    Name: OrdererOrgDCMS
    ID: OrdererOrgDCMS
    MSPDir: /work/orgdcms/orderers/orderer0/msp
    Policies:
      Readers: { Type: Signature, Rule: "OR('OrdererOrgDCMS.member')" }
      Writers: { Type: Signature, Rule: "OR('OrdererOrgDCMS.member')" }
      Admins:  { Type: Signature, Rule: "OR('OrdererOrgDCMS.admin')" }

  - &OrdererOrgX
    Name: OrdererOrgX
    ID: OrdererOrgX
    MSPDir: /work/orgx/orderers/orderer0/msp
    Policies:
      Readers: { Type: Signature, Rule: "OR('OrdererOrgX.member')" }
      Writers: { Type: Signature, Rule: "OR('OrdererOrgX.member')" }
      Admins:  { Type: Signature, Rule: "OR('OrdererOrgX.admin')" }

Capabilities:
  Channel: &ChannelCapabilities
    V2_0: true
  Orderer: &OrdererCapabilities
    V2_0: true

Application: &ApplicationDefaults
  Policies:
    Readers: { Type: ImplicitMeta, Rule: "ANY Readers" }
    Writers: { Type: ImplicitMeta, Rule: "ANY Writers" }
    Admins:  { Type: ImplicitMeta, Rule: "MAJORITY Admins" }
  Capabilities: *ChannelCapabilities

Orderer: &OrdererDefaults
  OrdererType: etcdraft
  Addresses:
    - orderer0-orgdcms.orderer:7050
    - orderer1-orgdcms.orderer:8050
    - orderer0-orgx.orderer:9050
  EtcdRaft:
    Consenters:
      - Host: orderer0-orgdcms.orderer
        Port: 7050
        ClientTLSCert: /work/orgdcms/orderers/orderer0/tls/signcerts/cert.pem
        ServerTLSCert: /work/orgdcms/orderers/orderer0/tls/signcerts/cert.pem
      - Host: orderer1-orgdcms.orderer
        Port: 8050
        ClientTLSCert: /work/orgdcms/orderers/orderer1/tls/signcerts/cert.pem
        ServerTLSCert: /work/orgdcms/orderers/orderer1/tls/signcerts/cert.pem
      - Host: orderer0-orgx.orderer
        Port: 9050
        ClientTLSCert: /work/orgx/orderers/orderer0/tls/signcerts/cert.pem
        ServerTLSCert: /work/orgx/orderers/orderer0/tls/signcerts/cert.pem
  Organizations:
    - *OrdererOrgDCMS
    - *OrdererOrgX
  Capabilities: *OrdererCapabilities
  Policies:
    Readers: { Type: ImplicitMeta, Rule: "ANY Readers" }
    Writers: { Type: ImplicitMeta, Rule: "ANY Writers" }
    Admins:  { Type: ImplicitMeta, Rule: "MAJORITY Admins" }

Profiles:
  SystemGenesis:
    Orderer:
      <<: *OrdererDefaults
    Consortiums:
      SampleConsortium:
        Organizations:
          - *OrdererOrgDCMS
          - *OrdererOrgX
YAML

sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
sudo kubectl -n fabric-tools cp ~/fabric-deploy/channel/configtx.yaml fabric-tools:/work/channel/configtx.yaml
dir
cd fabric-deplot
cd fabric-deploy
dir
md channel
cd channel
dir
sudo kubectl -n fabric-tools exec fabric-tools -- mkdir -p /work/channel
cd..
..
.
cd.
cd ./
cd ~
dir
sudo kubectl -n fabric-tools cp ~/fabric-deploy/channel/configtx.yaml fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec fabric-tools -- ls /work/channel
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
dir
cd fabric deploy
dir
nano ~/fabric-deploy/channel/configtx.yaml
fg
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp ~/fabric-deploy/channel/configtx.yaml fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
export FABRIC_CFG_PATH=/work/channel
configtxgen -profile SystemGenesis -channelID system-channel -outputBlock /work/channel-artifacts/genesis.block
ls /work/channel-artifacts
sudo kubectl -n fabric-tools exec fabric-tools -- ls /work/channel
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
cd ~/fabric-deploy
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=~/fabric-deploy/peer0-msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=~/fabric-deploy/peer0-tls/tlscacerts/tls-localhost-7054.pem
export CORE_PEER_ADDRESS=localhost:7051
peer channel create   -o localhost:7050   -c dcmschannel   --outputBlock dcmschannel.block   --tls   --cafile ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
which peer
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl cp ~/fabric-deploy/peer0-msp fabric-tools/fabric-tools:/work/peer0-msp
kubectl cp ~/fabric-deploy/peer0-tls fabric-tools/fabric-tools:/work/peer0-tls
kubectl cp ~/fabric-deploy/orderer1-tls fabric-tools/fabric-tools:/work/orderer1-tls
kubectl exec -it -n fabric-tools fabric-tools -- ls /work
kubectl exec -it -n fabric-tools fabric-tools -- bash
cd /work
export CORE_PEER_LOCALMSPID=OrgDCMSMSP
export CORE_PEER_MSPCONFIGPATH=/work/peer0-msp
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_ROOTCERT_FILE=/work/peer0-tls/tlscacerts/tls-localhost-7054.pem
export CORE_PEER_ADDRESS=peer0.orgdcms:7051
cd orderer
ls
nano ~/fabric-deploy/orderer/orderer1-dcms-svc.yaml
kubectl apply -f orderer/orderer1-orgdcms-svc.yaml
exit
cd ~/fabric-deploy
cd orderer
kubectl apply -f orderer/orderer1-orgdcms-svc.yaml
ls
kubectl apply -f orderer1-orgdcms-svc.yaml
kubectl get svc -n orgdcms
kubectl apply -f orderer/orderer1-orgdcms-svc.yaml
kubectl apply -f orderer1-orgdcms-svc.yaml
peer channel create   -o orderer1-orgdcms:7050   -c dcmschannel   --outputBlock dcmschannel.block   --tls   --cafile /work/orderer1-tls/tlscacerts/tls-localhost-7054.pem
exit
kubectl -n orgdcms get pods -l app=orderer1
kubectl -n orgdcms logs orderer1-6986fd6cc6-rj6mb
ls ~/fabric-deploy/orderer1-tls/keystore
ls -lt ~/fabric-deploy/orderer1-tls/keystore
kubectl -n orgdcms patch deploy orderer1 --type='json' -p='[
{"op":"replace","path":"/spec/template/spec/containers/0/env/5/value","value":"/var/hyperledger/orderer/tls/keystore/5a22b8c606d012f8e843a320d3ace8e602b786a1d21316c0e35e86535aff2975_sk"}
]'
kubectl -n orgdcms rollout restart deploy/orderer1
kubectl -n orgdcms rollout status deploy/orderer1
kubectl -n orgdcms get pods -l app=orderer1
kubectl -n orgdcms logs orderer1-7c9b97f9b8-tbvck --previous
kubectl -n orgdcms patch deploy orderer1 --type='json' -p='[
{"op":"replace","path":"/spec/template/spec/containers/0/env/5/value","value":"true"}
]'
kubectl -n orgdcms patch deploy orderer1 --type='json' -p='[
{"op":"replace","path":"/spec/template/spec/containers/0/env/6/value","value":"/var/hyperledger/orderer/tls/keystore/5a22b8c606d012f8e843a320d3ace8e602b786a1d21316c0e35e86535aff2975_sk"}
]'
kubectl -n orgdcms get pods -l app=orderer1
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb -o orderer1:7050 -c mychannel \
 --tls --cafile /var/hyperledger/peer/tls/tlscacerts/tls-localhost-7054.pem'
kubectl -n orgdcms get svc
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb \
 -o orderer1.orgdcms.svc.cluster.local:7050 \
 -c mychannel \
 --tls \
 --cafile /var/hyperledger/peer/tls/tlscacerts/tls-localhost-7054.pem'
kubectl -n orgdcms run dns-test --image=busybox:1.36 --rm -it --restart=Never -- sh
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
sudo kubectl -n fabric-tools exec fabric-tools -- mkdir -p /work/channel
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
sudo kubectl -n orgdcms get pods
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
sudo kubectl -n orgdcms get pods
sudo kubectl -n orgdcms exec -it fabric-ca-bc5cc48cd-rx94q -- bash
nano ~/fabric-deploy/channel/configtx.yaml
sudo kubectl -n fabric-tools cp   ~/fabric-deploy/channel/configtx.yaml   fabric-tools:/work/channel/configtx.yaml
sudo kubectl -n fabric-tools exec -it fabric-tools -- bash
cd ~
ls
cd fabric-deploy
git init
git branch -m main
ls
mkdir k8s
cat <<EOF > .gitignore
/work/
/*.block
*.pem
*.key
*.crt
EOF

git add .
git commit -m "Initial Fabric k3s deploy (CA, configtx)"
git status
git commit -m "Bootstrap Fabric deploy (CA, orderer, configtx)"
git branch -M main
git remote add origin https://github.com/AdlaiSantopadre/fabric-deploy.git
git push -u origin main
git remote add origin https://github.com/AdlaiSantopadre/beelink-fabrik.git
git branch -M main
git remote add origin https://github.com/AdlaiSantopadre/beelink-fabrik.git
git push -u origin main
git remote -v
git remote set-url origin https://github.com/AdlaiSantopadre/beelink-fabrik.git
git commit -m "Bootstrap Fabric on k3s: CA, configtx, orderers"
git branch -M main
git push -u origin main
Git config –global user.name “Adlai Santopadre”
git config –global user.name “Adlai Santopadre”
git config –global user.email “tua.email@example.com"
git config --global --list
git commit -m "Bootstrap Fabric on k3s: CA, configtx, orderers"
git push -u origin main

exit
git config --global --list
git config --global user.mail "126016337+AdlaiSantopadre@users.noreply.github.com"
git config --global --list
git commit -m "Bootstrap Fabric on k3s: CA, configtx, orderers"
git push -u origin main
git config --global --list
git config --global user.name "AdlaiSantopadre"
git config --global --list
git commit -m "Bootstrap Fabric on k3s: CA, configtx, orderers"
git config --global user.name "AdlaiSantopadre"
git config --global user.mail "AdlaiSantopadre@users.noreply.github.com"
git config --global user.name "AdlaiSantopadre"
git config --global --list
git commit -m "Bootstrap Fabric on k3s: CA, configtx, orderers"
git push -u origin main
git config --global --list
git config --global user.email "AdlaiSantopadre@users.noreply.github.com"
git add .
git commit -m "Bootstrap Fabric on k3s: CA, configtx, orderers"
git branch -M main
git push -u origin main
ls ~/.ssh
ssh-keygen -t ed25519 -C "AdlaiSantopadre@github"
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
git push -u origin main
git remote -v
origin  https://github.com/AdlaiSantopadre/beelink-fabrik.git (fetch)
origin  https://github.com/AdlaiSantopadre/beelink-fabrik.git (push)
git remote set-url origin git@github.com:AdlaiSantopadre/beelink-fabrik.git
git remote -v
git config --global --unset credential.helper
git push -u origin main
git pull --rebase origin main
git push origin main
kubectl apply -n orgdcms -f fabric-ca-pvc.yaml
kubectl delete deployment fabric-ca -n orgdcms --ignore-not-found
kubectl apply -n orgdcms -f fabric-ca-deployment-tls.yaml
kubectl apply -n orgdcms -f fabric-ca-pvc.yaml
cd..
cd ..
kubectl apply -n orgdcms -f fabric-ca-pvc.yaml
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl apply -n orgdcms -f fabric-ca-pvc.yaml
cd fabric-deploy
dir
nano fabric-ca.yaml
kubectl apply -f fabric-ca.yaml
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/fabric-ca --tail=80
kubectl delete pod -n orgdcms fabric-ca-bc5cc48cd-rx94q
kubectl describe pvc -n orgdcms fabric-ca-pvc
kubectl get sc
kubectl -n kube-system get pods | grep local-path
kubectl -n kube-system rollout restart deployment local-path-provisioner
kubectl delete pod -n orgdcms fabric-ca-b9848678-rgxd4
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment fabric-ca -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl scale deployment fabric-ca -n orgdcms --replicas=1
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment fabric-ca -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl -n kube-system get pods | grep local-path
kubectl -n kube-system rollout restart deployment local-path-provisioner
kubectl scale deployment fabric-ca -n orgdcms --replicas=1
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl scale deployment fabric-ca -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
sudo mkdir -p /opt/local-path-provisioner/fabric-ca
sudo chmod 777 /opt/local-path-provisioner/fabric-ca
nano fabric-ca-pv.yaml
kubectl apply -f fabric-ca-pv.yaml
kubectl get pv
kubectl get pvc -n orgdcms
kubectl delete pvc -n orgdcms fabric-ca-pvc
kubectl apply -f fabric-ca.yaml
kubectl get pv
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/fabric-ca --tail=50
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client register   --id.name orderer1   --id.secret ordererpw   --id.type orderer   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://admin:adminpw@fabric-ca.orgdcms:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://admin:adminpw@fabric-ca:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client register   --id.name orderer1   --id.secret ordererpw   --id.type orderer   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client register   -u https://localhost:7054   --id.name orderer1   --id.secret ordererpw   --id.type orderer   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://orderer1:ordererpw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,localhost   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem   -M /etc/hyperledger/fabric-ca-server/orderer1/tls
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://orderer1:ordererpw@localhost:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem   -M /etc/hyperledger/fabric-ca-server/orderer1/msp
cd ~/fabric-deploy
nano configtx.yaml
export FABRIC_CFG_PATH=~/fabric-deploy
configtxgen -profile Genesis -channelID system-channel -outputBlock genesis.block
kubectl run fabric-tools   --rm -it   --restart=Never   -n fabric-tools   --image=hyperledger/fabric-tools:2.5   -- bash
kubectl get pods -n fabric-tools
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl cp orgdcms/fabric-ca:/etc/hyperledger/fabric-ca-server/orderer1/tls   ~/fabric-deploy/orderer1-tls
dir
kubectl get pods -n orgdcms
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5/etc/hyperledger/fabric-ca-server/orderer1/tls   ~/fabric-deploy/orderer1-tls
kubectl get pods -n orgdcms
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5/etc/hyperledger/fabric-ca-server/orderer1/tls ~/fabric-deploy/orderer1-tls
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orderer1/tls ~/fabric-deploy/orderer1-tls
ls ~/fabric-deploy/orderer1-tls
kubectl cp ~/fabric-deploy/orderer1-tls fabric-tools/fabric-tools:/work/orderer1-tls
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orderer1/msp   ~/fabric-deploy/orderer1-msp
ls ~/fabric-deploy/orderer1-msp/cacerts
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orderer1/msp
ls ~/fabric-deploy/orderer1-msp
ls ~/fabric-deploy/orderer1-msp/cacerts
kubectl cp ~/fabric-deploy/orderer1-msp fabric-tools/fabric-tools:/work/orderer1-msp
nano ~/fabric-deploy/configtx.yaml
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orderer1/msp
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl cp orgdcms/<POD_CA>:/etc/hyperledger/fabric-ca-server/orgdcms/msp   ~/fabric-deploy/orgdcms-msp
ls ~/fabric-deploy/orgdcms-msp/cacerts
kubectl get pods -n orgdcms
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orgdcms/msp   ~/fabric-deploy/orgdcms-msp
ls ~/fabric-deploy/orgdcms-msp/cacerts
ls
kubectl cp orgdcms/<POD_CA>:/etc/hyperledger/fabric-ca-server/orgdcms/msp   ~/fabric-deploy/orgdcms-msp
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orgdcms/msp   ~/fabric-deploy/orgdcms-msp
ls ~/fabric-deploy/orgdcms-msp
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem   -M /etc/hyperledger/fabric-ca-server/orgdcms/msp
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- ls /etc/hyperledger/fabric-ca-server/orgdcms/msp/cacerts
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/orgdcms/msp   ~/fabric-deploy/orgdcms-msp
kubectl cp ~/fabric-deploy/orgdcms-msp fabric-tools/fabric-tools:/work/orgdcms-msp
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/configtx.yaml
kubectl cp ~/fabric-deploy/configtx.yaml fabric-tools/fabric-tools:/work/configtx.yaml
kubectl exec -it -n fabric-tools fabric-tools -- bash
nano ~/fabric-deploy/orderer-deployment.yaml
kubectl apply -f orderer-deployment.yaml
kubectl get pods -n orgdcms
kubectl logs -n orgdcms pod/orderer1-67bb4cdb8d-ptht7
mkdir -p ~/fabric-deploy/orderer1-msp/admincerts
cp ~/fabric-deploy/orderer1-msp/signcerts/*.pem    ~/fabric-deploy/orderer1-msp/admincerts/
ls ~/fabric-deploy/orderer1-msp/admincerts
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/orderer1 --tail=50
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
ls ~/fabric-deploy/orderer1-msp
kubectl get pods -n orgdcms
nano ~/fabric-deploy/orderer1-msp/config.yaml
rm -rf ~/fabric-deploy/orderer1-msp/admincerts
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/orderer1 --tail=50
ls ~/fabric-deploy/orderer1-tls/keystore
nano ~/fabric-deploy/orderer-deployment.yaml
kubectl apply -f orderer-deployment.yaml
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/orderer1 --tail=30
nano ~/fabric-deploy/orderer-deployment.yaml
kubectl scale deployment orderer1 -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl apply -f orderer-deployment.yaml
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/orderer1 --tail=30
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/orderer1 --tail=30
ls
del channel
rd channel
rm -rf channel
rm -f configtx.yaml
rm -rf k8s
ls
cd orderer
ls
rm orderer/orderer0-orgdcms.yaml
rm orderer/orderer0-orgdcms-svc.yaml
rm orderer/orderer0-orgx.yaml
rm orderer/orderer0-orgx-svc.yaml
rm orderer/orderer1-orgx-svc.yaml
cd..
rm orderer/orderer0-orgdcms.yaml
rm orderer/orderer0-orgdcms-svc.yaml
rm orderer/orderer0-orgx.yaml
rm orderer/orderer0-orgx-svc.yaml
rm orderer/orderer1-orgx-svc.yaml
cd fabric-deploy
cd ~/fabric/deploy
cd ~/fabric-deploy
rm orderer/orderer0-orgdcms.yaml
rm orderer/orderer0-orgdcms-svc.yaml
rm orderer/orderer0-orgx.yaml
rm orderer/orderer0-orgx-svc.yaml
rm orderer/orderer1-orgx-svc.yaml
ls
git status
git add fabric-ca.yaml fabric-ca-pv.yaml orderer-deployment.yaml orderer/ orderer1-msp orderer1-tls README.md
git commit -m "Fabric 2.5: CA TLS + Orderer channel participation (no system channel)"
git push origin main
# Enroll peer0 (MSP + TLS) dal CA OrgDCMS
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client register --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7054 --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem -M /etc/hyperledger/fabric-ca-server/peer0/msp
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7054 --enrollment.profile tls --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem -M /etc/hyperledger/fabric-ca-server/peer0/tls
# Enroll peer0 (MSP + TLS) dal CA OrgDCMS
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client register --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client register   --id.name peer0   --id.secret peer0pw   --id.type peer   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem   -u https://localhost:7054
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://peer0:peer0pw@localhost:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem   -M /etc/hyperledger/fabric-ca-server/peer0/msp
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client enroll   -u https://peer0:peer0pw@localhost:7054   --enrollment.profile tls   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem   -M /etc/hyperledger/fabric-ca-server/peer0/tls
kubectl exec -n orgdcms deploy/fabric-ca -- ls /etc/hyperledger/fabric-ca-server/peer0
kubectl cp orgdcms/<POD_CA>:/etc/hyperledger/fabric-ca-server/peer0/msp ~/fabric-deploy/peer0-msp
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/peer0/msp ~/fabric-deploy/peer0-msp
kubectl cp orgdcms/fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/peer0/tls ~/fabric-deploy/peer0-tls
nano ~/fabric-deploy/peer0-msp/config.yaml
nano ~/fabric-deploy/peer0-orgdcms.yaml
kubectl apply -f peer0-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/peer0 --tail=30
ls ~/fabric-deploy/peer0-tls/keystore
~/fabric-deploy/peer0-tls/signcerts/
nano ~/fabric-deploy/peer0-orgdcms.yaml
kubectl apply -f peer0-orgdcms.yaml
kubectl rollout restart deployment peer0 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms pod/peer0-68558bf64c-zgpg9
ls ~/fabric-deploy/peer0-tls/signcerts
openssl x509 -noout -modulus -in ~/fabric-deploy/peer0-tls/signcerts/cert.pem | openssl md5
openssl rsa -noout -modulus -in ~/fabric-deploy/peer0-tls/keystore/234dce83a710e393ceea02cdbb7a1d8f16cc2d9d1790c0c38875219f99f23baa_sk | openssl md5
openssl rsa -noout -modulus -in ~/fabric-deploy/peer0-tls/keystore/2cb1b0b8beed8471cdb7eee385406194a82764da8f8886c56b4d9b0334be4356_sk | openssl md5
kubectl logs -n orgdcms pod/peer0-b6b8c8796-gf72f
openssl x509 -in ~/fabric-deploy/peer0-tls/signcerts/cert.pem -pubkey -noout | openssl pkey -pubin -outform DER | openssl sha256
openssl pkey -in ~/fabric-deploy/peer0-tls/keystore/234dce83a710e393ceea02cdbb7a1d8f16cc2d9d1790c0c38875219f99f23baa_sk -pubout -outform DER | openssl sha256
openssl pkey -in ~/fabric-deploy/peer0-tls/keystore/2cb1b0b8beed8471cdb7eee385406194a82764da8f8886c56b4d9b0334be4356_sk -pubout -outform DER | openssl sha256
nano ~/fabric-deploy/peer0-orgdcms.yaml
rm ~/fabric-deploy/peer0-tls/keystore/234dce83a710e393ceea02cdbb7a1d8f16cc2d9d1790c0c38875219f99f23baa_sk
kubectl apply -f peer0-orgdcms.yaml
kubectl rollout restart deployment peer0 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs -n orgdcms pod/peer0-5cc84d8b88-lxd7v
nano ~/fabric-deploy/peer0-orgdcms.yaml
nano ~/fabric-deploy/peer0-orgdcms-svc.yaml
kubectl apply -f peer0-orgdcms.yaml
kubectl apply -f peer0-orgdcms-svc.yaml
kubectl rollout restart deployment peer0 -n orgdcms
kubectl get pods -n orgdcms
kubectl port-forward -n orgdcms svc/peer0 7051:7051
kubectl -n orgdcms port-forward deploy/fabric-ca 7054:7054
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb -o localhost:7050 -c mychannel \
 --tls --cafile /var/hyperledger/peer/tls/tlscacerts/tls-localhost-7054.pem'
kubectl exec -it -n fabric-tools fabric-tools -- bash
export FABRIC_CA_CLIENT_HOME=/tmp/orderer1-tls-v2
fabric-ca-client enroll   -u https://orderer1:orderer1pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.4.9 1.5.7
fabric-ca-client version
curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/bootstrap.sh | bash -s -- 2.5.6 1.5.12
abric-ca-client version
fabric-ca-client version
ls ~/fabric-samples/bin
export PATH=$PATH:$HOME/fabric-samples/bin
which fabric-ca-client
fabric-ca-client version
echo 'export PATH=$PATH:$HOME/fabric-samples/bin' >> ~/.bashrc
source ~/.bashrc
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
mkdir -p $FABRIC_CA_CLIENT_HOME
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
mkdir -p $FABRIC_CA_CLIENT_HOME
fabric-ca-client enroll   -u https://orderer1:orderer1pw@fabric-ca.orgdcms.svc.cluster.local:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost
ls $FABRIC_CA_CLIENT_HOME/msp/signcerts
ls $FABRIC_CA_CLIENT_HOME/msp/keystore
ls $FABRIC_CA_CLIENT_HOME/msp/tlscacerts
kubectl -n orgdcms get secret | grep fabric-ca
kubectl -n orgdcms get secret fabric-ca -o jsonpath='{.data.tls-cert}' | base64 -d > ~/ca-tls.pem
kubectl -n orgdcms get secret
kubectl -n orgdcms exec -it deploy/fabric-ca -- bash
kubectl -n orgdcms get endpoints orderer1
kubectl -n kube-system rollout restart deploy/coredns
kubectl -n kube-system rollout status deploy/coredns
sudo kubectl -n orgdcms run dns-test --image=busybox:1.36 --rm -it --restart=Never -- sh
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl get svc orderer1-orgdcms -n orgdcms -o wide
kubectl get svc -n orgdcms
kubectl apply -f ~/fabric-deploy/orderer/orderer1-orgdcms-svc.yaml
kubectl get svc -n orgdcms
kubectl get svc --all-namespaces | grep orderer1
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl get pods -A | grep fabric-tools
kubectl exec -it -n fabric-tools fabric-tools -- bash
kubectl exec -n fabric-tools fabric-tools -- cat /etc/resolv.conf
kubectl get endpoints orderer1-orgdcms -n orderer -o wide
kubectl get pods -n orderer --show-labels | grep orderer1
kubectl edit svc orderer1-orgdcms -n orderer
kubectl get endpoints orderer1-orgdcms -n orderer
kubectl get pod orderer1-orgdcms-859cc5d8c6-ccvd6 -n orderer
kubectl describe pod orderer1-orgdcms-859cc5d8c6-ccvd6 -n orderer | grep -E "Ready|Ports"
kubectl logs -n orderer orderer1-orgdcms-859cc5d8c6-ccvd6 --tail=50
kubectl exec -n orderer orderer1-orgdcms-859cc5d8c6-ccvd6 -- ls /var/hyperledger/orderer/msp
kubectl get pod orderer1-orgdcms-859cc5d8c6-ccvd6 -n orderer -o yaml | grep -A2 containers:
NS=orgdcms
CH=mychannel
PEER_POD=$(kubectl -n $NS get pod -l app=peer0 -o jsonpath='{.items[0].metadata.name}')
ORDERER_SVC=orderer1.$NS.svc.cluster.local:7050
kubectl -n $NS get deploy,svc,pod,cm,secret,pvc | grep -i dcms
kubectl -n $NS get pods -o wide | grep -i orderer
kubectl -n $NS get deploy,svc,pod,cm,secret,pvc | grep -i dcms
kubectl -n $NS get pods -o wide | grep -i orderer
kubectl -n orgdcms exec -it peer0 -- bash
kubectl -n orgdcms get pods | grep peer
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc '
set -e

CH=mychannel
ORDERER=orderer1.orgdcms.svc.cluster.local:7050
BAD_HOST=orderer1-dcms.orgdcms.svc.cluster.local

WORK=/tmp/chcfg
rm -rf $WORK && mkdir -p $WORK && cd $WORK

peer channel fetch config config_block.pb -o $ORDERER -c $CH

configtxlator proto_decode --input config_block.pb --type common.Block --output block.json
jq .data.data[0].payload.data.config block.json > config.json

jq "
.channel_group.groups.Orderer.values.ConsensusType.value.metadata.consenters
|= map(select(.host != \"$BAD_HOST\"))
" config.json > modified.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified.json --type common.Config --output modified.pb

configtxlator compute_update \
  --channel_id $CH \
  --original config.pb \
  --updated modified.pb \
  --output update.pb

configtxlator proto_decode --input update.pb --type common.ConfigUpdate --output update.json

echo "{\"payload\":{\"header\":{\"channel_header\":{\"channel_id\":\"$CH\",\"type\":2}},\"data\":{\"config_update\":$(cat update.json)}}}" \
| jq . > envelope.json

configtxlator proto_encode --input envelope.json --type common.Envelope --output update_envelope.pb

peer channel signconfigtx -f update_envelope.pb
peer channel update -f update_envelope.pb -c $CH -o $ORDERER
'
kubectl -n orgdcms get svc | grep orderer
kubectl -n orgdcms get svc
kubectl -n orgdcms get pod orderer1-9fb54778b-tvpqg --show-labels
cd ~/fabric-deploy
nano orderer1-svc.yaml
kubectl apply -f orderer1-svc.yaml
rm orderer1-svc.yaml
cat <<'EOF' > orderer1-svc.yaml
apiVersion: v1
kind: Service
metadata:
  name: orderer1
  namespace: orgdcms
spec:
  selector:
    app: orderer1
  ports:
    - name: grpc
      port: 7050
      targetPort: 7050
  type: ClusterIP
EOF

cat orderer1-svc.yaml
kubectl apply -f orderer1-svc.yaml
kubectl -n orgdcms get svc orderer1
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- nslookup orderer1
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc '
peer channel fetch config /tmp/test.pb \
  -o orderer1.orgdcms.svc.cluster.local:7050 \
  -c mychannel
'
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc '
peer channel fetch config /tmp/test.pb \
  -o orderer1.orgdcms.svc.cluster.local:7050 \
  -c mychannel
'
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc '
peer channel fetch config /tmp/test.pb \
  -o orderer1:7050 \
  -c mychannel
'
kubectl -n orgdcms get pod peer0-8578465b4b-tqq2j -o jsonpath='{.spec.dnsPolicy}'
kubectl -n orgdcms get endpoints orderer1
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb -o orderer1:7050 -c mychannel'
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb -o orderer1.orgdcms:7050 -c mychannel'
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb -o 10.42.0.58:7050 -c mychannel'
kubectl -n orgdcms exec -it orderer1-9fb54778b-tvpqg -- ss -ltnp | grep 7050
kubectl -n orgdcms exec -it orderer1-9fb54778b-tvpqg -- bash -lc '
cat /proc/net/tcp | grep -i :1b8a
'
kubectl -n orgdcms exec -it orderer1-9fb54778b-tvpqg -- env | grep ORDERER_GENERAL
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc '
peer channel fetch config /tmp/test.pb \
  -o 10.42.0.58:7050 \
  -c mychannel \
  --tls \
  --cafile /var/hyperledger/orderer/tls/tlscacerts/tls-localhost-7054.pem
'
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc '
find /var/hyperledger -type f | grep tlsca
'
kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb -o 10.42.0.58:7050 -c mychannel \
 --tls --cafile /var/hyperledger/peer/tls/tlscacerts/tls-localhost-7054.pem'
kubectl -n orgdcms exec -it orderer1-9fb54778b-tvpqg -- bash -lc 'openssl x509 -in /var/hyperledger/orderer/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"'
kubectl -n orgdcms port-forward pod/orderer1-9fb54778b-tvpqg 7050:7050
kubectl -n orgdcms exec deploy/fabric-ca -- cat /etc/hyperledger/fabric-ca-server/tls-cert.pem > ~/ca-tls.pem
ls -l ~/ca-tls.pem
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
fabric-ca-client enroll   -u https://orderer1:orderer1pw@fabric-ca.orgdcms.svc.cluster.local:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
md ~
cd ~
fabric-ca-client enroll   -u https://orderer1:orderer1pw@fabric-ca.orgdcms.svc.cluster.local:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
fabric-ca-client enroll   -u https://orderer1:orderer1pw@fabric-ca.orgdcms.svc.cluster.local:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
ls ~/fabric-samples/bin/fabric-ca-client
export PATH=$PATH:$HOME/fabric-samples/bin
which fabric-ca-client
fabric-ca-client version
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
fabric-ca-client enroll   -u https://orderer1:orderer1pw@fabric-ca.orgdcms.svc.cluster.local:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
ls ~/tls-orderer1-v2/msp/signcerts
ls ~/tls-orderer1-v2/msp/keystore
ls ~/tls-orderer1-v2/msp/tlscacerts
ls ~/tls-orderer1-v2/msp/signcerts
ls ~/tls-orderer1-v2/msp/keystore
ls ~/tls-orderer1-v2/msp/tlscacerts
export PATH=$PATH:$HOME/fabric-samples/bin
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
fabric-ca-client enroll   -u https://orderer1:orderer1pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
kubectl -n orgdcms exec -it deploy/fabric-ca -- bash
export PATH=$PATH:$HOME/fabric-samples/bin
export FABRIC_CA_CLIENT_HOME=~/ca-admin
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles ~/ca-tls.pem
fabric-ca-client register   --id.name orderer1   --id.secret orderer1pw   --id.type orderer   --id.attrs 'hf.Registrar.Roles=*,hf.Registrar.Attributes=*'
export PATH=$PATH:$HOME/fabric-samples/bin
export FABRIC_CA_CLIENT_HOME=~/ca-admin
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles ~/ca-tls.pem
fabric-ca-client register   --id.name orderer1   --id.secret orderer1pw   --id.type orderer
fabric-ca-client register   --id.name orderer1   --id.secret orderer1pw   --id.type orderer   --tls.certfiles ~/ca-tls.pem
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
fabric-ca-client enroll   -u https://orderer1:orderer1pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
kubectl -n orgdcms get deploy orderer1 -o yaml | grep -A3 tls
fabric-ca-client register   --id.name orderer1-tls-v2   --id.secret orderer1tlspw   --id.type orderer   --tls.certfiles ~/ca-tls.pem
export FABRIC_CA_CLIENT_HOME=~/ca-admin
fabric-ca-client register   --id.name orderer1-tls-v2   --id.secret orderer1tlspw   --id.type orderer   --tls.certfiles ~/ca-tls.pem
export FABRIC_CA_CLIENT_HOME=~/tls-orderer1-v2
fabric-ca-client enroll   -u https://orderer1-tls-v2:orderer1tlspw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost   --tls.certfiles ~/ca-tls.pem
ls ~/tls-orderer1-v2/msp/signcerts
ls ~/tls-orderer1-v2/msp/keystore
ls ~/tls-orderer1-v2/msp/tlscacerts
mv ~/fabric-deploy/orderer1-tls ~/fabric-deploy/orderer1-tls.bak.$(date +%Y%m%d-%H%M%S)
mkdir -p ~/fabric-deploy/orderer1-tls
cp -r ~/tls-orderer1-v2/msp/* ~/fabric-deploy/orderer1-tls/
ls ~/fabric-deploy/orderer1-tls/{signcerts,keystore,tlscacerts}
mv ~/fabric-deploy/orderer1-tls ~/fabric-deploy/orderer1-tls.bak.$(date +%Y%m%d-%H%M%S)
mkdir -p ~/fabric-deploy/orderer1-tls
cp -r ~/tls-orderer1-v2/msp/* ~/fabric-deploy/orderer1-tls/
ls ~/fabric-deploy/orderer1-tls/{signcerts,keystore,tlscacerts}
kubectl -n orgdcms rollout restart deploy/orderer1
kubectl -n orgdcms rollout status deploy/orderer1
kubectl -n orgdcms get pods -l app=orderer1
kubectl -n orgdcms logs orderer1-586b55496d-tnz8x
kubectl -n orgdcms logs orderer1-688d79cc65-brjdj
kubectl -n orgdcms get deploy orderer1 -o jsonpath='{range .spec.template.spec.containers[0].env[*]}{.name}{"\n"}{end}'
kubectl -n orgdcms patch deploy orderer1 --type='json' -p='[
{"op":"replace","path":"/spec/template/spec/containers/0/env/6/value","value":"/var/hyperledger/orderer/tls/keystore/5a22b8c606d012f8e843a320d3ace8e602b786a1d21316c0e35e86535aff2975_sk"}
]'
kubectl -n orgdcms rollout restart deploy/orderer1
kubectl -n orgdcms rollout status deploy/orderer1
kubectl -n kube-system get pods -l k8s-app=kube-dns
kubectl -n kube-system logs coredns-546d667766-xkm8z
kubectl -n kube-system get sa coredns
kubectl get clusterrolebinding system:coredns
kubectl -n kube-system get pods -o wide
sudo systemctl restart k3s
kubectl -n kube-system get pods -o wide
kubectl -n kube-system get pods
sudo kubectl -n kube-system get pods
kubectl -n orgdcms run dns-test --image=busybox:1.36 --rm -it --restart=Never -- sh
sudo kubectl -n orgdcms run dns-test --image=busybox:1.36 --rm -it --restart=Never -- sh
sudo kubectl -n orgdcms delete pod dns-test
sudo kubectl -n orgdcms exec -it peer0-8578465b4b-tqq2j -- bash -lc 'peer channel fetch config /tmp/test.pb \
 -o orderer1.orgdcms.svc.cluster.local:7050 \
 -c mychannel \
 --tls \
 --cafile /var/hyperledger/peer/tls/tlscacerts/tls-localhost-7054.pem'
sudo kubectl -n orgdcms exec -it orderer1-7465b988fb-fc57m -- bash -lc 'osnadmin channel list \
 --orderer-address localhost:7053 \
 --ca-file /var/hyperledger/orderer/tls/tlscacerts/tls-localhost-7054.pem \
 --client-cert /var/hyperledger/orderer/tls/signcerts/cert.pem \
 --client-key /var/hyperledger/orderer/tls/keystore/5a22b8c606d012f8e843a320d3ace8e602b786a1d21316c0e35e86535aff2975_sk'
sudo kubectl -n orgdcms exec -it orderer1-7465b988fb-fc57m -- bash -lc 'ls /usr/local/bin'
sudo kubectl -n orgdcms exec -it orderer1-7465b988fb-fc57m -- bash -lc 'find / -name osnadmin 2>/dev/null'
sudo kubectl -n orgdcms exec -it orderer1-7465b988fb-fc57m -- bash -lc 'ls /usr/local/bin'
cd ~
curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/bootstrap.sh | bash -s -- 2.5.0
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/fabric-ca 7054:7054
kubectl get pods -n orgdcms
kubectl logs orderer1-* -n orgdcms | head
kubectl logs orderer1-6b66657bf8-djr7z -n orgdcms
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053
getent hosts orderer1.orgdcms.svc.cluster.local
kubectl port-forward -n orgdcms svc/fabric-ca 7054:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M ~/fabric-deploy/orderer2-tls
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M ~/fabric-deploy/orderer2-tls
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
fabric-ca-client register   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   -u https://localhost:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
fabric-ca-client register   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   -u https://localhost:7054
ls ~/fabric-deploy/ca-client/msp
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
fabric-ca-client register   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   -u https://localhost:7054
orderer2pw
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M ~/fabric-deploy/orderer2-tls
openssl x509 -in ~/fabric-deploy/orderer2-tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
nano -n orderer2-svc.yaml
nano -n apiVersion: apps/v1
kind: Deployment
metadata:
spec:
nano -n orderer2-deployment.yaml
kubectl apply -n orgdcms -f orderer2-deployment.yaml
kubectl apply -n orgdcms -f orderer2-svc.yaml
nano -n orderer2-deployment.yaml
kubectl apply -n orgdcms -f orderer2-svc.yaml
nano -n orderer2-deployment.yaml
osnadmin channel list --orderer-address localhost:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/5a22b8c606d012f8e843a320d3ace8e602b786a1d21316c0e35e86535aff2975_sk
kubectl get pods -n orgdcms -o wide
kubectl logs -n orgdcms orderer1-6b66657bf8-djr7z | tail -n 30
kubectl get svc orderer1 -n orgdcms -o wide
kubectl exec -n orgdcms orderer1-6b66657bf8-djr7z -- getent hosts orderer1
kubectl exec -n orgdcms orderer1-6b66657bf8-djr7z -- getent hosts orderer1.orgdcms.svc.cluster.local
kubectl scale deployment orderer1 -n orgdcms --replicas=0
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
fabric-ca-client enroll   -u https://orderer1:ordererpw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local,10.43.3.32   -M ~/fabric-deploy/orderer1-tls
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
fabric-ca-client enroll   -u https://orderer1:ordererpw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local,10.43.3.32   -M ~/fabric-deploy/orderer1-tls
fabric-ca-client enroll   -u https://orderer1:ordererpw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local,10.43.3.32   -M ~/fabric-deploy/orderer1-tls
openssl x509 -in ~/fabric-deploy/orderer1-tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl logs -n orgdcms $(kubectl get pod -n orgdcms -l app=orderer1 -o name)
kubectl scale deployment orderer1 -n orgdcms --replicas=0
ls -lt ~/fabric-deploy/orderer1-tls/keystore
kubectl edit deployment orderer1 -n orgdcms
kubectl scale deployment orderer1 -n orgdcms --replicas=1
kubectl logs -n orgdcms $(kubectl get pod -n orgdcms -l app=orderer1 -o name) | tail -n 20
kubectl exec -n orgdcms orderer1-6b66657bf8-djr7z -- getent hosts orderer1.orgdcms.svc.cluster.local
kubectl get pods -n orgdcms -l app=orderer1
kubectl exec -n orgdcms orderer1-865f456f94-xgxsg -- getent hosts orderer1.orgdcms.svc.cluster.local
/home/asantopadre/fabric-deploy/orderer2-tls/keystore
ls -lt ~/fabric-deploy/orderer2-tls/keystore
sed -i 's/REPLACE_WITH_ORDERER2_SK/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk/g' orderer2-deployment.yaml
grep ORDERER_GENERAL_TLS_PRIVATEKEY -n orderer2-deployment.yaml
grep ORDERER_ADMIN_TLS_PRIVATEKEY -n orderer2-deployment.yaml
sed -n '30,50p' orderer2-deployment.yaml
kubectl apply -n orgdcms -f orderer2-deployment.yaml
kubectl apply -n orgdcms -f orderer2-svc.yaml
kubectl get pods -n orgdcms -l app=orderer2
kubectl logs -n orgdcms -l app=orderer2 | tail -n 20
sudo kubectl port-forward -n orgx pod/fabric-ca-b9848678-9ncpc 8054:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   -u https://localhost:7054
kubectl get ns orgx || kubectl create ns orgx
kubectl get svc -n orgx
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054
kubectl delete deployment fabric-ca -n orgx
kubectl delete svc fabric-ca -n orgx
kubectl apply -n orgx -f fabric-ca-pv.yaml
cd ~/fabric-deploy
ls
kubectl apply -n orgx -f fabric-ca-pv.yaml
kubectl apply -n orgx -f fabric-ca.yaml
cp fabric-ca.yaml fabric-ca-orgx.yaml
cp fabric-ca-pv.yaml fabric-ca-pv-orgx.yaml
sed -i 's/namespace: orgdcms/namespace: orgx/g' fabric-ca-orgx.yaml
sed -i 's/namespace: orgdcms/namespace: orgx/g' fabric-ca-pv-orgx.yaml
kubectl apply -f fabric-ca-pv-orgx.yaml
kubectl apply -f fabric-ca-orgx.yaml
kubectl get pods -n orgx
kubectl get svc -n orgx
kubectl get pods -n orgx
kubectl get svc -n orgx
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
abric-ca-client enroll -u https://admin:adminpw@localhost:7054
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
fabric-ca-client enroll -u https://admin:adminpw@localhost:8054
curl -k https://localhost:8054/cainfo
kubectl get endpoints -n orgx fabric-ca
kubectl logs -n orgx deploy/fabric-ca | tail -n 20
curl -k https://localhost:8054/cainfo
sudo kubectl port-forward -n orgx pod/fabric-ca-b9848678-9ncpc 8054:7054
curl -k https://localhost:8054/cainfo
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
fabric-ca-client enroll -u https://admin:adminpw@localhost:8054
ls ~/fabric-deploy/fabric-ca-server/tls-cert.pem
ls /home/asantopadre/fabric-deploy/fabric-ca-server/tls-cert.pem
kubectl exec -n orgx deploy/fabric-ca -- ls /etc/hyperledger/fabric-ca-server
kubectl cp orgx/$(kubectl get pod -n orgx -l app=fabric-ca -o jsonpath='{.items[0].metadata.name}'):/etc/hyperledger/fabric-ca-server/ca-cert.pem ~/fabric-deploy/ca-orgx-tls-root.pem
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/ca-orgx-tls-root.pem
fabric-ca-client enroll -u https://admin:adminpw@localhost:8054
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-client-orgx
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-deploy/ca-orgx-tls-root.pem
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   -u https://localhost:8054
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:8054   --enrollment.profile tls   --csr.hosts orderer3,orderer3.orgx.svc.cluster.local   -M ~/fabric-deploy/orderer3-tls
openssl x509 -in ~/fabric-deploy/orderer3-tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
cp orderer2-deployment.yaml orderer3-deployment.yaml
cd ~
cp orderer2-deployment.yaml orderer3-deployment.yaml
cp orderer2-svc.yaml orderer3-svc.yaml
nano orderer3-deployment.yaml
nano orderer3-svc.yaml
kubectl apply -n orgx -f orderer3-deployment.yaml
kubectl apply -n orgx -f orderer3-svc.yaml
kubectl logs -n orgx -l app=orderer3 | tail -n 20
ls ~/fabric-deploy/orderer3-tls
ls ~/fabric-deploy/orderer3-tls/tlscacerts
cd ~/fabric-deploy/orderer3-tls/tlscacerts
cp tls-localhost-8054.pem tls-localhost-7054.pem
kubectl rollout restart deployment orderer3 -n orgx
kubectl logs -n orgx -l app=orderer3 | tail -n 20
git add
git add .
git commit
git push
git push origin main
echo ".vscode-server/" >> .gitignore
git rm -r --cached .vscode-server
git add .gitignore
git commit -m "Remove vscode-server artifacts and ignore them"
git push origin main
git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch .vscode-server" --prune-empty --tag-name-filter cat -- --all
git reset --hard
git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch .vscode-server" --prune-empty --tag-name-filter cat -- --all
git push origin main --force
git filter-branch --force --index-filter "git rm -f --cached --ignore-unmatch .ssh/id_ed25519" --prune-empty --tag-name-filter cat -- --all
echo ".ssh/" >> .gitignore
git add .gitignore
git commit -m "Ignore ssh directory"
git push origin main --force
echo ".ssh/" >> .gitignore
git add .gitignore
git commit -m "Ignore ssh directory"
git push origin main --force
git remote set-url origin https://github.com/AdlaiSantopadre/asantopadre.git
git push origin main --force
ls ~/.ssh/id_ed25519
ls ~/.ssh/id_ed25519.pub
ssh-keygen -t ed25519 -C "AdlaiSantopadre"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
git push origin main --force
git remote -v
ssh-add ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
git push origin main --force
git remote set-url origin git@github.com:AdlaiSantopadre/asantopadre.git
git push origin main --force
mkdir -p ~/fabric-deploy/channel-artifacts
cd ~/fabric-deploy/channel-artifacts
# orderer1
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/*
# orderer2 (stesso comando ma con orderer2-*)
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer2-tls/keystore/*
# orderer3 (con orderer3-* e ca orgx)
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-?054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer3-tls/keystore/*
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/*
osnadmin channel list   --orderer-address localhost:7053   --ca-file  ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  "~/fabric-deploy/orderer1-tls/keystore/*"
ls /home/asantopadre/fabric-deploy/orderer1-tls/keystore
osnadmin channel list   --orderer-address localhost:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  /home/asantopadre/fabric-deploy/orderer1-tls/keystore/5a22b8c606d012f8e843a320d3ace8e602b786a1d21316c0e35e86535aff2975_sk
fabric-ca-client enroll   -u https://orderer-admin:ORDERER_ADMIN_PW@ca-orgdcms:7054   --enrollment.profile tls   --csr.hosts localhost   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgdcms/tls-cert.pem   -M /home/asantopadre/fabric-deploy/osnadmin-tls
find /home/asantopadre/fabric-deploy/ca-orgdcms -name "*pem"
ls /home/asantopadre/fabric-deploy/ca-orgdcms/tls/
find /home/asantopadre/fabric-deploy/ca-orgdcms -type f -name "*.pem"
find /home/asantopadre/fabric-deploy -maxdepth 3 -type d | grep ca
ls /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts
ls /home/asantopadre/fabric-deploy/osnadmin-tls/tls/keystore
find /home/asantopadre/fabric-deploy -type f -path "*osnadmin*" -name "*_sk"
find /home/asantopadre -type f -name "*_sk"
osnadmin channel list   --orderer-address localhost:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel list   --orderer-address localhost:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel list   --orderer-address localhost:7053   --tls-server-name orderer1.orgdcms.svc.cluster.local   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
sudo nano /etc/hosts
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
mkdir -p ~/fabric-deploy/channel-artifacts
mkdir -p ~/fabric-deploy/configtx
cd ~/fabric-deploy
export FABRIC_CFG_PATH=$HOME/fabric-deploy/configtx
export CHANNEL_NAME=mychannel
export CHANNEL_NAME=canale1
nano $FABRIC_CFG_PATH/configtx.yaml
configtxgen   -profile ApplicationChannel   -channelID $CHANNEL_NAME   -outputBlock ./channel-artifacts/${CHANNEL_NAME}.block
nano $FABRIC_CFG_PATH/configtx.yaml
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ./channel-artifacts/canale1.block
nano $FABRIC_CFG_PATH/configtx.yaml
Profiles:[A
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
git add .
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
ls /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts
ls /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts
ls /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts
ls /home/asantopadre/fabric-deploy/orderer3-tls/tlscacert
ls /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts
ls /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts
cp /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer2-tls-ca.pem
mkdir -p /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts
cp /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/*.pem    /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/
ls /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts
ls /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts
cp /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/*.pem    /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer2-tls-ca.pem
ls /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts
kubectl get pods -n orgx | grep orderer3
kubectl get deploy orderer3 -n orgx -o yaml | less
cp /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer3-tls-ca.pem
ls /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts
kubectl get pods -n orgdcms | grep orderer1
kubectl port-forward -n orgdcms pod/orderer1-865f456f94-xgxsg 7053:7053
kubectl port-forward -n orgdcms pod/orderer1-<id> 7053:7053 --address 0.0.0.0
kubectl port-forward -n orgdcms pod/orderer1-865f456f94-xgxsg 7053:7053 --address 0.0.0.0
kubectl port-forward -n orgdcms orderer2-65ccbf97b8-8sn9s 7053:7053
kubectl port-forward -n orgx orderer3-94679fcb9-b9grx 7053:7053
kubectl get pod -n orgx orderer3-94679fcb9-b9grx
kubectl exec -n orgx orderer3-94679fcb9-b9grx -- printenv | grep ADMIN
kubectl port-forward -n orgdcms pod/orderer1-865f456f94-xgxsg 7053:7053 --address 0.0.0.0
kubectl port-forward -n orgx orderer3-94679fcb9-b9grx 7053:7053
kubectl get pods -n orgx | grep orderer3
kubectl cp /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem orgx/orderer3-6669998894-bxx85:/var/hyperledger/orderer/tls/tlscacerts/orgdcms-tls-ca.pem
kubectl get deployment orderer3 -n orgx -o yaml | grep -A5 tlscacerts
cp /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/orgdcms-tls-ca.pem
/home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/orgdcms-tls-ca.pem
kubectl apply -f /home/asantopadre/orderer3-deployment.yaml -n orgx
kubectl get pods -n orgx | grep orderer3
kubectl logs -n orgx orderer3-75ccb58f68-dlvpr --previous
kubectl get pods -n orgx | grep orderer3
kubectl apply -f /home/asantopadre/orderer3-deployment.yaml -n orgx
kubectl get pods -n orgx | grep orderer3
kubectl port-forward -n orgx orderer3-6669998894-rknzr 7053:7053
kubectl port-forward -n orgdcms orderer2-65ccbf97b8-8sn9s 7053:7053
PS C:\Users\campus.uniurb.it> kubectl port-forward -n orgdcms svc/fabric-ca 7054:7054
Forwarding from 127.0.0.1:7054 -> 7054

PS C:\Users\campus.uniurb.it> kubectl port-forward -n orgx svc/fabric-ca 7054:7054
kubectl port-forward -n orgx svc/fabric-ca 7054:7054
kubectl port-forward -n orgdcms fabric-ca-b9848678-9k9b5 7054:7054
kubectl port-forward -n orgx fabric-ca-b9848678-9ncpc 8054:7054
ls /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts
mv /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer1-tls-ca.pem
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file  /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/orderer1-tls-ca.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer1-tls-ca.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
ls -l /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
code $FABRIC_CFG_PATH/configtx.yaml
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ./channel-artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
ls /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts
openssl x509 -in /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer1-tls-ca.pem -noout -text | grep "CA:"
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
openssl verify   -CAfile /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer1-tls-ca.pem   /home/asantopadre/fabric-deploy/orderer1-tls/signcerts/cert.pem
openssl verify   -CAfile /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer2-tls-ca.pem   /home/asantopadre/fabric-deploy/orderer2-tls/signcerts/cert.pem
openssl verify   -CAfile /home/asantopadre/fabric-deploy/orderer1-msp/tlscacerts/orderer3-tls-ca.pem   /home/asantopadre/fabric-deploy/orderer3-tls/signcerts/cert.pem
kubectl get pods -n orgdcms | grep orderer
kubectl get pods -n orgx    | grep orderer
kubectl exec -n orgdcms orderer1-865f456f94-xgxsg -- ls -la /var/hyperledger/orderer/msp
kubectl exec -n orgdcms orderer2-65ccbf97b8-8sn9s -- ls -la /var/hyperledger/orderer/msp
kubectl exec -n orgx orderer3-94679fcb9-b9grx -- ls -la /var/hyperledger/orderer/msp
ls -d /home/asantopadre/fabric-deploy/orderer-msps/orderer*-msp
mkdir -p /home/asantopadre/fabric-deploy/orderer-msps
kubectl cp -n orgdcms orderer1-865f456f94-xgxsg:/var/hyperledger/orderer/msp   /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp
kubectl cp -n orgdcms orderer2-65ccbf97b8-8sn9s:/var/hyperledger/orderer/msp   /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp
kubectl cp -n orgx orderer3-94679fcb9-b9grx:/var/hyperledger/orderer/msp   /home/asantopadre/fabric-deploy/orderer-msps/orderer3-msp
ls -d /home/asantopadre/fabric-deploy/orderer-msps/orderer*-msp
sha256sum /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp/signcerts/*.pem /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/signcerts/*.pem /home/asantopadre/fabric-deploy/orderer-msps/orderer3-msp/signcerts/*.pem
rm -rf /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/*
ls /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/ca-client
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --csr.hosts orderer2.orgdcms.svc.cluster.local   --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgdcms/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/ca-client
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --csr.hosts orderer2.orgdcms.svc.cluster.local   --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp   --tls.certfiles /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem
kubectl cp -n orgdcms fabric-ca-<pod>:/var/hyperledger/fabric-ca-server/tls-cert.pem /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem
fabric-ca-client enroll -u https://orderer2:orderer2pw@localhost:7054 --csr.hosts orderer2.orgdcms.svc.cluster.local --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem
kubectl get pods -n orgdcms | grep ca
kubectl cp -n orgdcms fabric-ca-b9848678-9k9b5:/var/hyperledger/fabric-ca-server/tls-cert.pem   /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- ls /var/hyperledger/fabric-ca-server
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- find / -name fabric-ca-server-config.yaml 2>/dev/null
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- grep -i certfile /etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 --
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- find /etc -name "*tls*.pem" 2>/dev/null
kubectl cp -n orgdcms fabric-ca-b9848678-9k9b5:/etc/hyperledger/fabric-ca-server/tls-cert.pem /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem
openssl x509 -in /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem -noout -subject
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --csr.hosts orderer2.orgdcms.svc.cluster.local   --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --csr.hosts orderer2.orgdcms.svc.cluster.local   --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgdcms-tls.pem
sha256sum /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp/signcerts/cert.pem /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/signcerts/cert.pem
kubectl get pods -n orgx | grep ca
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:8054   --csr.hosts orderer3.orgx.svc.cluster.local   --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer3-msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
kubectl exec -n orgx fabric-ca-b9848678-9ncpc -- find / -name fabric-ca-server-config.yaml 2>/dev/null
kubectl exec -n orgx fabric-ca-b9848678-9ncpc -- printenv | grep -i TLS
kubectl get pod fabric-ca-b9848678-9ncpc -n orgx -o jsonpath='{.spec.containers[0].command}'
kubectl get pod fabric-ca-b9848678-9ncpc -n orgx -o jsonpath='{.spec.containers[0].args}'
kubectl exec -n orgx fabric-ca-b9848678-9ncpc -- find / -name "*.pem" 2>/dev/null
kubectl cp -n orgx fabric-ca-b9848678-9ncpc:/etc/hyperledger/fabric-ca-server/tls-cert.pem /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
openssl x509 -in /home/asantopadre/fabric-deploy/ca-orgx-tls.pem -noout -subject
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:8054   --csr.hosts orderer3.orgx.svc.cluster.local   --mspdir /home/asantopadre/fabric-deploy/orderer-msps/orderer3-msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
sha256sum /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp/signcerts/cert.pem /home/asantopadre/fabric-deploy/orderer-msps/orderer3-msp/signcerts/cert.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
sudo nano /etc/hosts
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
openssl s_client -connect orderer2.orgdcms.svc.cluster.local:7053   -CAfile /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   -servername orderer2.orgdcms.svc.cluster.local
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
sudo nano /etc/hosts
getent hosts orderer3.orgx.svc.cluster.local
sudo nano /etc/hosts
getent hosts orderer3.orgx.svc.cluster.local
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
openssl x509 -in /home/asantopadre/fabric-deploy/orderer3-tls/signcerts/cert.pem -noout -issuer
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/ca-orgx-tls.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/ca-orgx-tls.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/ca-orgx-tls.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
openssl verify   -CAfile /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   /home/asantopadre/fabric-deploy/orderer3-tls/signcerts/cert.pem
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
openssl s_client -connect orderer3.orgx.svc.cluster.local:7053   -CAfile /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   -servername orderer3.orgx.svc.cluster.local
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
cp /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem    /home/asantopadre/fabric-deploy/osnadmin-ca-orgx.pem
openssl verify   -CAfile /home/asantopadre/fabric-deploy/osnadmin-ca-orgx.pem   /home/asantopadre/fabric-deploy/orderer3-tls/signcerts/cert.pem
curl --cacert /home/asantopadre/fabric-deploy/osnadmin-ca-orgx.pem      --cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem      --key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk      https://orderer3.orgx.svc.cluster.local:7053/participation/v1/channels
openssl x509 -in /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem -noout -issuer
kubectl cp /home/asantopadre/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem orgx/orderer3-94679fcb9-b9grx:/var/hyperledger/orderer/tls/tlscacerts/orgdcms-tls-ca.pem
kubectl rollout restart deployment orderer3 -n orgx
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-tls/msp/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin-tls/msp/keystore/c73b7eb510d72eb3cd50ca6f3f6c4dd71e5027342b822265d580debd50fe5845_sk
kubectl cp -n orgx fabric-ca-b9848678-9ncpc:/etc/hyperledger/fabric-ca-server/tls-cert.pem /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/osnadmin-orgx
fabric-ca-client enroll   -u https://osnadmin:osnadminpw@localhost:8054   --mspdir /home/asantopadre/osnadmin-orgx/msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
/home/asantopadre/ca-client-orgx/msp
kubectl port-forward -n orgx pod/fabric-ca-b9848678-9ncpc 8054:7054
kubectl port-forward -n orgdcms svc/ca-orgdcms 7054:7054
kubectl get svc -n orgdcms
kubectl port-forward -n orgdcms svc/fabric-ca 7054:7054
ls /home/asantopadre/ca-client-orgx/msp
ls /home/asantopadre/fabric-deploy/ca-client-orgx/msp
ls /home/asantopadre/fabric-deploy/ca-client-orgx/msp/signcerts
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/ca-client-orgx
fabric-ca-client register   --id.name osnadmin-orgx   --id.secret osnadminpw   --id.type admin   --id.attrs "hf.Registrar.Roles=*,hf.Registrar.Attributes=*"   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/ca-client-orgx
fabric-ca-client register   --id.name osnadmin-orgx   --id.secret osnadminpw   --id.type admin   --id.attrs "hf.Registrar.Roles=*,hf.Registrar.Attributes=*"   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/osnadmin-orgx
fabric-ca-client enroll   -u https://osnadmin-orgx:osnadminpw@localhost:8054   --mspdir /home/asantopadre/osnadmin-orgx/msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
fabric-ca-client register   --id.name osnadmin-orgx   --id.secret osnadminpw   --id.type admin   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
fabric-ca-client enroll   -u https://osnadmin-orgx:osnadminpw@localhost:8054   --mspdir /home/asantopadre/osnadmin-orgx/msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/ca-client-orgx
s $FABRIC_CA_CLIENT_HOME/msp/signcerts/cert.pem
ls $FABRIC_CA_CLIENT_HOME/msp/signcerts/cert.pem
fabric-ca-client register   --id.name osnadmin-orgx   --id.secret osnadminpw   --id.type admin   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/fabric-deploy/ca-client-orgx
fabric-ca-client register   -u https://localhost:8054   --id.name osnadmin-orgx   --id.secret osnadminpw   --id.type admin   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
osnadminpw
fabric-ca-client identity list   -u https://localhost:8054   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/osnadmin-orgx
fabric-ca-client enroll   -u https://osnadmin-orgx:osnadminpw@localhost:8054   --mspdir /home/asantopadre/osnadmin-orgx/msp   --tls.certfiles /home/asantopadre/fabric-deploy/ca-orgx-tls.pem
ls /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-orgx/msp/keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-orgx/msp/keystore/0f1a77915f27c6edab0bfca758f83eeac8f5d7cae73ba59b630c6a29419d08ce_sk
ls -lt /home/asantopadre/osnadmin-orgx/msp/keystore
openssl x509 -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem | openssl md5
openssl rsa -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/keystore/8d378ab639e855437ee57b3959c3693c40e2c31fb8c86ee76bad9479126ad2f7_sk | openssl md5
openssl rsa -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/keystore/09d6e71564d24db9e35328e69802ed4174b0607f52819fbbb7403da95d102cd5_sk | openssl md5
openssl rsa -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/keystore/ebb8433fe4427587e3fdd620a3ca0df3e7b2c026b456182aca3ac57d62300bcc_sk | openssl md5
openssl rsa -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/keystore/0f1a77915f27c6edab0bfca758f83eeac8f5d7cae73ba59b630c6a29419d08ce_sk | openssl md5
openssl x509 -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem | openssl md5
openssl rsa -noout -modulus   -in /home/asantopadre/osnadmin-orgx/msp/keystore/8d378ab639e855437ee57b3959c3693c40e2c31fb8c86ee76bad9479126ad2f7_sk | openssl md5
openssl x509 -noout -fingerprint -sha256   -in /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem
openssl pkey -in /home/asantopadre/osnadmin-orgx/msp/keystore/8d378ab639e855437ee57b3959c3693c40e2c31fb8c86ee76bad9479126ad2f7_sk   -pubout | openssl sha256
openssl x509 -in /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem   -pubkey -noout | openssl sha256
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-orgx/msp/keystore/8d378ab639e855437ee57b3959c3693c40e2c31fb8c86ee76bad9479126ad2f7_sk
sudo nano /etc/hosts
osnadmin channel join   --channelID canale1   --config-block ./channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/osnadmin-orgx/msp/signcerts/cert.pem   --client-key /home/asantopadre/osnadmin-orgx/msp/keystore/8d378ab639e855437ee57b3959c3693c40e2c31fb8c86ee76bad9479126ad2f7_sk
kubectl get pods -n orgdcms -o wide | egrep 'orderer1|orderer2'
kubectl get pods -n orgx -o wide | egrep 'orderer3'
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i leader
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i raft
kubectl logs -n orgdcms orderer2-65ccbf97b8-8sn9s | grep -i raft
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i raft
kubectl logs -n orgdcms orderer2-65ccbf97b8-8sn9s | grep -i raft
kubectl logs -n orgx orderer3-6669998894-rknzr | grep -i raft
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i raft
ubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i leader
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i etcdraft
kubectl logs -n orgx orderer3-6669998894-rknzr | grep -i etcdraft
kubectl logs -n orgdcms orderer1-865f456f94-xgxsg | grep -i etcdraft
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl logs -n orgx orderer3-6669998894-rknzr | grep -i etcdraft
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file <TLS-CA-orgDCMS.pem>   --client-cert <cert.pem>   --client-key <key.pem>
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file <TLS-CA-orgDCMS.pem>   --client-cert <cert.pem>   --client-key <key.pem>
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file /percorso/tls-ca-orgdcms.pem --client-cert /percorso/cert.pem --client-key /percorso/key.pem
ls ~/fabric-deploy/*tls*/tlscacerts
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/*_sk
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/202c55fb24dcd699201b0c8a35f5ed72971af73a4c7ebd9bbca97455187e28a0_sk
openssl x509 -in ~/fabric-deploy/orderer1-tls/signcerts/cert.pem -pubkey -noout | openssl sha256
ls -l ~/fabric-deploy/orderer1-tls/keystore
openssl x509 -in ~/fabric-deploy/orderer1-tls/signcerts/cert.pem -pubkey -noout | openssl sha256
openssl pkey -in ~/fabric-deploy/orderer1-tls/keystore/1fb9c9515b6030e2aa2792ec0f48cef22b1c4779469697b4c9a9c7e8b9beccbd_sk -pubout | openssl sha256
openssl pkey -in ~/fabric-deploy/orderer1-tls/keystore/202c55fb24dcd699201b0c8a35f5ed72971af73a4c7ebd9bbca97455187e28a0_sk -pubout | openssl sha256
openssl pkey -in ~/fabric-deploy/orderer1-tls/keystore/bada89dffa82c1c772548c82efea4b8b10c171b4c4042a21ae3e8629e9620d26_sk -pubout | openssl sha256
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/bada89dffa82c1c772548c82efea4b8b10c171b4c4042a21ae3e8629e9620d26_sk
openssl x509 -in ~/fabric-deploy/orderer1-tls/signcerts/cert.pem -noout -text | grep -A2 "Subject Alternative Name"
fabric-ca-client enroll   -u https://orderer1:orderer1pw@ca-orgdcms:7054   --enrollment.profile tls   --csr.hosts orderer1   --csr.hosts orderer1.orgdcms.svc.cluster.local   --tls.certfiles /etc/hyperledger/fabric-ca-server-config/ca-cert.pem   -M ~/fabric-deploy/orderer1-tls-new
ls ~/fabric-deploy/*ca*/*/ca-cert.pem
find ~ -name ca-cert.pem | grep ca
find ~/fabric-deploy -type f -name "*.pem"
fabric-ca-client enroll -u https://orderer1:orderer1pw@ca-orgdcms:7054 --enrollment.profile tls --csr.hosts orderer1 --csr.hosts orderer1.orgdcms.svc.cluster.local --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem -M ~/fabric-deploy/orderer1-tls-new
fabric-ca-client enroll -u https://orderer1:orderer1pw@localhost:7054 --enrollment.profile tls --csr.hosts orderer1 --csr.hosts orderer1.orgdcms.svc.cluster.local --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem -M ~/fabric-deploy/orderer1-tls-new
kubectl exec -n orgdcms deploy/fabric-ca -- fabric-ca-client identity list --id admin --secret <ADMIN_PW>
kubectl get deploy fabric-ca -n orgdcms -o yaml | grep ADMINPW
kubectl get deploy fabric-ca-pv -n orgdcms -o yaml | grep ADMIN
kubectl get pods -n orgdcms | grep ca
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- printenv | grep FABRIC_CA_SERVER_CA_ADMIN
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- cat /etc/hyperledger/fabric-ca-server-config/fabric-ca-server-config.yaml | grep -A3 "identities:"
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- find / -name fabric-ca-server-config.yaml 2>/dev/null
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- grep -A5 "identities:" /etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml
fabric-ca-client register -u https://admin:adminpw@localhost:7054 --id.name orderer1 --id.secret orderer1pw --id.type orderer
fabric-ca-client register   -u https://admin:adminpw@localhost:7054   --id.name orderer1   --id.secret orderer1pw   --id.type orderer   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem   -M ~/fabric-deploy/ca-admin
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-admin
fabric-ca-client register   --id.name orderer1   --id.secret orderer1pw   --id.type orderer   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054 --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem -M ~/fabric-deploy/ca-admin
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-admin
fabric-ca-client register   --id.name orderer1   --id.secret orderer1pw   --id.type orderer   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem
fabric-ca-client enroll   -u https://orderer1:orderer1pw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1   --csr.hosts orderer1.orgdcms.svc.cluster.local   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem   -M ~/fabric-deploy/orderer1-tls-new
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- fabric-ca-client identity list --id admin --secret adminpw
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-admin
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- fabric-ca-client identity list
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- fabric-ca-client identity list --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms fabric-ca-b9848678-9k9b5 -- fabric-ca-client identity list -u https://admin:adminpw@localhost:7054 --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
fabric-ca-client enroll   -u https://orderer1-tls-v2:<SECRET_CORRETTO>@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1   --csr.hosts orderer1.orgdcms.svc.cluster.local   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem   -M ~/fabric-deploy/orderer1-tls-tmp
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/ca-admin
fabric-ca-client register   --id.name orderer1-tls   --id.secret orderer1tlspw   --id.type orderer   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem
fabric-ca-client enroll   -u https://orderer1-tls:orderer1tlspw@localhost:7054   --enrollment.profile tls   --csr.hosts orderer1   --csr.hosts orderer1.orgdcms.svc.cluster.local   --tls.certfiles ~/fabric-deploy/ca-orgdcms-tls.pem   -M ~/fabric-deploy/orderer1-tls-new
openssl x509 -in ~/fabric-deploy/orderer1-tls-new/signcerts/cert.pem -noout -text | grep -A2 "Subject Alternative Name"
mv ~/fabric-deploy/orderer1-tls ~/fabric-deploy/orderer1-tls.old
mv ~/fabric-deploy/orderer1-tls-new ~/fabric-deploy/orderer1-tls
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms | grep orderer1
kubectl logs -n orgdcms orderer1-f4876df6d-sk9vk
ls ~/fabric-deploy/orderer1-tls/keystore
kubectl edit deploy orderer1 -n orgdcms
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms | grep orderer1
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/ca-orgdcms-tls.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
kubectl exec -n orgdcms orderer1-54c59c8798-w8wcl -- ls /var/hyperledger/orderer/tls/signcerts
kubectl exec -n orgdcms orderer1-54c59c8798-w8wcl -- openssl x509 -in /var/hyperledger/orderer/tls/signcerts/cert.pem -noout -text | grep -A2 "Subject Alternative Name"
kubectl exec -n orgdcms orderer1-54c59c8798-w8wcl -- strings /var/hyperledger/orderer/tls/signcerts/cert.pem | grep org
kubectl cp orgdcms/orderer1-54c59c8798-w8wcl:/var/hyperledger/orderer/tls/signcerts/cert.pem /tmp/orderer1-mounted-cert.pem
openssl x509 -in /tmp/orderer1-mounted-cert.pem -noout -text | grep -A2 "Subject Alternative Name"
export OSNADMIN_TLS_CA_FILE=~/fabric-deploy/ca-orgdcms-tls.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file $OSNADMIN_TLS_CA_FILE   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
kubectl get svc orderer1 -n orgdcms -o yaml
kubectl get endpoints orderer1 -n orgdcms -o yaml
env | grep -i orderer
env | grep -i osn
kubectl describe deploy orderer1 -n orgdcms | grep -A5 -i tls
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/ca-orgdcms-tls.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/fabric-deploy/ca-orgdcms-tls.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --override-address localhost   --ca-file ~/fabric-deploy/ca-orgdcms-tls.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address localhost:7053   --override-addr orderer1.orgdcms.svc.cluster.local   --ca-file ~/fabric-deploy/ca-orgdcms-tls.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
sudo sh -c 'echo "127.0.0.1 orderer1.orgdcms.svc.cluster.local" >> /etc/hosts'
Maurizio
sudo sh -c 'echo "127.0.0.1 orderer1.orgdcms.svc.cluster.local" >> /etc/hosts'
Maurizio
sudo sh -c 'echo "127.0.0.1 orderer1.orgdcms.svc.cluster.local" >> /etc/hosts'
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/ca-orgdcms-tls.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
kubectl get pods -n orgdcms | grep orderer2
kubectl get pods -n orgdcms
kubectl scale deploy orderer2 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
kubectl get pods -n orgx | grep orderer3
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
kubectl port-forward -n orgx orderer3-6669998894-rknzr 7053:7053
ps aux | grep port-forward
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 8053:7053
kubectl port-forward -n orgdcms svc/orderer2 7053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
configtxgen -profile Canale1 -channelID canale1 -outputBlock canale1.block
cd fabric-deploy
configtxgen -profile Canale1 -channelID canale1 -outputBlock canale1.block
ls ~/fabric-samples/bin
export PATH=$PATH:~/fabric-samples/bin
configtxgen -profile Canale1 -channelID canale1 -outputBlock canale1.block
configtxgen   -profile Canale1   -channelID canale1   -outputBlock ./channel-artifacts/canale1.block
cd ~/fabric-deploy/configtx
export FABRIC_CFG_PATH=$(pwd)
configtxgen -profile Canale1 -channelID canale1 -outputBlock ./channel-artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel join   --channelID canale1   --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel join   --channelID canale1   --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
kubectl scale deploy orderer3 -n orgx --replicas=0
rm -rf ~/fabric-deploy/orderer3-data/*
kubectl scale deploy orderer3 -n orgx --replicas=1
kubectl port-forward -n orgx svc/orderer3 7053:7053
osnadmin channel list --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl logs -n orgx deploy/orderer3 | grep -i leader
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl logs -n orgx deploy/orderer3 | grep -i leader
kubectl scale deploy orderer1 -n orgdcms --replicas=0
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl logs -n orgx deploy/orderer3 | grep -i leader
kubectl scale deploy orderer1 -n orgdcms --replicas=1
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl logs -n orgx deploy/orderer3 | grep -i leader
kubectl scale deploy orderer2 -n orgdcms --replicas=1
kubectl logs -n orgx deploy/orderer3 | grep -i leader
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl scale deploy orderer2 -n orgdcms --replicas=1
kubectl logs -n orgx deploy/orderer3 | grep -i raft
kubectl logs -n orgx deploy/orderer3 | grep -i "leader"
kubectl scale deploy orderer1 -n orgdcms --replicas=0
osnadmin channel list --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
kubectl scale deploy orderer1 -n orgdcms --replicas=1
osnadmin channel list --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
kubectl scale deploy orderer1 -n orgdcms --replicas=1
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
kubectl get pods -n orgdcms
kubectl get pods -n orgx
kubectl logs -n orgdcms deploy/orderer1 | grep -i etcdraft
kubectl logs -n orgdcms deploy/orderer2 | grep -i etcdraft
kubectl logs -n orgx deploy/orderer3 | grep -i etcdraft
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/orderer2 8053:7053
kubectl port-forward -n orgx svc/orderer3 9053:7053
kubectl port-forward -n orgx svc/orderer3 7053:7053
kubectl port-forward -n orgx svc/orderer3 9053:7053
kubectl port-forward -n orgdcms svc/orderer1 7053:7053
kubectl scale deploy orderer2 -n orgdcms --replicas=1
sleep 10
kubectl port-forward -n orgdcms svc/orderer2 8053:7053
kubectl scale deploy orderer3 -n orgx --replicas=1
sleep 10
kubectl port-forward -n orgx svc/orderer3 9053:7053
kubectl get pods -n orgdcms
kubectl get pods -n orgx
osnadmin channel list --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
osnadmin channel list --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
kubectl logs -n orgdcms deploy/orderer1 | grep -i etcdraft
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/*_sk7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/sk7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/sk7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:9053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:9053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:9053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgx
kubectl get pods -n orgdcms
kubectl rollout restart deploy/orderer3 -n orgx
kubectl get pods -n orgx
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:9053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
kubectl get pods -n orgdcms
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:9053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
kubectl logs -n orgdcms deploy/orderer1 | grep -i raft
kubectl logs -n orgx deploy/orderer3 | grep -i raft
kubectl get pods -n orgdcmscomandi
kubectl scale deploy orderer1 -n orgdcms --replicas=0
kubectl scale deploy orderer2 -n orgdcms --replicas=0
kubectl scale deploy orderer3 -n orgx --replicas=0
kubectl get pods -n orgdcms
kubectl get pods -n orgx
ls ~/fabric-deploy/orderer1-data/
ls ~/fabric-deploy/orderer2-data/
ls ~/fabric-deploy/orderer3-data/
kubectl describe deploy orderer1 -n orgdcms | grep -i FILELEDGER -A2
kubectl describe deploy orderer1 -n orgdcms | grep -i production -A2
kubectl describe deploy orderer1 -n orgdcms | grep -i FILELEDGER -A2
kubectl describe deploy orderer1 -n orgdcms | grep -i production -A2
kubectl describe deploy orderer1 -n orgdcms | grep -A5 Mounts
kubectl scale deploy orderer1 -n orgdcms --replicas=1
sleep 10
kubectl get pods -n orgdcms
osnadmin channel join --channelID canale1 --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block --orderer-address orderer1.orgdcms.svc.cluster.local:7053 --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel join --channelID canale1 --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block --orderer-address orderer2.orgdcms.svc.cluster.local:8053 --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
kubectl port-forward -n orgx svc/orderer3 9053:7053
osnadmin channel join --channelID canale1 --config-block ~/fabric-deploy/configtx/channel-artifacts/canale1.block --orderer-address orderer3.orgx.svc.cluster.local:9053 --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:9053   --ca-file ~/fabric-deploy/orderer3-tls/tlscacerts/tls-localhost-8054.pem   --client-cert ~/fabric-deploy/orderer3-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer3-tls/keystore/40e258b3d7d383188dca26a08010ee89603ffd14c99e63f23fcb0d18d7a27042_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:8053   --ca-file ~/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer2-tls/keystore/7d54c7090da8245c90cf1ecd6d13c2dfc80c21f57b1fd93f8f253b7a66016791_sk
osnadmin channel info   --channelID canale1   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin --help
kubectl get pods -n orgx
osnadmin channel info   --channelID canale1   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key ~/fabric-deploy/orderer1-tls/keystore/db7bdec2a276b3cefa6960866cbf639dbaf92ad40aed6e46a10c8dfeed40ce85_sk
find /home/asantopadre/fabric-deploy -maxdepth 3 -type d | grep ca
sudo nano /etc/hosts
