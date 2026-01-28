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
kubectl get nodes
kubectl get ns
# 0.2 Inventario risorse Fabric
kubectl get all -A | grep -i fabric
kubectl get pvc -A
# 0.3 Export YAML applicati
kubectl get deploy,sts,svc,cm,secret -A -o yaml > fabric-cluster-freeze.yaml
# 0.2 Inventario risorse Fabric
kubectl get all -A | grep -i fabric
kubectl get pvc -A
# 0.4 Backup PVC (elenco)
kubectl get pvc -A > pvc-list.txt
# 0.5 Tag repository
git status
git tag pre-tabula-rasa-fabric-2.5
git push origin pre-tabula-rasa-fabric-2.5
git diff --stat
git restore .
git status
mkdir -p freeze-untracked
mv fabric-cluster-freeze.yaml pvc-list.txt freeze-untracked/
mv k8s/orgdcms/osnadmin freeze-untracked/
mv orderer-admin-ca.pem orderer1-admin-ca.pem tls-ca-orgdcms.pem freeze-untracked/
git status
mv k8s/orgdcms/ca/fabric-ca-deploy.yaml freeze-untracked/
mv k8s/orgx/orderer/inspect-orderer3-msp.yaml freeze-untracked/
git status
git tag pre-tabula-rasa-fabric-2.5
git show pre-tabula-rasa-fabric-2.5 --no-patch
kubectl get pvc -A
kubectl get pvc -A -o wide
kubectl run backup-ca-orgdcms   -n orgdcms   --image=busybox   --restart=Never   --overrides='{
    "spec":{
      "containers":[{
        "name":"b",
        "image":"busybox",
        "command":["sh","-c","tar czf /out/orgdcms-ca.tgz -C /data . && sleep 5"],
        "volumeMounts":[
          {"name":"data","mountPath":"/data"},
          {"name":"out","mountPath":"/out"}
        ]
      }],
      "volumes":[
        {"name":"data","persistentVolumeClaim":{"claimName":"fabric-ca-pvc"}},
        {"name":"out","hostPath":{"path":"/home/asantopadre/backup","type":"Directory"}}
      ]
    }
  }'
