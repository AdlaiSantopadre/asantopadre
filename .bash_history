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
kubectl get pod  -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/orderer3-pvc.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-bind-orderer3-pvc.yaml
kubectl get pvc -n orgx | grep orderer3
kubectl exec -n orgx deploy/fabric-ca-orgx --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client register \
    --url https://localhost:7054 \
    --id.name orderer3 \
    --id.secret orderer3pw \
    --id.type orderer \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   fabric-ca-client register     --url https://localhost:7054     --id.name orderer3     --id.secret orderer3pw     --id.type orderer     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'ls -l /etc/hyperledger/fabric-ca-server/msp/signcerts'
kubectl exec -n orgx deploy/fabric-ca-orgx --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer3:orderer3pw@localhost:7054 \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer3-msp'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer3:orderer3pw@localhost:7054 \
    --enrollment.profile tls \
    --csr.hosts orderer3,orderer3.orgx.svc,orderer3.orgx.svc.cluster.local,localhost \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer3-tls'
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer3-msp-tls.yaml
kubectl create configmap orderer3-nodeou-config   --from-file=config.yaml   -n orgx
kubectl get configmap orderer3-nodeou-config -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/add-orderer3-config.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml

'
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml
’

'
kubectl apply -f fabric-2.5/artifacts/orderer3.yaml
kubectl get pod  -n orgx
kubectl get pod  -n orgdcms
kubectl delete pod inspect-orderer1-pvcs -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer1-pvcs.yaml
kubectl exec -n orgdcms deploy/orderer1 -- sh -c 'ls -R /var/hyperledger/orderer/tls'
kubectl exec -n orgdcms deploy/orderer2 -- sh -c 'ls -R /var/hyperledger/orderer/tls'
kubectl exec -n orgx deploy/orderer3 -- sh -c 'ls -R /var/hyperledger/orderer/tls'
kubectl logs -n orgx deploy/orderer3 --tail=50
kubectl exec -n orgx deploy/orderer3 -- sh -c '
ls -l /var/hyperledger/orderer/tls/keystore &&
ls -l /var/hyperledger/orderer/tls/signcerts &&
ls -l /var/hyperledger/orderer/tls/tlscacerts
'
kubectl exec -n orgx deploy/fabric-ca-orgx --   ls /etc/hyperledger/fabric-ca-server/orderer3-msp/signcerts
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer3-msp.yaml
kubectl exec -n orgx deploy/orderer3 --   ls /var/hyperledger/orderer/msp/signcerts
kubectl rollout restart deploy/orderer3 -n orgx
kubectl get pod  -n orgx
kubectl logs -n orgx deploy/orderer3 --tail=50
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml
'
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml
'
kubectl apply -f ~/fabric-2.5/artifacts/add-orderer3-config.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml
'
kubectl get configmap orderer3-nodeou-config -n orgx
kubectl exec -n orgx inspect-orderer3-pvcs -- sh 
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml
'
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
ls'
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
cat > /mnt/msp/config.yaml <<EOF
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
'
kubectl exec -n orgx inspect-orderer3-pvcs -- ls -l /mnt/msp/config.yaml
kubectl rollout restart deploy/orderer3 -n orgx
kubectl logs -n orgx deploy/orderer3 --tail=50
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
cat /mnt/msp/config.yaml
'
kubectl logs -n orgx deploy/orderer3 --tail=50
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
echo "=== CONFIG ==="
ls'
cd mon/
cd /mnt
ls
kubectl get pod  -n orgx
kubectl get pvc  -n orgx
kubectl get pvc  -n orgdcms
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl get pod  -n orgx
kubectl get pvc  -n orgdcms
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl get pod  -n orgx
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl get pod  -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl get pod  -n orgx
kubectl delete pod job-copy-orderer3-msp-tls -n orgx
kubectl delete pod copy-orderer3-msp-tls -n orgx
kubectl delete pod copy-orderer3-msp-tls-tgp6b -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer3-msp-tls.yaml
kubectl get pod  -n orgx
kubectl delete pod copy-orderer3-msp-tls-tgp6b -n orgx
kubectl delete pod job-copy-orderer3-msp-tls-new -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer3-msp-tls-new.yaml
kubectl apply -f ~/fabric-2.5/artifacts/job-copy-orderer3-msp-tls.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh -c '
ls -R /mnt/tls
'
kubectl get pod  -n orgx
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl get pod  -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl get pod  -n orgx
kubectl get pvc  -n orgx
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl delete pod job-copy-orderer3-msp-tls-new -n orgx
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl delete pod job-copy-orderer3-msp-tls -n orgx
kubectl delete pod copy-orderer3-msp-tls -n orgx
kubectl get pod  -n orgx
kubectl delete pod copy-orderer3-msp -n orgx
kubectl delete pod copy-orderer3-msp-tls-again-226f9 -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgx.yaml
ls /etc/hyperledger/fabric-ca-server/orderer3-msp
ls /etc/hyperledger/fabric-ca-server/orderer3-tls
kubectl get pod  -n orgx
kubectl get pod  -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgx.yaml
kubectl delete pod inspect-fabric-ca-orgx -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgx.yaml
kubectl get pod  -n orgdcms
kubectl get pod  -n orgx
cd ..
kubectl exec -n orgx inspect-fabric-ca-orgx -- sh
cd /mnt
ls -R
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh
kubectl get pvc  -n orgx
kubectl exec -it -n orgx deploy/fabric-ca-orgx -- sh
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c 'mount | grep fabric-ca || mount | grep "/etc/hyperledger/fabric-ca-server"'
cd .
..
cd ~/
kubectl exec -it -n orgx deploy/fabric-ca-orgx -- sh
kubectl exec -it -n orgx inspect-fabric-ca-orgx -- sh
kubectl get pod  -n orgx
kubectl delete deployment fabric-ca-orgx -n orgx
kubectl get pod  -n orgx
ubectl delete pod -l app=fabric-ca-orgx -n orgx
kubectl delete pod -l app=fabric-ca-orgx -n orgx
kubectl get pod  -n orgx
kubectl get pod -n orgx | grep fabric-ca || echo "OK: nessun pod CA"
kubectl get pvc fabric-ca-orgx-pvc -n orgx
kubectl run inspect-ca-orgx-pvc   -n orgx   --image=busybox   --restart=Never   --command -- sh -c "ls -la /mnt && sleep 600"
kubectl exec -n orgx inspect-ca-orgx-pvc -- sh
kubectl get pod  -n orgx
kubectl delete pod -l inspect-ca-orgx-pvc
kubectl get pod  -n orgx
kubectl delete pod -l inspect-ca-orgx-pvc
kubectl run inspect-ca-orgx-pvc   -n orgx   --image=busybox   --restart=Never   --command -- sh -c "sleep 3600"
kubectl delete pod -l inspect-ca-orgx-pvc
kubectl get pod -n orgx
kubectl delete pod <NOME_POD> -n orgx --force --grace-period=0
kubectl delete pod inspect-fabric-ca-orgx -n orgx --force --grace-period=0
kubectl run inspect-ca-orgx-pvc   -n orgx   --image=busybox   --restart=Never   --command -- sh -c "sleep 3600"
kubectl get pod -n orgx
kubectl run inspect-ca-orgx-new-pvc   -n orgx   --image=busybox   --restart=Never   --command -- sh -c "sleep 3600"
kubectl get pod -n orgx
kubectl exec -n orgx inspect-ca-orgx-new-pvc -- sh
kubectl exec -it -n orgx inspect-ca-orgx-new-pvc -- sh
kubectl delete pod inspect-fabric-ca-orgx -n orgx --force --grace-period=0
kubectl delete pod inspect-ca-orgx-pvx -n orgx --force --grace-period=0
kubectl delete pod inspect-ca-orgx-pvc -n orgx --force --grace-period=0
kubectl delete pod inspect-ca-orgx-new-pvc -n orgx 
kubectl get pod -n orgx
kubectl describe pod -n orgx fabric-ca-orgx | grep -A5 Mounts
kubectl apply -f ~/fabric-2.5/artifacts/fabric-ca-orgx.yaml
kubectl exec -n orgx deploy/fabric-ca-orgx --   mount | grep fabric-ca
kubectl describe pod -n orgx   $(kubectl get pod -n orgx -l app=fabric-ca-orgx -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n orgx deploy/fabric-ca-orgx --   sh -c 'ls -l /etc/hyperledger/fabric-ca-server'
kubectl describe pod -n orgx fabric-ca-orgx | grep -A5 Mounts
kubectl get pod -n orgx
kubectl get pod -n orgdcms
kubectl apply -f ~/fabric-2.5/artifacts/inspect-fabric-ca-orgx.yaml
kubectl exec -n orgx inspect-fabric-ca-orgx-pvc -- sh
kubectl get pod -n orgx
kubectl exec -n orgx inspect-fabric-ca-orgx-pvc -- sh
kubectl exec -n orgx inspect-fabric-ca-orgx -- sh
kubectl exec -it -n orgx inspect-fabric-ca-orgx -- sh
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-msp.yaml
kubectl exec -n orgx inspect-orderer3-msp -- sh -c '
ls -R /mnt/msp
'
kubectl exec -it -n orgx inspect-orderer3-msp -- sh
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
rm -rf /etc/hyperledger/fabric-ca-server/orderer3-msp/*
'
# prima
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server | sed "s,^,BEFORE: ,"
'
# dopo la cancellazione
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server | sed "s,^,AFTER: ,"
'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server | sed "s,^,BEFORE: ,"
'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer3:orderer3pw@localhost:7054 \
    --enrollment.profile tls \
    --csr.hosts orderer3,orderer3.orgx.svc,orderer3.orgx.svc.cluster.local,localhost \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer3-tls'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
cp -r /etc/hyperledger/fabric-ca-server/orderer3-msp/{cacerts,keystore,signcerts,IssuerPublicKey,IssuerRevocationPublicKey,user} /mnt/msp/

'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
for d in cacerts keystore signcerts IssuerPublicKey IssuerRevocationPublicKey user; do
  cp -r /etc/hyperledger/fabric-ca-server/orderer3-msp/$d /mnt/msp/
done
'
kubectl exec -n orgx deploy/fabric-ca-orgx -- \ sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \ fabric-ca-client enroll \ -u https://orderer3:orderer3pw@localhost:7054 \ --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \ -M /etc/hyperledger/fabric-ca-server/orderer3-msp'
kubectl exec -n orgx deploy/fabric-ca-orgx --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer3:orderer3pw@localhost:7054 \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer3-msp'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
cp -r /etc/hyperledger/fabric-ca-server/orderer3-msp/{cacerts,keystore,signcerts,IssuerPublicKey,IssuerRevocationPublicKey,user} /mnt/msp/
'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
for d in cacerts keystore signcerts IssuerPublicKey IssuerRevocationPublicKey user; do
  cp -r /etc/hyperledger/fabric-ca-server/orderer3-msp/$d /mnt/msp/
done
'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server/orderer3-msp
'
kubectl exec -n orgx deploy/fabric-ca-orgx -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server | sed "s,^,BEFORE: ,"
'
kubectl exec -n orgdcms deploy/fabric-tls-ca -- sh -c '
rm -rf /etc/hyperledger/fabric-ca-server/orderer3-tls/*
'
kubectl exec -n orgdcms deploy/fabric-tls-ca -- sh -c '
ls -l /etc/hyperledger/fabric-ca-server/orderer3-tls
'
kubectl exec -n orgdcms deploy/fabric-tls-ca --   sh -c 'export HOME=/etc/hyperledger/fabric-ca-server && \
  fabric-ca-client enroll \
    -u https://orderer3:orderer3pw@localhost:7054 \
    --enrollment.profile tls \
    --csr.hosts orderer3,orderer3.orgx.svc,orderer3.orgx.svc.cluster.local,localhost \
    --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem \
    -M /etc/hyperledger/fabric-ca-server/orderer3-tls'
kubectl exec -n orgdcms deploy/fabric-tls-ca -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server/orderer3-tls
'
kubectl exec -n orgdcms deploy/fabric-tls-ca -- sh -c '
openssl x509 -in /etc/hyperledger/fabric-ca-server/orderer3-tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
'

kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-pvcs.yaml
kubectl exec -n orgx inspect-orderer3-pvcs -- sh
kubectl get pod -n orgx
kubectl delete pod inspect-orderer3-pvcs -n orgx
kubectl get pod -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-tls-pvc.yaml
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-tls.yaml
kubectl exec -n orgx inspect-orderer3-tls -- sh
kubectl exec -it -n orgx inspect-orderer3-tls -- sh
kubectl exec -n orgdcms deploy/fabric-tls-ca -- sh -c '
cp -r /etc/hyperledger/fabric-ca-server/orderer3-tls/* /mnt/tls/
'
kubectl cp -n orgdcms deploy/fabric-tls-ca:/etc/hyperledger/fabric-ca-server/orderer3-tls /tmp/orderer3-tls
kubectl get pods -n orgdcms | grep fabric-tls-ca
kubectl cp -n orgdcms fabric-tls-ca-666c69bb4d-f6b7r:/etc/hyperledger/fabric-ca-server/orderer3-tls /tmp/orderer3-tls
kubectl cp -n orgx /tmp/orderer3-tls/. inspect-orderer3-tls:/mnt/tls
kubectl exec -it -n orgx inspect-orderer3-tls -- sh
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
cd /mnt/tls && \
ln -sf tlscacerts/tls-localhost-7054.pem tls-ca-cert.pem && \
ln -sf keystore/*_sk key.pem
'
ls -l /mnt/tls/tls-ca-cert.pem /mnt/tls/key.pem
kubectl exec -it -n orgx inspect-orderer3-tls -- sh
kubectl describe pod orderer3 -n orgx | grep -A3 ConfigMap
kubectl describe pod orderer1 -n orgdcms | grep -A3 ConfigMap
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pod -n orgx
kubectl logs -n orgx orderer3-6fb8d64f4f-7hmhj
kubectl describe deployment orderer3 -n orgx | grep -A5 msp
kubectl exec -n orgx inspect-orderer3-msp
kubectl exec -n orgx inspect-orderer3-msp -- ls /mnt/msp/signcerts
kubectl exec -it -n orgx inspect-orderer3-msp -- sh
kubectl get pod -n orgdcms
kubectl get pod -n orgx
kubectl cp -n orgx fabric-ca-orgx-5b89bf9b45-2xpzn:/etc/hyperledger/fabric-ca-server/orderer3-msp/. inspect-orderer3-msp:/mnt/msp
kubectl cp -n orgx fabric-ca-orgx-5b89bf9b45-2xpzn:/etc/hyperledger/fabric-ca-server/orderer3-msp /tmp/orderer3-msp
kubectl exec -n orgx inspect-orderer3-msp -- sh -c '
ls -R /mnt/msp
'
kubectl cp -n orgx /tmp/orderer3-msp/. inspect-orderer3-msp:/mnt/msp
kubectl exec -n orgx inspect-orderer3-msp -- ls /mnt/msp/signcerts
kubectl exec -n orgx fabric-ca-orgx-5b89bf9b45-2xpzn -- sh -c '
ls -R /etc/hyperledger/fabric-ca-server/orderer3-msp
'
ls -R /tmp/orderer3-msp
kubectl exec -n orgx inspect-orderer3-msp -- sh -c '
ls -R /mnt/msp
'
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pod -n orgx
kubectl logs -n orgx orderer3-69b558468d-bkvgw
kubectl logs -n orgx orderer3-69b558468d-bkvgw --previous
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
ls -l /mnt/tls/key.pem &&
ls -l /mnt/tls/tls-ca-cert.pem &&
ls -l /mnt/tls/keystore/key.pem
'
kubectl get pod -n orgx
kubectl delete pod inspect-orderer3-tls -n orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-orderer3-tls.yaml
kubectl get pod -n orgx
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
ls -l /mnt/tls/key.pem &&
ls -l /mnt/tls/tls-ca-cert.pem &&
ls -l /mnt/tls/keystore/key.pem
'
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
mkdir -p /mnt/tls/keystore && ln -sf /mnt/tls/key.pem /mnt/tls/keystore/key.pem
'
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
ls -l /mnt/tls/keystore/key.pem
'
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pod -n orgx
kubectl logs -n orgx orderer3-64b4b6866f-8bl7t --previous
kubectl logs -n orgx orderer3-64b4b6866f-8bl7t
kubectl describe pod orderer3-64b4b6866f-8bl7t -n orgx
kubectl exec -n orgx orderer3-64b4b6866f-8bl7t -- sh -c '
ls -l /var/hyperledger/orderer/tls/keystore/key.pem &&
ls -l /var/hyperledger/orderer/tls/signcerts/cert.pem &&
ls -l /var/hyperledger/orderer/tls/tls-ca-cert.pem
'
kubectl get deployment orderer3 -n orgx -o yaml | grep ORDERER_GENERAL_TLS -A2
kubectl get pod -n orgx
kubectl logs -n orgx orderer3-64b4b6866f-8bl7t
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
mkdir -p /mnt/tls/keystore && \
ln -sf ../key.pem /mnt/tls/keystore/key.pem
'
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
ls -l /mnt/tls/keystore/key.pem
'
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pod -n orgx
kubectl logs -n orgx orderer3-7f65675569-zplh5
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
mkdir -p /mnt/tls/tlscacerts && \
ln -sf ../tls-ca-cert.pem /mnt/tls/tlscacerts/tls-ca-cert.pem
'
kubectl exec -n orgx inspect-orderer3-tls -- sh -c '
ls -l /mnt/tls/tlscacerts/tls-ca-cert.pem
'
kubectl rollout restart deployment orderer3 -n orgx
kubectl get pod -n orgx
kubectl logs -n orgx orderer3-64b4b6866f-8bl7t --previous
kubectl describe pod orderer3-6fdd7f8c4f-rdr89 -n orgx
# 1) Admin API viva
kubectl exec -n orgx orderer3-6fdd7f8c4f-rdr89 -- sh -c '
wget -qO- https://127.0.0.1:7053/healthz --no-check-certificate || echo OK
'
# 2) Canali (osnadmin)
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-2.5/artifacts/orderer3-tls/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-2.5/artifacts/orderer3-tls/signcerts/cert.pem   --client-key  /home/asantopadre/fabric-2.5/artifacts/orderer3-tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-2.5/artifacts/orderer3-tls/tls-ca-cert.pem   --client-cert /home/asantopadre/fabric-2.5/artifacts/orderer3-tls/signcerts/cert.pem   --client-key  /home/asantopadre/fabric-2.5/artifacts/orderer3-tls/keystore/key.pem
kubectl get pod -n orgx
kubectl get pod -n orgdcms
kubectl port-forward -n orgdcms pod/orderer1-8444799c85-wzwf2 7053:7053
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 7053:705353
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer3-orgx/tls/keystore/*_sk
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 7053:705353
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 7053:7053
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7054:7054
kubectl port-forward -n orgdcms pod/orderer1-8444799c85-wzwf2 7053:7053
kubectl port-forward -n orgdcms pod/orderer2-5848b959fd-rl6q7 7053:7053
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 7053:7053
kubectl port-forward -n orgdcms pod/orderer1-8444799c85-wzwf2 17053:7053
kubectl port-forward -n orgx pod/orderer3-6fdd7f8c4f-rdr89 37053:7053
kubectl port-forward -n orgdcms pod/orderer2-5848b959fd-rl6q7 27053:7053
kubectl cp -n orgdcms orderer1-8444799c85-wzwf2:/var/hyperledger/orderer/tls /home/asantopadre/osnadmin/orderer1-orgdcms/tls
ls /home/asantopadre/osnadmin/orderer1-orgdcms/tls/{keystore,signcerts,tlscacerts}
cd /home/asantopadre/osnadmin/orderer1-orgdcms/tls
ln -sf keystore/*_sk keystore/key.pem
ln -sf tlscacerts/*.pem tlscacerts/tls-ca-cert.pem
ls -l keystore/key.pem tlscacerts/tls-ca-cert.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
cd ~/
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
ls /home/asantopadre/osnadmin/orderer1-orgdcms/tls/{keystore,signcerts,tlscacerts}
ls -l tls-ca-cert.pem
ls -l /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore
ls -l /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
cd /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts
ln -sf tls-localhost-7054.pem tls-ca-cert.pem
ls -l tls-ca-cert.pem
cd /home/asantopadre/osnadmin/orderer1-orgdcms/tls
ln -sf keystore/*_sk keystore/key.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
cd /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore
ln -sf 2ad3d95999779528bfe1a0b87de954d7d1680922574149e8eac91b57f6b67b0e_sk key.pem
ls -l key.pem
ls -l /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl cp -n orgdcms orderer2-5848b959fd-rl6q7:/var/hyperledger/orderer/tls /home/asantopadre/osnadmin/orderer2-orgdcms/tls
cd /home/asantopadre/osnadmin/orderer2-orgdcms/tls/keystore
ln -sf *_sk key.pem
cd ../tlscacerts
ln -sf *.pem tls-ca-cert.pem
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer2-orgdcms/tls/keystore/key.pem
kubectl get pod -n orgx
kubectl cp -n orgx orderer3-6fdd7f8c4f-rdr89:/var/hyperledger/orderer/tls /home/asantopadre/osnadmin/orderer3-orgx/tls
cd /home/asantopadre/osnadmin/orderer3-orgx/tls/keystore
ln -sf *_sk key.pem
cd ../tlscacerts
ln -sf *.pem tls-ca-cert.pem
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer3-orgx/tls/keystore/key.pem
export FABRIC_CFG_PATH=/home/asantopadre/fabric-2.5/config
cd ~/
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/fabric-2.5/artifacts/canale1.block
mkdir -p /home/asantopadre/configtx/{orgdcms,orgx}/msp
mkdir -p /home/asantopadre/configtx/orderers/{orderer1,orderer2,orderer3}/msp
kubectl get pod -n orgdcms
kubectl cp -n orgdcms fabric-ca-orgdcms-7b989984b9-ftkd6:/etc/hyperledger/fabric-ca-server/msp /home/asantopadre/configtx/orgdcms/msp
ls /home/asantopadre/configtx/orgdcms/msp/{cacerts,keystore,signcerts,config.yaml}
ls /home/asantopadre/configtx/orgdcms/msp/config.yaml
kubectl get pod -n orgx
kubectl cp -n orgx fabric-ca-orgx-5b89bf9b45-2xpzn:/etc/hyperledger/fabric-ca-server/msp /home/asantopadre/configtx/orgx/msp
ls /home/asantopadre/configtx/orgx/msp/{cacerts,keystore,signcerts}
ls /home/asantopadre/configtx/orgx/msp/config.yaml
kubectl cp -n orgdcms orderer1-8444799c85-wzwf2:/var/hyperledger/orderer/msp /home/asantopadre/configtx/orderers/orderer1/msp
ls /home/asantopadre/configtx/orderers/orderer1/msp/{cacerts,keystore,signcerts,config.yaml}
kubectl cp -n orgdcms orderer2-5848b959fd-rl6q7:/var/hyperledger/orderer/msp /home/asantopadre/configtx/orderers/orderer2/msp
ls /home/asantopadre/configtx/orderers/orderer2/msp/{cacerts,keystore,signcerts,config.yaml}
kubectl cp -n orgx orderer3-6fdd7f8c4f-rdr89:/var/hyperledger/orderer/msp /home/asantopadre/configtx/orderers/orderer3/msp
ls /home/asantopadre/configtx/orderers/orderer3/msp/{cacerts,keystore,signcerts,config.yaml}
[ -f /home/asantopadre/configtx/orgdcms/msp/config.yaml ]
[ -f /home/asantopadre/configtx/orgx/msp/config.yaml ]
[ -f /home/asantopadre/configtx/orderers/orderer1/msp/config.yaml ]
[ -f /home/asantopadre/configtx/orderers/orderer2/msp/config.yaml ]
[ -f /home/asantopadre/configtx/orderers/orderer3/msp/config.yaml ]
[ -f /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem ]
[ -f /home/asantopadre/osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem ]
[ -f /home/asantopadre/osnadmin/orderer3-orgx/tls/signcerts/cert.pem ]
configtxgen -profile Canale1 -channelID canale1 -outputBlock canale1.block
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/fabric-2.5/artifacts/canale1.block
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/fabric-2.5/artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/fabric-2.5/artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block /home/asantopadre/fabric-2.5/artifacts/canale1.block   --orderer-address localhost:17053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl get svc -n orgdcms
kubectl get svc -n orderer1 -n orgdcms -o yaml
nslookup orderer1.orgdcms.svc.cluster.local
openssl x509 -in cert.pem -noout -text | grep -A1 "Subject Alternative Name"
kubectl get svc -n orgx
kubectl get svc orderer1 -n orgdcms -o yaml | grep -E "name:|clusterIP|selector"
nslookup orderer1.orgdcms.svc.cluster.local
kubectl get svc orderer2 -n orgdcms -o yaml | grep -E "name:|clusterIP|selector"
nslookup orderer2.orgdcms.svc.cluster.local
kubectl delete svc orderer1 -n orgdcms
kubectl apply -f orderer1-headless.yaml
kubectl get svc orderer1 -n orgdcms
nslookup orderer1.orgdcms.svc.cluster.local
kubectl run dns-test --rm -it -n orgdcms --image=busybox --restart=Never -- sh
kubectl delete svc orderer2 -n orgdcms
kubectl apply -f orderer2-headless.yaml
kubectl run dns-test --rm -it -n orgdcms --image=busybox --restart=Never -- sh
kubectl delete svc orderer3 -n orgx
kubectl apply -f orderer3-headless.yaml
kubectl run dns-test --rm -it -n orgx --image=busybox --restart=Never -- sh
openssl x509 -in osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in osnadmin/orderer3-orgx/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
configtxgen -profile Canale1 -outputBlock canale1.block
configtxgen   -profile Canale1   -channelID canale1   -outputBlock /home/asantopadre/fabric-2.5/artifacts/canale1.block
configtxgen   -profile Canale1   -channelID canale1   -outputBlock canale1.block
2026-01-30 17:57:15.575 UTC 0001 INFO [common.tools.configtxgen] main -> Loading configuration
2026-01-30 17:57:15.578 UTC 0002 PANI [common.tools.configtxgen.localconfig] Load -> Error loading config from config cache: Error unmarshalling config into struct: 1 error(s) decoding:
* '' has invalid keys: EtcdRaft
2026-01-30 17:57:15.578 UTC 0003 PANI [common.tools.configtxgen] func1 -> Error loading config from config cache: Error unmarshalling config into struct: 1 error(s) decoding:
configtxgen   -profile Canale1   -channelID canale1   -outputBlock canale1.block
osnadmin channel join   --channelID canale1   --config-block canale1.block   --orderer-address localhost:17053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block canale1.block   --orderer-address localhost:27053   --ca-file osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block canale1.block   --orderer-address localhost:37053   --ca-file osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key osnadmin/orderer3-orgx/tls/keystore/key.pem
openssl x509 -in osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem -noout -issuer
openssl x509 -in osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem -noout -issuer
openssl x509 -in osnadmin/orderer3-orgx/tls/signcerts/cert.pem   -noout -issuer
openssl x509 -in osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem -noout -subject
ls /home/asantopadre/configtx/orderers/orderer1/msp/tlscacerts
ls /home/asantopadre/configtx/orderers/orderer2/msp/tlscacerts
ls /home/asantopadre/configtx/orderers/orderer3/msp/tlscacerts
mkdir -p /home/asantopadre/configtx/orderers/orderer{1,2,3}/msp/tlscacerts
cp osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem    /home/asantopadre/configtx/orderers/orderer1/msp/tlscacerts/
cp osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem    /home/asantopadre/configtx/orderers/orderer2/msp/tlscacerts/
cp osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem    /home/asantopadre/configtx/orderers/orderer3/msp/tlscacerts/
configtxgen -profile Canale1 -channelID canale1 -outputBlock canale1.block
osnadmin channel join   --channelID canale1   --config-block canale1.block   --orderer-address localhost:17053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list --orderer-address localhost:17053
osnadmin channel list   --orderer-address localhost:17053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block canale1.block   --orderer-address localhost:27053   --ca-file osnadmin/orderer2-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer2-orgdcms/tls/signcerts/cert.pem   --client-key osnadmin/orderer2-orgdcms/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block canale1.block   --orderer-address localhost:37053   --ca-file osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key osnadmin/orderer3-orgx/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:17053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:27053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:77053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  osnadmin/orderer1-orgdcms/tls/keystore/key.pem
osnadmin channel list   --orderer-address localhost:37053   --ca-file osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  osnadmin/orderer1-orgdcms/tls/keystore/key.pem
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl logs -n orgx deploy/orderer3 | grep -i leader
kubectl logs -n orgdcms deploy/orderer2 | grep -i leader
kubectl logs -n orgdcms deploy/orderer1 | grep -i leader
ubectl get pods -n orgdcms | egrep 'orderer|fabric-'
osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/*_sk
kubectl get pods -n orgdcms | egrep 'orderer|fabric-'
osnadmin channel list   --orderer-address localhost:7053   --ca-file ~/fabric-deploy/orderer1-tls/tlscacerts/tls-localhost-7054.pem   --client-cert ~/fabric-deploy/orderer1-tls/signcerts/cert.pem   --client-key  ~/fabric-deploy/orderer1-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/tlscacerts/tls-rootca.pem   --client-cert /home/asantopadre/osnadmin/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/keystore/*_sk
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/orderer1-orgdcms/tls/keystore/*_sk
ls -l /home/asantopadre/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem
ls -l /home/asantopadre/orderer1-orgdcms/tls/tlscacerts
osnadmin channel list   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer1-orgdcms/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer1-orgdcms/tls/keystore/*_sk
kubectl get pods -n orgdcms | egrep 'fabric-ca|fabric-tls-ca'
kubectl get pods -n orgx    | egrep 'fabric-ca|fabric-tls-ca'
kubectl exec -n orgdcms deploy/orderer1 -- ls -l /var/hyperledger/orderer/tls/tlscacerts
kubectl exec -n orgdcms deploy/orderer2 -- ls -l /var/hyperledger/orderer/tls/tlscacerts
kubectl exec -n orgx    deploy/orderer3 -- ls -l /var/hyperledger/orderer/tls/tlscacerts
ls -l /home/asantopadre/osnadmin/orderer3-orgx/tls/tlscacerts
osnadmin channel list   --orderer-address orderer3.orgx.svc.cluster.local:7053   --ca-file /home/asantopadre/osnadmin/orderer3-orgx/tls/tlscacerts/tls-ca-cert.pem   --client-cert /home/asantopadre/osnadmin/orderer3-orgx/tls/signcerts/cert.pem   --client-key  /home/asantopadre/osnadmin/orderer3-orgx/tls/keystore/*_sk
git remote -v
ssh -T git@github.com
Git status
git status
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-ca/orgdcms/tls/ca-cert.pem
fabric-ca-client register   --id.name peer1   --id.secret peer1pw   --id.type peer   --id.affiliation orgdcms   --url https://fabric-ca-orgdcms.orgdcms.svc.cluster.local:7054
export FABRIC_CA_CLIENT_TLS_CERTFILES=/home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem
ls -l $FABRIC_CA_CLIENT_TLS_CERTFILES
fabric-ca-client register   --id.name peer1   --id.secret peer1pw   --id.type peer   --id.affiliation orgdcms   --url https://fabric-ca-orgdcms.orgdcms.svc.cluster.local:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem
fabric-ca-client enroll   -u https://boot:bootpw@fabric-ca-orgdcms.orgdcms.svc.cluster.local:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/home/asantopadre/osnadmin/orderer1-orgdcms/tls/tlscacerts/tls-ca-cert.pem
fabric-ca-client enroll   -u https://boot:bootpw@localhost:7054
ls ~/fabric-ca/orgdcms/admin/msp/{signcerts,keystore}
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   ls /etc/hyperledger/fabric-ca-server
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-ca/orgdcms/tls-ca-server.pem
fabric-ca-client enroll   -u https://boot:bootpw@localhost:7054
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   cat /etc/hyperledger/fabric-ca-server/tls-cert.pem   > /home/asantopadre/fabric-ca/orgdcms/tls-ca-server.pem
ls -l /home/asantopadre/fabric-ca/orgdcms/tls-ca-server.pem
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-ca/orgdcms/tls-ca-server.pem
fabric-ca-client enroll   -u https://boot:bootpw@localhost:7054
kubectl get pods -n orgdcms
ls -l /home/asantopadre/fabric-ca/orgdcms/tls-ca-server.pem
ls ~/fabric-ca/orgdcms/admin/msp/{signcerts,keystore}
cd ~/fabric-ca/orgdcms/admin/msp/keystore
ls
rm 3eb03d7385f23f80de42cdfd75a22a4b76c0da6ab1c18a2746335685689a1cb0_sk    c14d4f195490382b8b7e086991fb65900a2a015031f9a966db8d48fa078015f0_sk
ls
cd ~/
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-ca/orgdcms/tls-ca-server.pem
fabric-ca-client register   --id.name peer1   --id.secret peer1pw   --id.type peer   --id.affiliation orgdcms   --url https://localhost:7054
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/orgdcms-admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-ca/orgdcms/tls-ca-server.pem
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054
mkdir -p ~/fabric-ca/orgdcms
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   cat /etc/hyperledger/fabric-ca-server/tls-cert.pem   > ~/fabric-ca/orgdcms/tls-ca-server.pem
ls -l ~/fabric-ca/orgdcms/tls-ca-server.pem
export FABRIC_CA_CLIENT_HOME=~/fabric-ca/orgdcms/orgdcms-admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=~/fabric-ca/orgdcms/tls-ca-server.pem
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054
kubectl apply -f /home/asantopadre/fabric-2.5/artifacts/peer1-pvc.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/artifacts/inspect-peer1-pvcs.yaml
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl exec -n orgdcms -it enroll-peer1-orgdcms -- sh
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client register     --id.name peer1     --id.secret peer1pw     --id.type peer     --id.affiliation orgdcms     --url https://localhost:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl scale -n orgdcms deploy/fabric-ca-orgdcms --replicas=0
kubectl exec -n orgdcms -it deploy/fabric-ca-orgdcms -- sh
kubectl scale -n orgdcms deploy/fabric-ca-orgdcms --replicas=1
kubectl get pods -n orgdcms | grep fabric-ca-orgdcms
kubectl exec -n orgdcms -it deploy/fabric-ca-orgdcms -- sh
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   fabric-ca-client register     --id.name peer1     --id.secret peer1pw     --id.type peer     --id.affiliation orgdcms     --url https://fabric-ca-orgdcms:7054     --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   env | grep FABRIC_CA_CLIENT_HOME
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms -- sh -c '
export FABRIC_CA_CLIENT_HOME=/tmp/boot
fabric-ca-client enroll \
  -u https://boot:bootpw@fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem

fabric-ca-client register \
  --id.name peer1 \
  --id.secret peer1pw \
  --id.type peer \
  --id.affiliation orgdcms \
  --url https://fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem
'
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms -- sh -c '
export FABRIC_CA_CLIENT_HOME=/tmp/orgdcms-admin
fabric-ca-client enroll \
  -u https://orgdcms-admin:orgdcms-adminpw@fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem

fabric-ca-client register \
  --id.name peer1 \
  --id.secret peer1pw \
  --id.type peer \
  --id.affiliation orgdcms \
  --url https://fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem
'
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   sqlite3 /etc/hyperledger/fabric-ca-server/fabric-ca-server.db   "select name, type from identities;"
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms -- sh -c '
export FABRIC_CA_CLIENT_HOME=/tmp/test-admin
fabric-ca-client enroll \
  -u https://orgdcms-admin:orgdcms-adminpw@fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem

fabric-ca-client register \
  --id.name __probe__ \
  --id.secret probe \
  --id.type client \
  --id.affiliation orgdcms \
  --url https://fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem
'
kubectl scale -n orgdcms deploy/fabric-ca-orgdcms --replicas=0
kubectl get pods -n orgdcms | grep fabric-ca-orgdcms
kubectl get pvc -n orgdcms fabric-ca-orgdcms-pvc -o jsonpath='{.spec.volumeName}'
kubectl get pv pvc-670eb23b-1c9e-4191-8d24-04065aa17134a -o yaml | grep path:
kubectl get pv pvc-670eb23b-1c9e-4191-8d24-04065aa17134 -o yaml | grep path:
cd /var/lib/rancher/k3s/storage/pvc-670eb23b-1c9e-4191-8d24-04065aa17134_orgdcms_fabric-ca-orgdcms-pvc
ls
cd /var/lib/rancher/k3s/storage/pvc-670eb23b-1c9e-4191-8d24-04065aa17134_orgdcms_fabric-ca-orgdcms-pvc
sudo -i
cd /var/lib/rancher/k3s/storage/pvc-670eb23b-1c9e-4191-8d24-04065aa17134_orgdcms_fabric-ca-orgdcms-pvc
ls
kubectl exec -n orgdcms fabric-ca-orgdcms-7b989984b9-z6q8h -- sh -c '
export FABRIC_CA_CLIENT_HOME=/tmp/boot
fabric-ca-client enroll \
  -u https://boot:bootpw@fabric-ca-orgdcms:7054 \
  --tls.certfiles /etc/hyperledger/fabric-ca-server/tls-cert.pem
'
sudo -i
kubectl get pod -n orgdcms fabric-ca-orgdcms-7b989984b9-z6q8h -o yaml | sed -n '/containers:/,/imagePullPolicy/p'
kubectl exec -n orgdcms -it enroll-peer1-orgdcms -- sh
kubectl get pods -n orgdcms | grep fabric-ca-orgdcms
kubectl logs -n orgdcms fabric-ca-orgdcms-7b989984b9-z6q8h --previous
sudo -i
kubectl get pods -n orgdcms | grep fabric-ca-orgdcms
kubectl logs -n orgdcms deploy/fabric-ca-orgdcms | tail
kubectl exec -n orgdcms -it enroll-peer1-orgdcms -- sh
kubectl get pods -n orgx | grep fabric-ca-orgx
kubectl apply -f ~/fabric-2.5/artifacts/inspect-peer2-pvcs.yaml
kubectl apply -f ~/fabric-2.5/artifacts/peer2-pvc.yaml
kubectl get pvc -n orgx
kubectl exec -n orgx -it enroll-peer2-orgx -- sh
kubectl exec -n orgdcms deploy/fabric-ca-orgdcms --   cp /etc/hyperledger/fabric-ca-server/msp/signcerts/cert.pem -noout -text
kubectl cp orgdcms/$(kubectl get pod -n orgdcms -l app=fabric-ca-orgdcms -o jsonpath='{.items[0].metadata.name}'):/etc/hyperledger/fabric-ca-server/msp/signcerts/cert.pem ./ca-admin-cert.pem
openssl x509 -in ca-admin-cert.pem -noout -text
kubectl scale deploy fabric-ca -n orgdcms --replicas=
kubectl get deploy -n orgdcms
kubectl scale deploy fabric-ca-orgdcms -n orgdcms --replicas=0
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
kubectl run backup-ca --rm -it -n orgdcms --image=busybox --restart=Never   --overrides='{"spec":{"containers":[{"name":"b","image":"busybox","command":["sh","-c","tar czf /out/fabric-ca-orgdcms-backup.tgz /data"],"volumeMounts":[{"name":"v","mountPath":"/data"},{"name":"out","mountPath":"/out"}]}],"volumes":[{"name":"v","persistentVolumeClaim":{"claimName":"fabric-ca-orgdcms-pvc"}},{"name":"out","hostPath":{"path":"/home/asantopadre/backup","type":"Directory"}}]}}'
ls -lh /home/asantopadre/backup
kubectl run backup-ca -n orgdcms --image=busybox --restart=Never   --overrides='{"spec":{"containers":[{"name":"b","image":"busybox","command":["sh","-c","tar czf /out/fabric-ca-orgdcms-backup.tgz /data && sleep 5"],"volumeMounts":[{"name":"v","mountPath":"/data"},{"name":"out","mountPath":"/out"}]}],"volumes":[{"name":"v","persistentVolumeClaim":{"claimName":"fabric-ca-orgdcms-pvc"}},{"name":"out","hostPath":{"path":"/home/asantopadre/backup","type":"Directory"}}]}}'
kubectl logs backup-ca -n orgdcms
ls -ld /home/asantopadre/backup
mkdir -p /home/asantopadre/backup
chmod 755 /home/asantopadre/backup
kubectl delete pod backup-ca -n orgdcms
kubectl run backup-ca -n orgdcms --image=busybox --restart=Never   --overrides='{"spec":{"containers":[{"name":"b","image":"busybox","command":["sh","-c","tar czf /out/fabric-ca-orgdcms-backup.tgz /data && sleep 5"],"volumeMounts":[{"name":"v","mountPath":"/data"},{"name":"out","mountPath":"/out"}]}],"volumes":[{"name":"v","persistentVolumeClaim":{"claimName":"fabric-ca-orgdcms-pvc"}},{"name":"out","hostPath":{"path":"/home/asantopadre/backup","type":"Directory"}}]}}'
kubectl logs backup-ca -n orgdcms
ls -ld /home/asantopadre/backup
kubectl delete pvc fabric-ca-pvc -n orgdcms
kubectl get pvc -n orgdcms
kubectl delete pvc fabric-ca-orgdcms-pvc -n orgdcms
kubectl get pvc -n orgdcms
kubectl delete pvc fabric-ca-orgdcms-pvc -n orgdcms
kubectl get pods -n orgdcms -o wide
kubectl delete pod backup-ca inspect-fabric-ca-orgdcms -n orgdcms
kubectl describe pvc fabric-ca-orgdcms-pvc -n orgdcms
kubectl delete pod copy-orderer2-msp-jmshh -n orgdcms
kubectl delete pod enroll-peer1-orgdcms -n orgdcms
kubectl describe pvc fabric-ca-orgdcms-pvc -n orgdcms
kubectl delete pvc fabric-ca-orgdcms-pvc -n orgdcms
kubectl apply -n orgdcms -f pvc-fabric-ca-orgdcms.yaml
kubectl apply -n orgdcms -f /home/asantopadre/fabric-2.5/manifests/pvc-fabric-ca-orgdcms.yaml
kubectl get pods -n orgdcms -o wide
kubectl get pvc -n orgdcms
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgdcms.yaml
kubectl apply  --dry-run=client -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgdcms.yaml
kubectl apply -f /home/asantopadre/fabric-2.5/manifests/fabric-ca-orgdcms.yaml
kubectl get pods -n orgdcms -l app=fabric-ca-orgdcms
kubectl logs -n orgdcms deploy/fabric-ca-orgdcms | head -50
kubectl get pod -n orgdcms -l app=fabric-ca-orgdcms
kubectl -n orgdcms port-forward svc/fabric-tls-ca 7054:7054
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7054:7054
kubectl get svc -n orgdcms
kubectl port-forward -n orgdcms svc/fabric-ca-orgdcms 7054:7054
kubectl get pvc -n orgdcms 
kubectl get pod -n orgdcms 
export FABRIC_CA_CLIENT_HOME=~/fabric-deploy/peer1-orgdcms
fabric-ca-client enroll   -u https://peer1:peer1pw@localhost:7054   --enrollment.profile tls   --csr.hosts peer1   --csr.hosts peer1.orgdcms.svc.cluster.local   -M ~/fabric-deploy/peer1-orgdcms/tls
cd ~/fabric-deploy/peer1-orgdcms/tls
cp tlscacerts/*.pem ca.crt
cp signcerts/cert.pem server.crt
cp keystore/*_sk server.key
tree
kubectl apply -f init-peer1-pvc.yaml
cd ~/
kubectl apply -f init-peer1-pvc.yaml
kubectl logs -n orgdcms job/init-peer1-crypto
kubectl get pod -n orgdcms 
kubectl run inspect-peer1-pvc   -n orgdcms   --image=busybox:1.36   --restart=Never   --command -- sh -lc "
    echo '--- MSP ---';
    ls -R /msp;
    echo '--- TLS ---';
    ls -R /tls;
    sleep 10
  "   --overrides='
{
  "spec": {
    "containers": [{
      "name": "c",
      "image": "busybox:1.36",
      "command": ["sh","-lc","echo --- MSP ---; ls -R /msp; echo --- TLS ---; ls -R /tls; sleep 10"],
      "volumeMounts": [
        {"name":"msp","mountPath":"/msp"},
        {"name":"tls","mountPath":"/tls"}
      ]
    }],
    "volumes": [
      {"name":"msp","persistentVolumeClaim":{"claimName":"peer1-orgdcms-msp-pvc"}},
      {"name":"tls","persistentVolumeClaim":{"claimName":"peer1-orgdcms-tls-pvc"}}
    ]
  }
}'
kubectl get pod -n orgdcms 
kubectl delete pod inspect-peer1-pvc  -n orgdcms 
kubectl run inspect-peer1-pvc   -n orgdcms   --image=busybox:1.36   --restart=Never   --command -- sh -lc "
    ls -R /msp;
    ls -R /tls;
    sleep 300
  "   --overrides='
{
  "spec": {
    "containers": [{
      "name": "c",
      "image": "busybox:1.36",
      "command": ["sh","-lc","ls -R /msp; ls -R /tls; sleep 300"],
      "volumeMounts": [
        {"name":"msp","mountPath":"/msp"},
        {"name":"tls","mountPath":"/tls"}
      ]
    }],
    "volumes": [
      {"name":"msp","persistentVolumeClaim":{"claimName":"peer1-orgdcms-msp-pvc"}},
      {"name":"tls","persistentVolumeClaim":{"claimName":"peer1-orgdcms-tls-pvc"}}
    ]
  }
}'
kubectl logs -n orgdcms inspect-peer1-pvc
kubectl describe pod -n orgdcms inspect-peer1-pvc
kubectl delete pod inspect-peer1-pvc  -n orgdcms 
kubectl apply -f inspect-peer1-pvc.yaml
kubectl logs -n orgdcms inspect-peer1-pvc
kubectl run clean-peer1-msp   -n orgdcms   --image=busybox:1.36   --restart=Never   --command -- sh -lc "
    rm -rf /msp/*;
    echo cleaned;
    sleep 5
  "   --overrides='
{
  "spec": {
    "containers": [{
      "name": "c",
      "image": "busybox:1.36",
      "command": ["sh","-lc","rm -rf /msp/*; echo cleaned; sleep 5"],
      "volumeMounts": [
        {"name":"msp","mountPath":"/msp"}
      ]
    }],
    "volumes": [
      {"name":"msp","persistentVolumeClaim":{"claimName":"peer1-orgdcms-msp-pvc"}}
    ]
  }
}'
kubectl logs -n orgdcms clean-peer1-msp
kubectl delete job -n orgdcms init-peer1-crypto
kubectl delete job -n orgdcms init-peer1-crypto --cascade=foreground
kubectl get pods -n orgdcms | grep init-peer1
kubectl delete job -n orgdcms init-peer1-pvc --cascade=foreground
kubectl apply -f init-peer1-pvc.yaml
kubectl run clean-peer1-msp   -n orgdcms   --image=busybox:1.36   --restart=Never   --command -- sh -lc "
    rm -rf /msp/*;
    echo cleaned;
    sleep 5
  "   --overrides='
{
  "spec": {
    "containers": [{
      "name": "c",
      "image": "busybox:1.36",
      "command": ["sh","-lc","rm -rf /msp/*; echo cleaned; sleep 5"],
      "volumeMounts": [
        {"name":"msp","mountPath":"/msp"}
      ]
    }],
    "volumes": [
      {"name":"msp","persistentVolumeClaim":{"claimName":"peer1-orgdcms-msp-pvc"}}
    ]
  }
}'
kubectl apply -f inspect-peer1-pvc.yaml
kubectl describe pod -n orgdcms inspect-peer1-pvc
kubectl get pods -n orgdcms
kubectl apply -f init-peer1-pvc.yaml
kubectl apply -f inspect-peer1-pvc.yaml
kubectl logs -n orgdcms inspect-peer1-pvc
kubectl get pods -n orgdcms
kubectl delete job -n orgdcms init-peer1-crypto --cascade=foreground
kubectl apply -f init-peer1-pvc.yaml
kubectl logs -n orgdcms job/init-peer1-crypto-v2
kubectl apply -f inspect-peer1-pvc.yaml
kubectl logs -n orgdcms inspect-peer1-pvc
kubectl run pvc-shell-msp   -n orgdcms --image=busybox:1.36 --restart=Never   --command -- sh -lc "sh"
kubectl get pods -n orgdcms
kubectl delete job -n orgdcms init-peer1-crypto-v2 --cascade=foreground
kubectl delete job -n orgdcms inspect-peer1-pvc --cascade=foreground
kubectl delete job -n orgdcms pvc-shell-msp --cascade=foreground
kubectl delete job -n orgdcms pvc-shell-msp
kubectl get pods -n orgdcms
kubectl delete pod -n orgdcms pvc-shell-msp
kubectl delete pod -n orgdcms inspect-peer1-pvc --cascade=foreground
kubectl apply -f pvc-shell-msp.yaml
kubectl get pods -n orgdcms
kubectl delete pod pvc-shell-msp.yaml
kubectl delete pod pvc-shell-msp
kubectl delete pod -n orgdcms pvc-shell-msp
kubectl apply -f pvc-shell-msp.yaml
kubectl get pods -n orgdcms
kubectl delete pod -n orgdcms pvc-shell-msp
kubectl apply -f pvc-shell-peer1-msp.yaml
kubectl exec -n orgdcms -it pvc-shell-peer1-msp -- sh
kubectl get pods -n orgdcms
kubectl delete pod -n orgdcms clean-peer1-msp
kubectl apply -f peer1-deployment.yaml
kubectl get pods -n orgdcms
kubectl logs -n orgdcms deploy/peer1
kubectl apply -f populate-peer1-pvc.yaml
kubectl logs -n orgdcms populate-peer1-pvc
kubectl delete pod -n orgdcms populate-peer1-pvc
kubectl exec -n orgdcms -it pvc-shell-peer1-msp -- sh
kubectl logs -n orgdcms deploy/peer1
kubectl apply -f peer1-service.yaml
kubectl get svc -n orgdcms
kubectl rollout restart deploy/peer1 -n orgdcms
kubectl get pod -n orgdcms
kubectl logs -n orgdcms deploy/peer1
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