kubectl get pod backup-ca-orgdcms -n orgdcms
kubectl delete ns orgdcms orgx
kubectl get ns
kubectl create ns orgdcms
mkdir -p ~/archive-fabric-pre-tabula && mv ~/fabric-* ~/k8s ~/osnadmin* ~/snapshot* ~/freeze-* ~/archive-fabric-pre-tabula/ 2>/dev/null
ls -la ~
mkdir -p ~/legacy && mv canale1.block ca-tls.pem tlsca-root.pem orderer*.yaml kubectl 7054 ~/legacy/
ls ~/artifacts ~/runtime 2>/dev/null
mv ~/artifacts ~/runtime ~/legacy/
ls
mkdir -p ~/fabric-2.5/{artifacts,runtime}
kubectl get all -n orgdcms
kubectl get pvc -n orgdcms
kubectl apply -f fabric-tls-ca.yaml
kubectl apply -f ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl get pods -n orgdcms
kubectl describe pod fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms
kubectl describe pod fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms
kubectl describe pod fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms
kubectl describe pod fabric-tls-ca-7b859988c9-m2pvq -n orgdcms | tail -n +1
kubectl get pods -n orgdcms -w
kubectl describe pod fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms -w
kubectl logs fabric-tls-ca-7b859988c9-m2pvq -n orgdcms | tail -n 20
openssl s_client -connect localhost:7054 -showcerts </dev/null | openssl x509 -noout -subject -issuer -ext subjectAltName
openssl x509 -in ~/fabric-2.5/artifacts/tls-ca-cert.pem -noout -subject -issuer -fingerprint -sha256
kubectl exec -n orgdcms deploy/fabric-tls-ca -- ls /etc/hyperledger/fabric-ca-server
kubectl exec -n orgdcms deploy/fabric-tls-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > ~/fabric-2.5/artifacts/tls-ca-cert.pem
ls -l ~/fabric-2.5/artifacts/tls-ca-cert.pem
openssl x509 -in ~/fabric-2.5/artifacts/tls-ca-cert.pem -noout -subject -issuer -fingerprint
kubectl apply -f ~/fabric-2.5/artifacts/fabric-ca-orgdcms.yaml
kubectl get pods -n orgdcms
kubectl logs deploy/fabric-ca-orgdcms -n orgdcms
kubectl -n orgdcms patch deployment fabric-ca-orgdcms --type='json' -p='[
  {"op":"replace","path":"/spec/template/spec/containers/0/args","value":["sh","-c","fabric-ca-server start -b boot:bootpw --cfg.affiliations.allowremove=true"]},
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_CFG_IDENTITIES_ALLOWREMOVE","value":"true"}}
]'
kubectl get pods -n orgdcms
kubectl get deployment fabric-ca-orgdcms -n orgdcms -o yaml | grep -A5 FABRIC_CA_SERVER_CFG_IDENTITIES_ALLOWREMOVE
fabric-ca-client register   --url https://localhost:7055   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles ~/fabric-2.5/artifacts/tls-ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client register     --url https://localhost:7054     --id.name orgdcms-admin     --id.secret orgdcms-adminpw     --id.type admin     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client enroll     -u https://boot:bootpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client register     --url https://localhost:7054     --id.name orgdcms-admin     --id.secret orgdcms-adminpw     --id.type admin     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client enroll     -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem     -M /etc/hyperledger/fabric-ca-server/orgdcms-admin-msp
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   ls /etc/hyperledger/fabric-ca-server/orgdcms-admin-msp
kubectl create ns orgx
kubectl apply -f ~/fabric-2.5/artifacts/fabric-ca-orgx.yaml
kubectl get pods -n orgx
kubectl exec -n orgx deploy/fabric-ca-orgx --   fabric-ca-client enroll     -u https://boot:bootpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgx deploy/fabric-ca-orgx --   fabric-ca-client register     --url https://localhost:7054     --id.name orgx-admin     --id.secret orgx-adminpw     --id.type admin     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgx deploy/fabric-ca-orgx --   fabric-ca-client enroll     -u https://orgx-admin:orgx-adminpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem     -M /etc/hyperledger/fabric-ca-server/orgx-admin-msp
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client register     --url https://localhost:7054     --id.name orderer1     --id.secret orderer1pw     --id.type orderer     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client enroll     -u https://orderer1:orderer1pw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem     -M /etc/hyperledger/fabric-ca-server/orderer1-msp
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client enroll     -u https://orderer1:orderer1pw@localhost:7054     --enrollment.profile tls     --csr.hosts orderer1,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem     -M /etc/hyperledger/fabric-ca-server/orderer1-tls
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client enroll     -u https://orderer1:orderer1pw@localhost:7054     --enrollment.profile tls     --csr.hosts orderer1,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem     -M /etc/hyperledger/fabric-ca-server/orderer1-tls
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client register     --url https://localhost:7054     --id.name orderer1     --id.secret orderer1pw     --id.type orderer     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client enroll     -u https://boot:bootpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl get pods -n orgx
kubectl delete deploy fabric-tls-ca -n orgdcms
kubectl delete svc fabric-tls-ca -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/fabric-ca-orgx.yaml
grep -n "fabric-ca-server start" ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
grep -n FABRIC_CA_SERVER_CFG_IDENTITIES_ALLOWREMOVE ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl port-forward -n orgdcms svc/fabric-tls-ca 7054:7054
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7055:7054
kubectl apply -f ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl delete pvc fabric-tls-ca-pvc -n orgdcms
kubectl get pods -n orgx
kubectl get pvc -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl get pvc fabric-tls-ca-pvc -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl get pvc fabric-tls-ca-pvc -n orgdcms
kubectl patch pvc fabric-tls-ca-pvc -n orgdcms -p '{"metadata":{"finalizers":null}}'
kubectl get pvc fabric-tls-ca-pvc -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl get pvc fabric-tls-ca-pvc -n orgdcms
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client enroll     -u https://boot:bootpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl get pods -n orgdcms
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client enroll     -u https://boot:bootpw@localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
         fabric-ca-client enroll \
           -u https://boot:bootpw@localhost:7054 \
           --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem'
kubectl delete deploy fabric-tls-ca -n orgdcms
kubectl delete svc fabric-tls-ca -n orgdcms
kubectl delete pvc fabric-tls-ca-pvc -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/fabric-tls-ca.yaml
kubectl get pods -n orgdcms
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
         fabric-ca-client enroll \
           -u https://boot:bootpw@localhost:7054 \
           --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client register     --url https://localhost:7054     --id.name orderer1     --id.secret orderer1pw     --id.type orderer     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client enroll     -u https://orderer1:orderer1pw@localhost:7054     --enrollment.profile tls     --csr.hosts orderer1,orderer1.orgdcms.svc,orderer1.orgdcms.svc.cluster.local,localhost     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem     -M /etc/hyperledger/fabric-ca-server/orderer1-tls
kubectl exec -n orgdcms deploy/fabric-tls-ca --   ls /etc/hyperledger/fabric-ca-server/orderer1-tls
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
kubectl get pvc -n orgdcms | grep orderer1
kubectl apply -f ~/fabric-2.5/artifacts/orderer1-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer1
kubectl get pvc -n orgdcms
kubectl get storageclass
kubectl apply -f job-bind-orderer1-pvc.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-bind-orderer1-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer1
kubectl apply -f job-copy-orderer1.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer1.yaml
kubectl logs -n orgdcms job/copy-orderer1-msp-tls
kubectl exec -n orgdcms job/bind-orderer1-pvc --   ls /var/hyperledger/orderer/msp
kubectl exec -n orgdcms job/bind-orderer1-pvc --   ls /var/hyperledger/orderer/msp
kubectl run inspect-orderer1   -n orgdcms   --image=busybox   --restart=Never   --command -- sleep 300
kubectl patch pod inspect-orderer1 -n orgdcms --type=json -p='[
  {"op":"add","path":"/spec/volumes","value":[
    {"name":"msp","persistentVolumeClaim":{"claimName":"orderer1-msp-pvc"}},
    {"name":"tls","persistentVolumeClaim":{"claimName":"orderer1-tls-pvc"}}
  ]},
  {"op":"add","path":"/spec/containers/0/volumeMounts","value":[
    {"name":"msp","mountPath":"/var/hyperledger/orderer/msp"},
    {"name":"tls","mountPath":"/var/hyperledger/orderer/tls"}
  ]}
]'
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/msp
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/tls
kubectl delete pod inspect-orderer1 -n orgdcms --ignore-not-found
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
      command: ["sh", "-c", "sleep 600"]
      volumeMounts:
        - name: msp
          mountPath: /var/hyperledger/orderer/msp
        - name: tls
          mountPath: /var/hyperledger/orderer/tls
  volumes:
    - name: msp
      persistentVolumeClaim:
        claimName: orderer1-msp-pvc
    - name: tls
      persistentVolumeClaim:
        claimName: orderer1-tls-pvc
EOF

kubectl get pod -n orgdcms inspect-orderer1
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/msp
kubectl delete job -n orgdcms copy-orderer1-msp-tls --ignore-not-found
kubectl delete pod inspect-orderer1 -n orgdcms --ignore-not-found
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: batch/v1
kind: Job
metadata:
  name: clean-orderer1-pvc
spec:
  backoffLimit: 0
  template:
    spec:
      restartPolicy: Never
      containers:
        - name: clean
          image: busybox
          command: ["sh", "-c", "rm -rf /msp/* /tls/*"]
          volumeMounts:
            - name: msp
              mountPath: /msp
            - name: tls
              mountPath: /tls
      volumes:
        - name: msp
          persistentVolumeClaim:
            claimName: orderer1-msp-pvc
        - name: tls
          persistentVolumeClaim:
            claimName: orderer1-tls-pvc
EOF

kubectl logs -n orgdcms job/clean-orderer1-pvc
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
      command: ["sh", "-c", "sleep 300"]
      volumeMounts:
        - name: msp
          mountPath: /var/hyperledger/orderer/msp
        - name: tls
          mountPath: /var/hyperledger/orderer/tls
  volumes:
    - name: msp
      persistentVolumeClaim:
        claimName: orderer1-msp-pvc
    - name: tls
      persistentVolumeClaim:
        claimName: orderer1-tls-pvc
EOF

kubectl exec -n orgdcms inspect-orderer1 -- ls -A /var/hyperledger/orderer/msp
kubectl exec -n orgdcms inspect-orderer1 -- ls -A /var/hyperledger/orderer/tls
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer1-correct.yaml
kubectl logs -n orgdcms job/copy-orderer1-msp-tls-correct
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/msp
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/tls
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/msp
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/tls
kubectl apply -f ~/fabric-2.5/artifacts/orderer1.yaml
kubectl get pod -n orgdcms | grep orderer1
kubectl logs -n orgdcms orderer1-68897ff6c9-cpgbz
kubectl exec -n orgdcms inspect-orderer1 -- ls /var/hyperledger/orderer/msp
kubectl get pod -n orgdcms | grep orderer1
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer1-live
spec:
  restartPolicy: Never
  containers:
    - name: inspect
      image: busybox
      command: ["sh", "-c", "sleep 600"]
      volumeMounts:
        - name: msp
          mountPath: /var/hyperledger/orderer/msp
  volumes:
    - name: msp
      persistentVolumeClaim:
        claimName: orderer1-msp-pvc
EOF

kubectl exec -n orgdcms inspect-orderer1-live --   ls /var/hyperledger/orderer/msp/cacerts
kubectl exec -n orgdcms inspect-orderer1-live -- sh -c 'cat > /var/hyperledger/orderer/msp/config.yaml <<EOF
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
EOF'
kubectl get pod -n orgdcms | grep orderer1
kubectl delete pod -n orgdcms -l app=orderer1
kubectl get pod -n orgdcms | grep orderer1
kubectl logs -n orgdcms orderer1-68897ff6c9-7d98s
kubectl exec -n orgdcms inspect-orderer1-live --   ls /var/hyperledger/orderer/tls/keystore
kubectl exec -n orgdcms deploy/fabric-tls-ca --   ls /etc/hyperledger/fabric-ca-server
kubectl delete pod inspect-orderer1-live -n orgdcms --ignore-not-found
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: batch/v1
kind: Job
metadata:
  name: clean-orderer1-tls-pvc-again
spec:
  backoffLimit: 0
  template:
    spec:
      restartPolicy: Never
      containers:
        - name: clean
          image: busybox
          command: ["sh", "-c", "rm -rf /tls/*"]
          volumeMounts:
            - name: tls
              mountPath: /tls
      volumes:
        - name: tls
          persistentVolumeClaim:
            claimName: orderer1-tls-pvc
EOF

kubectl get pod -n orgdcms | grep orderer1
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: batch/v1
kind: Job
metadata:
  name: copy-orderer1-tls-correct
spec:
  backoffLimit: 0
  template:
    spec:
      restartPolicy: Never
      containers:
        - name: copy
          image: busybox
          command:
            - sh
            - -c
            - |
              set -e
              cp -r /src/orderer1-tls/* /dst/
              echo OK
          volumeMounts:
            - name: src
              mountPath: /src
            - name: dst
              mountPath: /dst
      volumes:
        - name: src
          persistentVolumeClaim:
            claimName: fabric-tls-ca-pvc
        - name: dst
          persistentVolumeClaim:
            claimName: orderer1-tls-pvc
EOF

kubectl logs -n orgdcms job/copy-orderer1-tls-correct
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: inspect-orderer1-tls
spec:
  restartPolicy: Never
  containers:
    - name: inspect
      image: busybox
      command: ["sh", "-c", "sleep 300"]
      volumeMounts:
        - name: tls
          mountPath: /var/hyperledger/orderer/tls
  volumes:
    - name: tls
      persistentVolumeClaim:
        claimName: orderer1-tls-pvc
EOF

kubectl exec -n orgdcms inspect-orderer1-tls -- ls /var/hyperledger/orderer/tls
kubectl exec -n orgdcms inspect-orderer1-tls -- sh -c '
cd /var/hyperledger/orderer/tls/keystore &&
ls *_sk &&
ln -sf $(ls *_sk) key.pem
'
kubectl exec -n orgdcms inspect-orderer1-tls -- ls /var/hyperledger/orderer/tls/keystore
kubectl delete pod -n orgdcms -l app=orderer1
kubectl get pod -n orgdcms | grep orderer1
kubectl logs -n orgdcms orderer1-68897ff6c9-7d98s
kubectl logs -n orgdcms orderer1-68897ff6c9-zc8dk
kubectl exec -n orgdcms inspect-orderer1-tls --   ls /var/hyperledger/orderer/tls/tlscacerts
kubectl apply -n orgdcms -f - <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: read-orderer1-pvcs
spec:
  restartPolicy: Never
  containers:
    - name: r
      image: busybox
      command: ["sh","-c","sleep 900"]
      volumeMounts:
        - name: msp
          mountPath: /mnt/msp
        - name: tls
          mountPath: /mnt/tls
        - name: ledger
          mountPath: /mnt/ledger
  volumes:
    - name: msp
      persistentVolumeClaim:
        claimName: orderer1-msp-pvc
    - name: tls
      persistentVolumeClaim:
        claimName: orderer1-tls-pvc
    - name: ledger
      persistentVolumeClaim:
        claimName: orderer1-ledger-pvc
EOF

kubectl exec -n orgdcms read-orderer1-pvcs -- sh -c '
echo "MSP root:"; ls -A /mnt/msp;
echo "MSP cacerts:"; ls -A /mnt/msp/cacerts;
echo "MSP signcerts:"; ls -A /mnt/msp/signcerts;
echo "MSP keystore:"; ls -A /mnt/msp/keystore;
'
kubectl exec -n orgdcms read-orderer1-pvcs -- sh -c '
echo "TLS root:"; ls -A /mnt/tls;
echo "TLS tlscacerts:"; ls -A /mnt/tls/tlscacerts;
echo "TLS signcerts:"; ls -A /mnt/tls/signcerts;
echo "TLS keystore:"; ls -A /mnt/tls/keystore;
'
kubectl exec -n orgdcms read-orderer1-pvcs -- sh -c '
echo "EXPECT TLS cert:"; ls -l /mnt/tls/signcerts/cert.pem;
echo "EXPECT TLS key target:"; ls -l /mnt/tls/keystore/key.pem || true;
echo "EXPECT TLS root target:"; ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem || true;
'
kubectl exec -n orgdcms read-orderer1-pvcs -- sh -c '
cd /mnt/tls/tlscacerts &&
ln -s tls-localhost-7054.pem tls-ca-cert.pem &&
ls -l
'
kubectl exec -n orgdcms read-orderer1-pvcs --   ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem
kubectl rollout restart deployment/orderer1 -n orgdcms
kubectl logs -n orgdcms deploy/orderer1 --tail=30
kubectl exec -n orgdcms deploy/orderer1 --   osnadmin channel list     --orderer-address localhost:7053     --ca-file /var/hyperledger/orderer/tls/tlscacerts/tls-ca-cert.pem     --client-cert /var/hyperledger/orderer/tls/signcerts/cert.pem     --client-key /var/hyperledger/orderer/tls/keystore/key.pem
kubectl get pods
kubectl get pods -n fabric-tools
kubectl get pods 
kubectl get pods kube-system
kubectl get pods -n kube-system
kubectl get pods -A -o=jsonpath='{range .items[*]}{.metadata.name}{" -> "}{.spec.containers[*].image}{"\n"}{end}'
kubectl logs -n orgdcms deploy/orderer1 | grep "Version:"
kubectl logs -n orgdcms deploy/fabric-ca-orgdcms | head -n 5
kubectl logs -n orgdcms deploy/fabric-tls-ca | grep "Server Version"
kubectl logs -n orgdcms deploy/orderer1 | grep "Admin.ListenAddress"
kubectl delete pod -n fabric-tools ca-client fabric-tools --force --grace-period=0
kubectl get pods -n fabric-tools
kubectl delete namespace fabric-tools
kubectl create namespace fabric-tools
kubectl apply -f fabric-tools.yaml
kubectl apply -f ~fabric-2.5/fabric-tools.yaml
kubectl apply -f ~/fabric-2.5/fabric-tools.yaml 
kubectl get pods -n fabric-tools
which osnadmin
osnadmin version
ls ~/fabric-samples/bin/osnadmin
~/fabric-samples/bin/osnadmin version
~/fabric-samples/bin/osnadmin help
~/fabric-samples/bin/osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/fabric-2.5/artifacts/tls-ca-cert.pem   --client-cert ~/fabric-2.5/runtime/orderer1/tls/signcerts/cert.pem   --client-key  ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
ls -R ~/fabric-2.5 | grep -n "orderer1"
kubectl cp -n orgdcms   $(kubectl get pod -n orgdcms -l app=orderer1 -o jsonpath='{.items[0].metadata.name}'):/var/hyperledger/orderer/tls   ~/fabric-2.5/runtime/orderer1/tls
ls ~/fabric-2.5/runtime/orderer1/tls/signcerts/cert.pem
ls ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
ls ~/fabric-2.5/runtime/orderer1/tls/tlscacerts/tls-ca-cert.pem
kubectl exec -n orgdcms deploy/orderer1 --   tar cf - /var/hyperledger/orderer/tls | tar xf - -C ~/fabric-2.5/runtime/orderer1
ls -l ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
ls -l ~/fabric-2.5/runtime/orderer1/tls/tlscacerts/tls-ca-cert.pem
mkdir -p ~/fabric-2.5/runtime/orderer1
mv ~/fabric-2.5/runtime/orderer1/var/hyperledger/orderer/tls    ~/fabric-2.5/runtime/orderer1/
rm -rf ~/fabric-2.5/runtime/orderer1/var
ls -l ~/fabric-2.5/runtime/orderer1/var/hyperledger/orderer/tls/keystore/key.pem
ls -l ~/fabric-2.5/runtime/orderer1/var/hyperledger/orderer/tls/tlscacerts/tls-ca-cert.pem
ls -l ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
ls -l ~/fabric-2.5/runtime/orderer1/tls/tlscacerts/tls-ca-cert.pem
kubectl exec -n orgdcms deploy/orderer1 -- tar cf - /var/hyperledger/orderer/tls | tar xf - -C ~/fabric-2.5/runtime/orderer1
mkdir -p ~/fabric-2.5/runtime/orderer1
mv ~/fabric-2.5/runtime/orderer1/var/hyperledger/orderer/tls    ~/fabric-2.5/runtime/orderer1/
rm -rf ~/fabric-2.5/runtime/orderer1/var
ls -l ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
ls -l ~/fabric-2.5/runtime/orderer1/tls/tlscacerts/tls-ca-cert.pem
~/fabric-samples/bin/osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/fabric-2.5/runtime/orderer1/tls/tlscacerts/tls-ca-cert.pem   --client-cert ~/fabric-2.5/runtime/orderer1/tls/signcerts/cert.pem   --client-key  ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
~/fabric-samples/bin/osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/fabric-2.5/runtime/orderer1/tls/tlscacerts/tls-ca-cert.pem   --client-cert ~/fabric-2.5/runtime/orderer1/tls/signcerts/cert.pem   --client-key  ~/fabric-2.5/runtime/orderer1/tls/keystore/key.pem
kubectl apply -f ~/fabric-2.5/artifacts/orderer2-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer2
kubectl apply -f ~/fabric-2.5/artifacts/orderer2-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer2
kubectl get pvc -n orgx | grep orderer2
kubectl get pvc -n orgdcms | grep orderer2
kubectl delete pvc -n orgx | grep orderer2
kubectl delete pvc -n orgx 
kubectl get pvc -n orgdcms | grep orderer2
kubectl delete pvc -n orgx orderer2-ledger-pvc orderer2-msp-pvc orderer2-tls-pvc
kubectl get pvc -n orgx | grep orderer2
con kubectl exec -n orgdcms deploy/fabric-ca-orgdcms -- \ fabric-ca-client register \ --url https://localhost:7054 \ --id.name orderer2 \ --id.secret orderer2pw \ --id.type orderer \ --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms -- \ fabric-ca-client register \ --url https://localhost:7054 \ --id.name orderer2 \ --id.secret orderer2pw \ --id.type orderer \ --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client register \
    --url https://localhost:7054 \
    --id.name orderer2 \
    --id.secret orderer2pw \
    --id.type orderer \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem'
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms -- env | grep HOME
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer2:orderer2pw@localhost:7054 \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer2-msp'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client register \
    --id.name orderer2 \
    --id.secret orderer2pw \
    --id.type orderer \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer2:orderer2pw@localhost:7054 \
    --enrollment.profile tls \
    --csr.hosts orderer2,orderer2.orgdcms.svc,orderer2.orgdcms.svc.cluster.local,localhost \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer2-tls'
kubectl get pvc -n orgdcms | grep orderer2
kubectl apply -f ~/fabric-2.5/artifacts/job-bind-orderer2-pvc.yaml
kubectl get pvc -n orgdcms | grep orderer2
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-correct.yaml
kubectl exec -n orgdcms read-orderer2-pvcs -- sh -c '
ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem || (cd /mnt/tls/tlscacerts && ln -s tls-localhost-7054.pem tls-ca-cert.pem)
'
kubectl get pod -n orgdcms | grep orderer2
kubectl get pvc -n orgdcms | grep orderer2
kubectl exec -n orgdcms read-orderer2-pvcs -- sh -c '
echo "TLS cert:"; ls -l /mnt/tls/signcerts/cert.pem;
echo "TLS key:";  ls -l /mnt/tls/keystore/key.pem;
echo "TLS root:"; ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem;
echo "MSP admin certs:"; ls -l /mnt/msp/admincerts || true;
'
kubectl get pod -n orgdcms | grep orderer1
kubectl apply -f read-orderer2-pvcs.yaml
kubectl apply -f ~/fabric-2.5/artifacts/read-orderer2-pvcs.yaml
kubectl exec -n orgdcms read-orderer2-pvcs -- sh -c '
echo "TLS cert:"; ls -l /mnt/tls/signcerts/cert.pem;
echo "TLS key:";  ls -l /mnt/tls/keystore/key.pem;
echo "TLS root:"; ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem;
'
kubectl exec -n orgdcms read-orderer2-pvcs --   sh -c 'cd /mnt/tls/tlscacerts && ln -s tls-localhost-7054.pem tls-ca-cert.pem'
kubectl exec -n orgdcms read-orderer2-pvcs -- sh -c '
echo "TLS cert:"; ls -l /mnt/tls/signcerts/cert.pem;
echo "TLS key:";  ls -l /mnt/tls/keystore/key.pem;
echo "TLS root:"; ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem;
'
ls -l /mnt/tls/keystore/key.pem
kubectl exec -n orgdcms read-orderer2-pvcs --   sh -c 'cd /mnt/tls/keystore && ln -s *_sk key.pem'
kubectl exec -n orgdcms read-orderer2-pvcs -- sh -c '
echo "TLS cert:"; ls -l /mnt/tls/signcerts/cert.pem;
echo "TLS key:";  ls -l /mnt/tls/keystore/key.pem;
echo "TLS root:"; ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem;
'
kubectl apply -f ~/fabric-2.5/artifacts/orderer2.yaml
kubectl get pod -n orgdcms | grep orderer2
kubectl logs -n orgdcms deploy/orderer2 --tail=50
kubectl get pvc -n orgdcms 
kubectl get pvc -n orgx 
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgdcms.yaml
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl get pod -n orgdcms 
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl delete pod inspect-fabric-ca-orgdcms -n orgdcms
kubectl run inspect-fabric-ca-orgdcms   -n orgdcms   --image=busybox   --restart=Never   --command -- sh -c "sleep 1d"
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl delete pod inspect-fabric-ca-orgdcms -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgdcms.yaml
kubectl get pod inspect-fabric-ca-orgdcms -n orgdcms
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl describe pod inspect-fabric-ca-orgdcms -n orgdcms
kubectl logs inspect-fabric-ca-orgdcms -n orgdcms
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl get pod inspect-fabric-ca-orgdcms -n orgdcms -o jsonpath='{.spec.containers[*].name}'
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms -c inspect -- sh
kubectl get pod inspect-fabric-ca-orgdcms -n orgdcms -o jsonpath='{.spec.containers[*].name}'
kubectl exec -it -n orgdcms inspect-fabric-ca-orgdcms -c inspect -- /bin/sh
kubectl apply -f ~/fabric-2.5/artifacts/clean-orderer2-msp.yaml
kubectl wait --for=condition=complete job/clean-orderer2-msp -n orgdcms
kubectl get pod  -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/copy-orderer2-correct.yaml
kubectl apply -f ~fabric-2.5/artifacts/job-copy-orderer2-correct.yaml
kubectl get pod  -n orgdcms
kubectl apply -f ~fabric-2.5/artifacts/job-copy-orderer2-correct.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-correct.yaml
kubectl get pod  -n orgdcms
kubectl wait --for=condition=complete job/copy-orderer2-msp-correct -n orgdcms
kubectl get pod  -n orgdcms
kubectl wait --for=condition=complete job/copy-orderer2-msp-correct -n orgdcms
kubectl get pod  -n orgdcms
kubectl wait --for=condition=complete job/copy-orderer2-msp-correct -n orgdcms
kubectl get pod  -n orgdcms
kubectl wait --for=condition=complete job/copy-orderer2-msp-correct -n orgdcms
kubectl describe pod -n orgdcms -l job-name=copy-orderer2-msp-correct
kubectl get pod  -n orgdcms
kubectl get pvc -n orgdcms orderer2-msp-pvc
kubectl get pvc -n orgdcms fabric-ca-orgdcms-pvc
kubectl get pvc -n orgdcms fabric-tls-ca-pvc
kubectl apply -f ~/fabric-2.5/artifacts/copy-orderer2-msp-pod.yaml
kubectl delete pod  -n orgdcms
kubectl get pod  -n orgdcms
kubectl 
kubectl get pod  -n orgdcms
kubectl delete copy-orderer2-msp-correct
kubectl delete copy-orderer2-msp-correct-qv5mq
kubectl describe pod -n orgdcms copy-orderer2-msp | sed -n '/Events:/,$p'
kubectl describe pod -n orgdcms copy-orderer2-msp-correct-qv5mq | sed -n '/Events:/,$p'
kubectl get pvc -n orgdcms orderer2-msp-pvc orderer2-tls-pvc fabric-ca-orgdcms-pvc
kubectl delete pod -n orgdcms copy-orderer2-msp copy-orderer2-msp-correct-qv5mq
kubectl get pod  -n orgdcms
kubectl get pvc -n orgdcms orderer2-msp-pvc orderer2-tls-pvc fabric-ca-orgdcms-pvc
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp/cacerts
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2-pvcs.yaml
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp/cacerts
kubectl get pod  -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2-pvcs.yaml
kubectl get pod  -n orgdcms
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp/cacerts
kubectl exec -n orgdcms inspect-orderer2-pvcs --   file /mnt/msp/cacerts/*
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer2:orderer2pw@localhost:7054 \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer2-msp'
kubectl exec -n orgdcms inspect-orderer2-pvcs --   file /mnt/msp/cacerts/*
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp/cacerts
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls /etc/hyperledger/fabric-ca-server/orderer2-msp/cacerts
kubectl exec -it -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh
kubectl exec -n orgdcms inspect-orderer2-pvcs --  sh
kubectl exec -n orgdcms inspect-orderer2-pvcs -- sh
kubectl delete -n orgdcms inspect-orderer2-pvcs 
kubectl delete  inspect-orderer2-pvcs 
kubectl get pod  -n orgdcms
kubectl delete  inspect-orderer2-pvcs 
kubectl delete pod inspect-orderer2-pvcs -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2-pvcs.yaml
kubectl exec -n orgdcms inspect-orderer2-pvcs -- sh
kubectl get pod  -n orgdcms
kubectl exec -n orgdcms inspect-orderer2-pvcs -- ls /mnt/msp
kubectl apply -f copy-orderer2-msp.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-msp.yaml
kubectl get pod  -n orgdcms
kubectl exec -n orgdcms inspect-orderer2-pvcs -- ls /mnt/msp/cacerts
kubectl exec -n orgdcms inspect-orderer2-pvcs -- ls /mnt/
kubectl exec -n orgdcms inspect-orderer2-pvcs -- 
kubectl exec -n orgdcms inspect-orderer2-pvcs -- ls /mnt/msp/
kubectl exec -n orgdcms inspect-orderer2-pvcs -- ls /mnt/keystore
kubectl exec -n orgdcms inspect-orderer2-pvcs -- ls /mnt/msp/keystore
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'find /mnt/msp -type d -maxdepth 4'
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer1.pvcs.yaml
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2-pvcs.yaml
kubectl exec -n orgdcms inspect-orderer1-pvcs --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer1-pvcs.yaml
kubectl exec -n orgdcms inspect-orderer1-pvcs --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'ls -l /mnt/msp/keystore'
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -it -n orgdcms inspect-fabric-ca-orgdcms -- sh
kubectl delete pod inspect-fabric-ca-orgdcms -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgdcms.yaml
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c'
rm /mnt/orderer2-msp/keystore/087b89e6f8f1452f8073d7436d60f3b48c17bc4578f1bceb9ae5bf6cc13e1515_sk
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c 'rm /mn'
ls -l /mnt/orderer2-msp/keystore
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgdcms
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c 'ls -lt /mnt/orderer2-msp/keystore'
kubectl get pod  -n orgdcms
kubectl delete pod copy-orderer1-msp-tls-correct-sdssb -n orgdcms
kubectl delete pod copy-orderer1-tls-correct-stgfx -n orgdcms
kubectl delete pod copy-orderer2-msp-hz5x7 -n orgdcms
kubectl delete pod copy-orderer2-msp-tls-correct-jrfnf -n orgdcms
kubectl get pod  -n orgdcms
kubectl apply -f ~fabric-2.5/artifacts/job-copy-orderer2-msp.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-msp.yaml
kubectl get pod  -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-msp.yaml
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'ls -l /mnt/msp/keystore'
kubectl delete pod inspect-orderer2-pvcs -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2.pvcs.yaml
kubectl get pod  -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2-pvcs.yaml
kubectl get pod  -n orgdcms
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'ls -l /mnt/msp/keystore'
kubectl get pod  -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-msp.yaml
kubectl delete job copy-orderer2-msp -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer2-msp.yaml
kubectl get pods -n orgdcms | grep copy-orderer2
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'ls -l /mnt/msp/keystore'
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7053:7053
kubectl port-forward -n orgdcms deploy/orderer1 7053:7053
kubectl port-forward -n orgdcms svc/fabric-tls-ca 7054:7054
kubectl get pods -n orgdcms 
cat > config.yaml <<'EOF'
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

apiVersion: batch/v1
kind: Job
metadata:
spec:
kubectl create configmap orderer2-nodeou-config   --from-file=config.yaml   -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/add-orderer2-config.yaml
kubectl get pod  -n orgdcms
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp/config.yaml
kubectl delete pod inspect-orderer2-pvcs -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer2-pvcs.yaml
kubectl exec -n orgdcms inspect-orderer2-pvcs --   ls -l /mnt/msp/config.yaml
kubectl rollout restart deployment orderer2 -n orgdcms
kubectl get pod  -n orgdcms
kubectl delete pod inspect-orderer1-pvcs -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer1-pvcs.yaml
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'ls -l /mnt/msp/keystore'
kubectl exec -n orgdcms inspect-fabric-ca-orgdcms --   sh -c 'find /mnt/msp -type f -exec ls -l {} \;'
kubectl exec -n orgdcms inspect-orderer2-pvcs --   sh -c 'ls -l /mnt/msp/keystore'
kubectl exec -n orgdcms inspect-orderer2-pvcs -- sh -c '
echo "=== TREE MSP ==="
find /mnt/msp -maxdepth 3 -type f -o -type d | sort
'
kubectl exec -n orgdcms inspect-orderer1-pvcs -- sh -c '
echo "=== TREE MSP ==="
find /mnt/msp -maxdepth 3 -type f -o -type d | sort
'
kubectl create configmap orderer1-nodeou-config   --from-file=config.yaml   -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer1-pvcs.yaml
kubectl apply -f ~/fabric-2.5/artifacts/add-orderer1-config.yaml
kubectl exec -n orgdcms inspect-orderer2-pvcs -- sh -c '
echo "=== TREE MSP ==="
find /mnt/msp -maxdepth 3 -type f -o -type d | sort
'
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl get pod  -n orgdcms
