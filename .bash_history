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
kubectl port-forward -n orgdcms svc/fabric-tls-ca 7052:7052
kubectl port-forward -n orgx svc/fabric-tls-ca 8052:7052
kubectl port-forward -n orgdcms svc/fabric-tls-ca 7052:7052
kubectl port-forward -n orgdcms pod/orderer2-56bc4c565f-qg7bc 7053:7053
kubectl port-forward -n orgdcms svc/fabric-ca 7054:7054
kubectl port-forward -n orgx svc/fabric-ca 8054:7054
kubectl port-forward -n orgdcms svc/fabric-ca 7054:7054
kubectl get ns
kubectl get all,pvc,pv,cm,secret -A -o wide
helm list -A
kubectl describe
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm list -A
kubectl get statefulset,deploy -A
kubectl get svc -A
kubectl describe deployment fabric-ca orderer1 orderer2 peer0 -n orgdcms
kubectl get deployment fabric-ca orderer1 orderer2 peer0 -n orgdcms -o yaml
kubectl get all,pvc,pv,cm,secret -A -o yaml > snapshot-cluster.yaml
kubectl get deploy,statefulset,svc -A -o yaml > snapshot-workloads.yaml
tar czf fabric-deploy-backup.tgz /home/asantopadre/fabric-deploy
kubectl delete ns orderer
kubectl get rs -n orgdcms
kubectl delete rs fabric-ca-6dfc9c6677 fabric-ca-bc5cc48cd orderer1-54c59c8798 orderer1-6b66657bf8 orderer1-6d5c44fbcb orderer1-7465b988fb orderer1-7c9b97f9b8 orderer1-865f456f94 orderer1-894cd5db9 orderer1-8cbff6cd5 orderer1-f4876df6d orderer1-f4c96969b peer0-58c966c499 peer0-5cc84d8b88 peer0-5f76d8c65c peer0-68558bf64c peer0-9bc7f47c7 peer0-b6b8c8796 -n orgdcms
kubectl get rs -n orgdcms
asantopadre@beelink-fabric:~$ kubectl get rs -n orgdcms
NAME                  DESIRED   CURRENT   READY   AGE
fabric-ca-b9848678    1         1         1       7d20h
orderer1-5dc77795f9   1         1         1       26h
orderer2-65ccbf97b8   1         1         1       5d7h
peer0-8578465b4b      1         1         1       7d4h
kubectl get all -n orgdcms
kubectl delete pod net-debug -n orgdcms
kubectl get all -n orgdcms
kubectl get all -n orgx
kubectl delete rs orderer3-6669998894 orderer3-75ccb58f68 orderer3-94679fcb9 orderer3-c9b869858 -n orgx
kubectl get rs -n orgx
kubectl get all -n orgx
kubectl scale deploy orderer2 -n orgdcms --replicas=0
ls -R /home/asantopadre/fabric-deploy/orderer-msps
cd /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/keystore
ls
openssl x509 -in /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/signcerts/cert.pem -pubkey -noout | openssl sha256
cd /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/keystore
for k in *_sk; do   echo "$k:";   openssl pkey -in "$k" -pubout | openssl sha256; done
rm 1cfe354d4cc2281bcbd69568a926c663d28c71e1cfd3aa531470e649da96e062_sk
rm b5644c9c9f91f39a93f38de63f33f1ac32022330beb35247d587652f1344fb51_sk
ls
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl edit deployment orderer2 -n orgdcms
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl logs orderer2-859d84f47f-p8x2l -n orgdcms
kubectl describe pod orderer2-859d84f47f-p8x2l -n orgdcms | grep -A5 -i error
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl edit deployment orderer2 -n orgdcms
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
kubectl describe pod orderer2-859d84f47f-p8x2l -n orgdcms | grep -A5 -i error
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl logs orderer2-859d84f47f-p8x2l -n orgdcms
kubectl logs orderer2-56bc4c565f-mz54m -n orgdcms
cd /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp/config.yaml
cat > /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp/config.yaml <<'EOF'
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

ls /home/asantopadre/fabric-deploy/orderer-msps/orderer2-msp
kubectl scale deployment orderer2 -n orgdcms --replicas=0
kubectl scale deployment orderer2 -n orgdcms --replicas=1
kubectl get pods -n orgdcms
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/orderer2-tls/keystore/*_sk
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/orderer2-tls/keystore/*_sk
cd /home/asantopadre
osnadmin channel list   --orderer-address localhost:7053   --tls-server-name orderer2.orgdcms.svc.cluster.local   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/orderer2-tls/keystore/*_sk
osnadmin channel list   --orderer-address orderer2.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/fabric-deploy/orderer2-tls/tlscacerts/tls-localhost-7054.pem   --client-cert /home/asantopadre/fabric-deploy/orderer2-tls/signcerts/cert.pem   --client-key /home/asantopadre/fabric-deploy/orderer2-tls/keystore/*_sk
kubectl get all,pvc,pv,cm,secret -A -o yaml > snapshot-cluster-$(date +%F).yaml
kubectl get deploy,statefulset,svc -A -o yaml > snapshot-workloads-$(date +%F).yaml
kubectl get all -n orgdcms -o yaml > snapshot-orgdcms-$(date +%F).yaml
kubectl get all -n orgx -o yaml > snapshot-orgx-$(date +%F).yaml
tar czf fabric-deploy-backup-$(date +%F).tgz /home/asantopadre/fabric-deploy
ls -lh snapshot-* fabric-deploy-backup-*.tgz
kubectl delete deployment fabric-ca -n orgdcms
kubectl delete deployment fabric-ca -n orgx
kubectl delete svc fabric-ca -n orgdcms
kubectl delete svc fabric-ca -n orgx
mkdir -p artifacts/ca/{orgdcms,orgx}
cat > artifacts/ca/orgdcms/ca-config.yaml <<'EOF'
version: 1.5.0
ca:
  name: ca-orgdcms
  keyfile: ca-key.pem
  certfile: ca-cert.pem
csr:
  cn: ca-orgdcms
  hosts:
    - fabric-ca
    - fabric-ca.orgdcms.svc.cluster.local
EOF

cat > artifacts/ca/orgdcms/tls-ca-config.yaml <<'EOF'
version: 1.5.0
ca:
  name: tlsca-orgdcms
  keyfile: tls-ca-key.pem
  certfile: tls-ca-cert.pem
csr:
  cn: tlsca-orgdcms
  hosts:
    - fabric-ca
    - fabric-ca.orgdcms.svc.cluster.local
EOF

kubectl apply -f artifacts/ca/orgdcms/fabric-ca-deployment.yaml
cat > artifacts/ca/orgdcms/fabric-ca-deployment.yaml <<'EOF'
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
        - name: fabric-ca
          image: hyperledger/fabric-ca:1.5
          env:
            - name: FABRIC_CA_HOME
              value: /etc/hyperledger/fabric-ca-server
            - name: FABRIC_CA_SERVER_CA_NAME
              value: ca-orgdcms
            - name: FABRIC_CA_SERVER_PORT
              value: "7054"
          ports:
            - containerPort: 7054
          volumeMounts:
            - name: ca-data
              mountPath: /etc/hyperledger/fabric-ca-server
      volumes:
        - name: ca-data
          persistentVolumeClaim:
            claimName: fabric-ca-pvc
EOF

kubectl apply -f artifacts/ca/orgdcms/fabric-ca-deployment.yaml
kubectl get pods -n orgdcms
cat > artifacts/ca/orgdcms/fabric-ca-service.yaml <<'EOF'
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
EOF

kubectl apply -f artifacts/ca/orgdcms/fabric-ca-service.yaml
kubectl get svc fabric-ca -n orgdcms
kubectl logs deploy/fabric-ca -n orgdcms
cat > artifacts/ca/orgdcms/tls-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-tls-ca
  namespace: orgdcms
spec:
  replicas: 1
  selector:
    matchLabels:
      app: fabric-tls-ca
  template:
    metadata:
      labels:
        app: fabric-tls-ca
    spec:
      containers:
        - name: fabric-tls-ca
          image: hyperledger/fabric-ca:1.5
          env:
            - name: FABRIC_CA_HOME
              value: /etc/hyperledger/fabric-ca-server
            - name: FABRIC_CA_SERVER_CA_NAME
              value: tlsca-orgdcms
            - name: FABRIC_CA_SERVER_PORT
              value: "7052"
          ports:
            - containerPort: 7052
          volumeMounts:
            - name: tls-ca-data
              mountPath: /etc/hyperledger/fabric-ca-server
      volumes:
        - name: tls-ca-data
          persistentVolumeClaim:
            claimName: fabric-tls-ca-pvc
EOF

kubectl apply -f artifacts/ca/orgdcms/tls-ca-deployment.yaml
cat > artifacts/ca/orgdcms/tls-ca-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: fabric-tls-ca
  namespace: orgdcms
spec:
  selector:
    app: fabric-tls-ca
  ports:
    - port: 7052
      targetPort: 7052
EOF

kubectl apply -f artifacts/ca/orgdcms/tls-ca-service.yaml
kubectl get pods -n orgdcms
kubectl get svc -n orgdcms | grep ca
kubectl get pods -n orgdcms
kubectl get svc -n orgdcms | grep ca
kubectl get pvc -n orgdcms
kubectl describe pod fabric-tls-ca-7669cc9b9c-wwgvd -n orgdcms
cat > artifacts/ca/orgdcms/fabric-tls-ca-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fabric-tls-ca-pvc
  namespace: orgdcms
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
  storageClassName: local-path
EOF

kubectl apply -f artifacts/ca/orgdcms/fabric-tls-ca-pvc.yaml
kubectl rollout restart deploy/fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms
cat > artifacts/ca/orgx/fabric-ca-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fabric-ca-pvc
  namespace: orgx
spec:
  accessModes: [ReadWriteOnce]
  resources:
    requests:
      storage: 2Gi
  storageClassName: local-path
EOF

kubectl apply -f artifacts/ca/orgx/fabric-ca-pvc.yaml
cat > artifacts/ca/orgx/fabric-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-ca
  namespace: orgx
spec:
  replicas: 1
  selector:
    matchLabels: { app: fabric-ca }
  template:
    metadata:
      labels: { app: fabric-ca }
    spec:
      containers:
      - name: fabric-ca
        image: hyperledger/fabric-ca:1.5
        env:
        - name: FABRIC_CA_HOME
          value: /etc/hyperledger/fabric-ca-server
        - name: FABRIC_CA_SERVER_CA_NAME
          value: ca-orgx
        - name: FABRIC_CA_SERVER_PORT
          value: "7054"
        ports:
        - containerPort: 7054
        volumeMounts:
        - name: ca-data
          mountPath: /etc/hyperledger/fabric-ca-server
      volumes:
      - name: ca-data
        persistentVolumeClaim:
          claimName: fabric-ca-pvc
EOF

kubectl apply -f artifacts/ca/orgx/fabric-ca-deployment.yaml
cat > artifacts/ca/orgx/fabric-ca-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: fabric-ca
  namespace: orgx
spec:
  selector: { app: fabric-ca }
  ports:
  - port: 7054
    targetPort: 7054
EOF

kubectl apply -f artifacts/ca/orgx/fabric-ca-service.yaml
cat > artifacts/ca/orgx/fabric-tls-ca-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fabric-tls-ca-pvc
  namespace: orgx
spec:
  accessModes: [ReadWriteOnce]
  resources:
    requests:
      storage: 2Gi
  storageClassName: local-path
EOF

kubectl apply -f artifacts/ca/orgx/fabric-tls-ca-pvc.yaml
cat > artifacts/ca/orgx/tls-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-tls-ca
  namespace: orgx
spec:
  replicas: 1
  selector:
    matchLabels: { app: fabric-tls-ca }
  template:
    metadata:
      labels: { app: fabric-tls-ca }
    spec:
      containers:
      - name: fabric-tls-ca
        image: hyperledger/fabric-ca:1.5
        env:
        - name: FABRIC_CA_HOME
          value: /etc/hyperledger/fabric-ca-server
        - name: FABRIC_CA_SERVER_CA_NAME
          value: tlsca-orgx
        - name: FABRIC_CA_SERVER_PORT
          value: "7052"
        ports:
        - containerPort: 7052
        volumeMounts:
        - name: tls-ca-data
          mountPath: /etc/hyperledger/fabric-ca-server
      volumes:
      - name: tls-ca-data
        persistentVolumeClaim:
          claimName: fabric-tls-ca-pvc
EOF

kubectl apply -f artifacts/ca/orgx/tls-ca-deployment.yaml
cat > artifacts/ca/orgx/tls-ca-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: fabric-tls-ca
  namespace: orgx
spec:
  selector: { app: fabric-tls-ca }
  ports:
  - port: 7052
    targetPort: 7052
EOF

kubectl apply -f artifacts/ca/orgx/tls-ca-service.yaml
kubectl get pods -n orgx
kubectl get svc -n orgx | grep ca
export ORG=orgdcms
export CA_HOST=fabric-ca.${ORG}.svc.cluster.local
export TLS_CA_HOST=fabric-tls-ca.${ORG}.svc.cluster.local
export CA_URL=https://${CA_HOST}:7054
export TLS_CA_URL=https://${TLS_CA_HOST}:7052
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/${ORG}/admin
fabric-ca-client enroll   -u https://admin:adminpw@${CA_HOST}:7054   --tls.certfiles /etc/hyperledger/fabric-ca-server/ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem   > artifacts/ca/orgdcms/ca-cert.pem
fabric-ca-client enroll   -u https://admin:adminpw@${CA_HOST}:7054   --tls.certfiles artifacts/ca/orgdcms/ca-cert.pem
export CA_CERT=$HOME/artifacts/ca/orgdcms/ca-cert.pem
fabric-ca-client enroll   -u https://admin:adminpw@${CA_HOST}:7054   --tls.certfiles ${CA_CERT}
export CA_HOST=localhost
export CA_URL=https://localhost:7054
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles ${CA_CERT}
fabric-ca-client enroll   -u http://admin:adminpw@localhost:7054
rm -rf runtime/orgdcms/admin
kubectl patch deployment fabric-ca -n orgdcms --type='json' -p='[
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_TLS_ENABLED","value":"true"}},
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_TLS_CERTFILE","value":"/etc/hyperledger/fabric-ca-server/ca-cert.pem"}},
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_TLS_KEYFILE","value":"/etc/hyperledger/fabric-ca-server/ca-key.pem"}}
]'
kubectl patch deployment fabric-tls-ca -n orgdcms --type='json' -p='[
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_TLS_ENABLED","value":"true"}},
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_TLS_CERTFILE","value":"/etc/hyperledger/fabric-ca-server/tls-ca-cert.pem"}},
  {"op":"add","path":"/spec/template/spec/containers/0/env/-","value":{"name":"FABRIC_CA_SERVER_TLS_KEYFILE","value":"/etc/hyperledger/fabric-ca-server/tls-ca-key.pem"}}
]'
kubectl rollout restart deploy/fabric-ca -n orgdcms
kubectl rollout restart deploy/fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms
kubectl rollout undo deploy/fabric-ca -n orgdcms
kubectl rollout undo deploy/fabric-tls-ca -n orgdcms
kubectl get pods -n orgdcms
# orgdcms
kubectl delete deploy fabric-ca fabric-tls-ca -n orgdcms
kubectl delete svc fabric-ca fabric-tls-ca -n orgdcms
kubectl delete pvc fabric-ca-pvc fabric-tls-ca-pvc -n orgdcms
# orgx
kubectl delete deploy fabric-ca fabric-tls-ca -n orgx
kubectl delete svc fabric-ca fabric-tls-ca -n orgx
kubectl delete pvc fabric-ca-pvc fabric-tls-ca-pvc -n orgx
kubectl apply -f artifacts/ca/orgdcms/fabric-ca-pvc.yaml
kubectl apply -f artifacts/ca/orgdcms/fabric-tls-ca-pvc.yaml
kubectl apply -f artifacts/ca/orgx/fabric-ca-pvc.yaml
kubectl apply -f artifacts/ca/orgx/fabric-tls-ca-pvc.yaml
kubectl apply -f artifacts/ca/orgdcms/fabric-ca-deployment-tls.yaml
kubectl apply -f artifacts/ca/orgdcms/tls-ca-deployment-tls.yaml
kubectl apply -f artifacts/ca/orgx/fabric-ca-deployment-tls.yaml
kubectl apply -f artifacts/ca/orgx/tls-ca-deployment-tls.yaml
cat > artifacts/ca/orgdcms/fabric-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-ca
  namespace: orgdcms
spec:
  replicas: 1
  selector:
    matchLabels: { app: fabric-ca }
  template:
    metadata:
      labels: { app: fabric-ca }
    spec:
      containers:
      - name: fabric-ca
        image: hyperledger/fabric-ca:1.5
        env:
        - name: FABRIC_CA_HOME
          value: /etc/hyperledger/fabric-ca-server
        - name: FABRIC_CA_SERVER_CA_NAME
          value: ca-orgdcms
        - name: FABRIC_CA_SERVER_PORT
          value: "7054"
        - name: FABRIC_CA_SERVER_TLS_ENABLED
          value: "true"
        - name: FABRIC_CA_SERVER_TLS_CERTFILE
          value: /etc/hyperledger/fabric-ca-server/ca-cert.pem
        - name: FABRIC_CA_SERVER_TLS_KEYFILE
          value: /etc/hyperledger/fabric-ca-server/ca-key.pem
        ports:
        - containerPort: 7054
        volumeMounts:
        - name: ca-data
          mountPath: /etc/hyperledger/fabric-ca-server
      volumes:
      - name: ca-data
        persistentVolumeClaim:
          claimName: fabric-ca-pvc
EOF

cat > artifacts/ca/orgdcms/tls-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-tls-ca
  namespace: orgdcms
spec:
  replicas: 1
  selector:
    matchLabels: { app: fabric-tls-ca }
  template:
    metadata:
      labels: { app: fabric-tls-ca }
    spec:
      containers:
      - name: fabric-tls-ca
        image: hyperledger/fabric-ca:1.5
        env:
        - name: FABRIC_CA_HOME
          value: /etc/hyperledger/fabric-ca-server
        - name: FABRIC_CA_SERVER_CA_NAME
          value: tlsca-orgdcms
        - name: FABRIC_CA_SERVER_PORT
          value: "7052"
        - name: FABRIC_CA_SERVER_TLS_ENABLED
          value: "true"
        - name: FABRIC_CA_SERVER_TLS_CERTFILE
          value: /etc/hyperledger/fabric-ca-server/tls-ca-cert.pem
        - name: FABRIC_CA_SERVER_TLS_KEYFILE
          value: /etc/hyperledger/fabric-ca-server/tls-ca-key.pem
        ports:
        - containerPort: 7052
        volumeMounts:
        - name: tls-ca-data
          mountPath: /etc/hyperledger/fabric-ca-server
      volumes:
      - name: tls-ca-data
        persistentVolumeClaim:
          claimName: fabric-tls-ca-pvc
EOF

kubectl apply -f artifacts/ca/orgdcms/fabric-ca-deployment.yaml
kubectl apply -f artifacts/ca/orgdcms/tls-ca-deployment.yaml
kubectl apply -f artifacts/ca/orgdcms/fabric-ca-service.yaml
kubectl apply -f artifacts/ca/orgdcms/tls-ca-service.yaml
kubectl get pods -n orgdcms
kubectl get pvc -n orgdcms
kubectl logs deploy/fabric-tls-ca -n orgdcms
kubectl edit deploy fabric-tls-ca -n orgdcms
kubectl rollout restart deploy fabric-tls-ca -n orgdcms
kubectl get pvc -n orgdcms
kubectl get pods -n orgdcms
kubectl apply -f artifacts/ca/orgdcms/fabric-ca-pvc.yaml
cat > artifacts/ca/orgdcms/fabric-ca-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fabric-ca-pvc
  namespace: orgdcms
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
  storageClassName: local-path
EOF

kubectl apply -f artifacts/ca/orgdcms/fabric-ca-pvc.yaml
kubectl rollout restart deploy/fabric-ca -n orgdcms
kubectl get pods -n orgdcms
kubectl edit deploy fabric-ca -n orgdcms
kubectl rollout restart deploy/fabric-ca -n orgdcms
kubectl get pods -n orgdcms
cat > artifacts/ca/orgx/fabric-ca-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fabric-ca-pvc
  namespace: orgx
spec:
  accessModes: [ReadWriteOnce]
  resources: { requests: { storage: 2Gi } }
  storageClassName: local-path
EOF

cat > artifacts/ca/orgx/fabric-tls-ca-pvc.yaml <<'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: fabric-tls-ca-pvc
  namespace: orgx
spec:
  accessModes: [ReadWriteOnce]
  resources: { requests: { storage: 2Gi } }
  storageClassName: local-path
EOF

kubectl apply -f artifacts/ca/orgx/
cat > artifacts/ca/orgx/fabric-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-ca
  namespace: orgx
spec:
  replicas: 1
  selector: { matchLabels: { app: fabric-ca } }
  template:
    metadata: { labels: { app: fabric-ca } }
    spec:
      containers:
      - name: fabric-ca
        image: hyperledger/fabric-ca:1.5
        env:
        - { name: FABRIC_CA_HOME, value: /etc/hyperledger/fabric-ca-server }
        - { name: FABRIC_CA_SERVER_CA_NAME, value: ca-orgx }
        - { name: FABRIC_CA_SERVER_PORT, value: "7054" }
        - { name: FABRIC_CA_SERVER_TLS_ENABLED, value: "true" }
        ports: [{ containerPort: 7054 }]
        volumeMounts:
        - { name: ca-data, mountPath: /etc/hyperledger/fabric-ca-server }
      volumes:
      - name: ca-data
        persistentVolumeClaim: { claimName: fabric-ca-pvc }
EOF

cat > artifacts/ca/orgx/tls-ca-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fabric-tls-ca
  namespace: orgx
spec:
  replicas: 1
  selector: { matchLabels: { app: fabric-tls-ca } }
  template:
    metadata: { labels: { app: fabric-tls-ca } }
    spec:
      containers:
      - name: fabric-tls-ca
        image: hyperledger/fabric-ca:1.5
        env:
        - { name: FABRIC_CA_HOME, value: /etc/hyperledger/fabric-ca-server }
        - { name: FABRIC_CA_SERVER_CA_NAME, value: tlsca-orgx }
        - { name: FABRIC_CA_SERVER_PORT, value: "7052" }
        - { name: FABRIC_CA_SERVER_TLS_ENABLED, value: "true" }
        ports: [{ containerPort: 7052 }]
        volumeMounts:
        - { name: tls-ca-data, mountPath: /etc/hyperledger/fabric-ca-server }
      volumes:
      - name: tls-ca-data
        persistentVolumeClaim: { claimName: fabric-tls-ca-pvc }
EOF

cat > artifacts/ca/orgx/fabric-ca-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata: { name: fabric-ca, namespace: orgx }
spec:
  selector: { app: fabric-ca }
  ports: [{ port: 7054, targetPort: 7054 }]
EOF

cat > artifacts/ca/orgx/tls-ca-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata: { name: fabric-tls-ca, namespace: orgx }
spec:
  selector: { app: fabric-tls-ca }
  ports: [{ port: 7052, targetPort: 7052 }]
EOF

kubectl apply -f artifacts/ca/orgx/
kubectl get pods -n orgx
kubectl get svc -n orgx | grep ca
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/admin
export CA_CERT=$HOME/artifacts/ca/orgdcms/ca-cert.pem
export TLS_CA_CERT=$HOME/artifacts/ca/orgdcms/tls-ca-cert.pem
kubectl exec -n orgdcms deploy/fabric-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > $CA_CERT
kubectl exec -n orgdcms deploy/fabric-tls-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > $TLS_CA_CERT
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles $CA_CERT
kubectl logs deploy/fabric-ca -n orgdcms
openssl x509 -in $CA_CERT -noout -subject -issuer
kubectl logs deploy/fabric-ca -n orgdcms | grep -i bootstrap
ubectl edit deploy fabric-ca -n orgdcms
kubectl edit deploy fabric-ca -n orgdcms
kubectl rollout restart deploy/fabric-ca -n orgdcms
fabric-ca-client register   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles $CA_CERT
kubectl rollout restart deploy/fabric-ca -n orgdcms
FABRIC_CA_CLIENT_DEBUG=true fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles $CA_CERT
kubectl rollout restart deploy/fabric-ca -n orgdcms
fabric-ca-client register   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles $CA_CERT
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles $CA_CERT
kubectl logs deploy/fabric-ca -n orgdcms
FABRIC_CA_CLIENT_DEBUG=true fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles $CA_CERT
FABRIC_CA_CLIENT_DEBUG=true fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles $CA_CERT
fabric-ca-client register   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles $CA_CERT
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7054   -M $FABRIC_CA_CLIENT_HOME/msp   --tls.certfiles $CA_CERT
fabric-ca-client enroll   -u https://orgdcms-admin:orgdcms-adminpw@localhost:7052   --enrollment.profile tls   -M $FABRIC_CA_CLIENT_HOME/tls   --tls.certfiles $TLS_CA_CERT
fabric-ca-client register   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles $TLS_CA_CERT   -u https://admin:adminpw@localhost:7052
kubectl edit deploy fabric-tls-ca -n orgdcms
kubectl rollout restart deploy/fabric-tls-ca -n orgdcms
fabric-ca-client register   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles $TLS_CA_CERT   -u https://admin:adminpw@localhost:7052
fabric-ca-client register   --caname tlsca-orgdcms   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   -u https://admin:adminpw@localhost:7052   --tls.certfiles $TLS_CA_CERT
fabric-ca-client enroll   --caname tlsca-orgdcms   -u https://admin:adminpw@localhost:7052   --tls.certfiles $TLS_CA_CERT
fabric-ca-client register   --caname tlsca-orgdcms   --id.name orgdcms-admin   --id.secret orgdcms-adminpw   --id.type admin   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/tls-admin
fabric-ca-client enroll --caname tlsca-orgdcms -u https://admin:adminpw@localhost:7052 --tls.certfiles $TLS_CA_CERT
fabric-ca-client register --caname tlsca-orgdcms --id.name orgdcms-admin --id.secret orgdcms-adminpw --id.type admin --tls.certfiles $TLS_CA_CERT
fabric-ca-client enroll --caname tlsca-orgdcms -u https://orgdcms-admin:orgdcms-adminpw@localhost:7052 --enrollment.profile tls -M $PWD/runtime/orgdcms/admin/tls --tls.certfiles $TLS_CA_CERT
ls runtime/orgdcms/admin/
ls runtime/orgdcms/admin/tls
ls runtime/orgdcms/admin/msp
openssl x509 -in runtime/orgdcms/admin/tls/signcerts/cert.pem -noout -subject -issuer
ls runtime/orgdcms/admin/msp/{cacerts,keystore,signcerts}
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgx/admin
export CA_CERT=$HOME/artifacts/ca/orgx/ca-cert.pem
export TLS_CA_CERT=$HOME/artifacts/ca/orgx/tls-ca-cert.pem
kubectl exec -n orgx deploy/fabric-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > $CA_CERT
kubectl exec -n orgx deploy/fabric-tls-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem > $TLS_CA_CERT
fabric-ca-client enroll   -u https://admin:adminpw@localhost:8054   --tls.certfiles $CA_CERT
fabric-ca-client enroll   -u https://admin:adminpw@localhost:8054   --tls.certfiles $CA_CERT
fabric-ca-client register   --id.name orgx-admin   --id.secret orgx-adminpw   --id.type admin   --tls.certfiles $CA_CERT
fabric-ca-client enroll   -u https://orgx-admin:orgx-adminpw@localhost:8054   -M $FABRIC_CA_CLIENT_HOME/msp   --tls.certfiles $CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgx/tls-admin
fabric-ca-client enroll   --caname tlsca-orgx   -u https://admin:adminpw@localhost:8052   --tls.certfiles $TLS_CA_CERT
fabric-ca-client register   --caname tlsca-orgx   --id.name orgx-admin   --id.secret orgx-adminpw   --id.type admin   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgx/admin
fabric-ca-client enroll   --caname tlsca-orgx   -u https://orgx-admin:orgx-adminpw@localhost:8052   --enrollment.profile tls   -M $FABRIC_CA_CLIENT_HOME/tls   --tls.certfiles $TLS_CA_CERT
# orgdcms
kubectl delete deploy orderer1 orderer2 -n orgdcms
kubectl delete svc orderer1 orderer2 -n orgdcms
# orgx
kubectl delete deploy orderer3 -n orgx
kubectl delete svc orderer3 -n orgx
mkdir -p runtime/orgdcms/orderer{1,2}/{msp,tls}
cp -r runtime/orgdcms/admin/msp runtime/orgdcms/orderer1/
cp -r runtime/orgdcms/admin/tls runtime/orgdcms/orderer1/
cp -r runtime/orgdcms/admin/msp runtime/orgdcms/orderer2/
cp -r runtime/orgdcms/admin/tls runtime/orgdcms/orderer2/
openssl x509 -in runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/tls-admin
fabric-ca-client register --caname tlsca-orgdcms   --id.name orderer1 --id.secret orderer1pw --id.type orderer   --tls.certfiles $TLS_CA_CERT
fabric-ca-client register --caname tlsca-orgdcms   --id.name orderer2 --id.secret orderer2pw --id.type orderer   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/tls-admin
fabric-ca-client register --caname tlsca-orgdcms   --id.name orderer1 --id.secret orderer1pw --id.type orderer   --tls.certfiles $TLS_CA_CERT
fabric-ca-client register --caname tlsca-orgdcms   --id.name orderer2 --id.secret orderer2pw --id.type orderer   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/orderer1
fabric-ca-client enroll --caname tlsca-orgdcms   -u https://orderer1:orderer1pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local   -M tls --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/orderer2
fabric-ca-client enroll --caname tlsca-orgdcms   -u https://orderer2:orderer2pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M tls --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/orderer1
fabric-ca-client enroll --caname tlsca-orgdcms   -u https://orderer1:orderer1pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local   -M tls --tls.certfiles $TLS_CA_CERT
kubectl exec -n orgdcms deploy/fabric-tls-ca --   cat /etc/hyperledger/fabric-ca-server/ca-cert.pem   > artifacts/ca/orgdcms/tls-ca-cert.pem
export TLS_CA_CERT=$HOME/artifacts/ca/orgdcms/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/orderer1
fabric-ca-client enroll   --caname tlsca-orgdcms   -u https://orderer1:orderer1pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local   -M tls   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/tls-admin
fabric-ca-client register   --caname tlsca-orgdcms   --id.name orderer1   --id.secret orderer1pw   --id.type orderer   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/orderer1
fabric-ca-client enroll   --caname tlsca-orgdcms   -u https://orderer1:orderer1pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local   -M tls   --tls.certfiles $TLS_CA_CERT
openssl x509 -in runtime/orgdcms/orderer1/tls/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/tls-admin
fabric-ca-client register   --caname tlsca-orgdcms   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles $TLS_CA_CERT
export FABRIC_CA_CLIENT_HOME=$PWD/runtime/orgdcms/orderer2
fabric-ca-client enroll   --caname tlsca-orgdcms   -u https://orderer2:orderer2pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer2,orderer2.orgdcms.svc.cluster.local   -M tls   --tls.certfiles $TLS_CA_CERT
openssl x509 -in runtime/orgdcms/orderer2/tls/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
cat > artifacts/orderer/orgdcms/orderer1-service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: orderer1
  namespace: orgdcms
spec:
  selector: { app: orderer1 }
  ports:
  - name: grpc
    port: 7050
    targetPort: 7050
  - name: admin
    port: 7053
    targetPort: 7053
EOF

kubectl apply -f artifacts/orderer/orgdcms/orderer1-service.yaml
mkdir -p artifacts/orderer/orgdcms
cat > artifacts/orderer/orgdcms/orderer1-service.yaml <<'EOF'
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
  - name: admin
    port: 7053
    targetPort: 7053
EOF

kubectl apply -f artifacts/orderer/orgdcms/orderer1-service.yaml
cat > artifacts/orderer/orgdcms/orderer1-deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: orderer1
  namespace: orgdcms
spec:
  replicas: 1
  selector:
    matchLabels:
      app: orderer1
  template:
    metadata:
      labels:
        app: orderer1
    spec:
      containers:
      - name: orderer
        image: hyperledger/fabric-orderer:2.4
        env:
        - name: ORDERER_GENERAL_LISTENADDRESS
          value: "0.0.0.0"
        - name: ORDERER_GENERAL_LISTENPORT
          value: "7050"
        - name: ORDERER_GENERAL_LOCALMSPID
          value: OrgDCMSOrdererMSP
        - name: ORDERER_GENERAL_LOCALMSPDIR
          value: /var/hyperledger/orderer/msp
        - name: ORDERER_GENERAL_TLS_ENABLED
          value: "true"
        - name: ORDERER_GENERAL_TLS_PRIVATEKEY
          value: /var/hyperledger/orderer/tls/keystore/key.pem
        - name: ORDERER_GENERAL_TLS_CERTIFICATE
          value: /var/hyperledger/orderer/tls/signcerts/cert.pem
        - name: ORDERER_GENERAL_TLS_ROOTCAS
          value: /var/hyperledger/orderer/tls/tlscacerts/*.pem
        - name: ORDERER_ADMIN_LISTENADDRESS
          value: "0.0.0.0:7053"
        - name: ORDERER_ADMIN_TLS_ENABLED
          value: "true"
        - name: ORDERER_ADMIN_TLS_CERTIFICATE
          value: /var/hyperledger/orderer/tls/signcerts/cert.pem
        - name: ORDERER_ADMIN_TLS_PRIVATEKEY
          value: /var/hyperledger/orderer/tls/keystore/key.pem
        volumeMounts:
        - name: msp
          mountPath: /var/hyperledger/orderer/msp
        - name: tls
          mountPath: /var/hyperledger/orderer/tls
      volumes:
      - name: msp
        hostPath:
          path: /home/asantopadre/runtime/orgdcms/orderer1/msp
      - name: tls
        hostPath:
          path: /home/asantopadre/runtime/orgdcms/orderer1/tls
EOF

kubectl apply -f artifacts/orderer/orgdcms/orderer1-deployment.yaml
kubectl get pods -n orgdcms
kubectl logs deploy/orderer1 -n orgdcms | head
kubectl get pods -n orgdcms
kubectl logs deploy/orderer1 -n orgdcms | head
kubectl logs deploy/orderer1 -n orgdcms
mkdir -p runtime/orgdcms/orderer1/msp/admincerts
cp runtime/orgdcms/admin/msp/signcerts/cert.pem runtime/orgdcms/orderer1/msp/admincerts/
mkdir -p runtime/orgdcms/orderer2/msp/admincerts
cp runtime/orgdcms/admin/msp/signcerts/cert.pem runtime/orgdcms/orderer2/msp/admincerts/
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms
cp runtime/orgdcms/admin/msp/config.yaml runtime/orgdcms/orderer1/msp/
cat > runtime/orgdcms/admin/msp/config.yaml <<'EOF'
NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/ca-cert.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/ca-cert.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/ca-cert.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/ca-cert.pem
    OrganizationalUnitIdentifier: orderer
EOF

cp runtime/orgdcms/admin/msp/config.yaml runtime/orgdcms/orderer1/msp/
cp runtime/orgdcms/admin/msp/config.yaml runtime/orgdcms/orderer2/msp/
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs orderer1-5b49cb44cf-q8zb6 -n orgdcms
mkdir -p runtime/orgdcms/orderer1/msp/cacerts
cp runtime/orgdcms/admin/msp/cacerts/*.pem runtime/orgdcms/orderer1/msp/cacerts/ca-cert.pem
ls runtime/orgdcms/orderer1/tls/keystore
cd runtime/orgdcms/orderer1/tls/keystore
ls *_sk | head -n 1
cd runtime/orgdcms/orderer1/tls/keystore
find runtime/orgdcms/orderer1 -type f | grep _sk
ls runtime/orgdcms
ls runtime/orgdcms/orderer1/tls/keystore
cd hone/asantopadre
cd home/asantopadre
cd /home/asantopadre
cd runtime
ls ~runtime/orgdcms/orderer1/tls/keystore
cd orgdcms
cd orderer1
cd tls
cd keystore
ls
kubectl describe pod orderer1 -n orgdcms | grep -A5 Mounts
ls -R /home/asantopadre/runtime/orgdcms/orderer1/msp
cp /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/localhost-7054.pem    /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/ca-cert.pem
ls -R /home/asantopadre/runtime/orgdcms/orderer1/msp
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore
mv /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/*_sk    /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
mv /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/f5928bc48ce89e7fa9a1104c420decc1a2cbc9122decdfb3f14c17ffa3e468a8_sk    /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
rm /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/*_sk
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -pubkey > /tmp/cert.pub
for k in /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/*_sk; do   openssl pkey -in "$k" -pubout | diff - /tmp/cert.pub >/dev/null && echo "MATCH: $k"; done
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -modulus
openssl pkey -in /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem -pubout | openssl rsa -pubin -noout -modulus
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -pubkey > /tmp/cert.pub
openssl pkey -in /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem -pubout > /tmp/key.pub
diff /tmp/cert.pub /tmp/key.pub
rm -rf /home/asantopadre/runtime/orgdcms/orderer1/tls
mkdir -p /home/asantopadre/runtime/orgdcms/orderer1/tls
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/orgdcms/orderer1
fabric-ca-client enroll   --caname tlsca-orgdcms   -u https://orderer1:orderer1pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer1,orderer1.orgdcms.svc.cluster.local   -M tls   --tls.certfiles $TLS_CA_CERT
ls tls/keystore
mv tls/keystore/*_sk tls/keystore/key.pem
ls tls/keystore
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore
mv /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/*_sk    /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -pubkey > /tmp/cert.pub
openssl pkey -in /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem -pubout > /tmp/key.pub
diff /tmp/cert.pub /tmp/key.pub
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms
orderer1-55b4c499c7-dwgkr        0/1     CrashLoopBackOff   6 (4m6s ago)    9m56s
orderer1-6f89564479-knhsb        0/1     Error              1 (9s ago)      10s
kubectl logs orderer1-6f89564479-knhsb -n orgdcms
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts
kubectl apply -f artifacts/orderer/orgdcms/orderer1-deployment.yaml
ls /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts
kubectl set env deploy/orderer1 -n orgdcms   ORDERER_GENERAL_TLS_ROOTCAS=/var/hyperledger/orderer/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem
kubectl rollout restart deploy/orderer1 -n orgdcm
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl get pods -n orgdcms
kubectl logs orderer1-5796f44895-4nhh2 -n orgdcms
configtxgen   -profile EtcdRaft   -channelID system-channel   -outputBlock genesis.block
export FABRIC_CFG_PATH=/home/asantopadre/artifacts/configtx
kubectl set env deploy/orderer1 -n orgdcms   ORDERER_GENERAL_BOOTSTRAPMETHOD=none
kubectl rollout restart deploy/orderer1 -n orgdcms
kubectl logs deploy/orderer1 -n orgdcms | tail
kubectl get pods -n orgdcms
kubectl delete deployment orderer2 -n orgdcms
kubectl delete service orderer2 -n orgdcms
# nessuna delete pvc
# 1) Register su TLS-CA
fabric-ca-client register   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles tls-ca-cert.pem
# verifica dove sta davvero il TLS CA cert
ls ~/runtime/orgdcms/tls-ca/tlscacerts
openssl x509 -in runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
openssl x509 -in runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -text | grep -A1 "Subject Alternative Name"
ls ~/runtime/orgdcms/tls-ca/tlscacerts
find ~ -name "*tls-ca*.pem"
# Register su TLS-CA (orgdcms)
fabric-ca-client register   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
# Login come TLS-CA admin (orgdcms)
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgdcms
fabric-ca-client enroll   -u https://tls-ca-admin:tls-ca-adminpw@ca-orgdcms:7054   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgdcms
fabric-ca-client enroll   -u https://tls-ca-admin:tls-ca-adminpw@localhost:7054   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/tls-ca-cert.pem
openssl s_client -connect localhost:7054 -showcerts </dev/null
# Salva il cert
cat > /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem <<'EOF'
-----BEGIN CERTIFICATE-----
MIICjzCCAjWgAwIBAgIUDZCBYUUUCvR25FPVrzVG0GI/S3kwCgYIKoZIzj0EAwIw
aDELMAkGA1UEBhMCVVMxFzAVBgNVBAgTDk5vcnRoIENhcm9saW5hMRQwEgYDVQQK
EwtIeXBlcmxlZGdlcjEPMA0GA1UECxMGRmFicmljMRkwFwYDVQQDExBmYWJyaWMt
Y2Etc2VydmVyMB4XDTI2MDExMjE2MTAwMFoXDTI3MDExMjE2MTAwMFowcjELMAkG
A1UEBhMCVVMxFzAVBgNVBAgTDk5vcnRoIENhcm9saW5hMRQwEgYDVQQKEwtIeXBl
cmxlZGdlcjEPMA0GA1UECxMGRmFicmljMSMwIQYDVQQDExpmYWJyaWMtY2EtNjc3
YjU2Yzk4ZC05OThjaDBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABDHfasbCtTQ4
NujIMPXZK/cEzD+zXZFgaMO5miEAopcL2vVYhQFP1lY2qdqvoyI8jeZmgBTrLlp8
oyZhKe6yD4qjgbIwga8wDgYDVR0PAQH/BAQDAgOoMB0GA1UdJQQWMBQGCCsGAQUF
BwMBBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBT8IieRqlpiBsmp
o+BiSgAIw5GnXTAfBgNVHSMEGDAWgBSGcLko6bRRr6208G+TRbKiVKt8yzAwBgNV
HREEKTAnghpmYWJyaWMtY2EtNjhkNDg0Nzg4OC1rNTJoeoIJbG9jYWxob3N0MAoG
CCqGSM49BAMCA0gAMEUCIQDe2XPtQFjbS7dim2o4LTzjG0TIzVbWgmz224coK0I2
8gIgda/2FDEXdONzk8YinxLFp/xFTU8QtOc05m6SV3zmw+s=
-----END CERTIFICATE-----
EOF

# Enroll TLS-CA admin (orgdcms)
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgdcms
fabric-ca-client enroll   -u https://tls-ca-admin:tls-ca-adminpw@localhost:7054   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
kubectl get deployment ca-orgdcms -n orgdcms -o yaml | grep -A4 FABRIC_CA_SERVER_CA_NAME
kubectl get deployment ca-orgdcms -n orgdcms -o yaml | grep -A6 FABRIC_CA_SERVER_BOOTSTRAP_USER
kubectl get deployment -n orgdcms
kubectl get deployment fabric-ca -n orgdcms -o yaml | grep -A6 FABRIC_CA_SERVER_BOOTSTRAP_USER
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgdcms
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --caname ca-orgdcms   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
fabric-ca-client register   --caname ca-orgdcms   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgdcms
fabric-ca-client register   --caname ca-orgdcms   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
nano /home/asantopadre/runtime/ca-tls-orgdcms/fabric-ca-client-config.yaml
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgdcms
fabric-ca-client register   --caname ca-orgdcms   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
nano /home/asantopadre/runtime/ca-tls-orgdcms/fabric-ca-client-config.yaml
fabric-ca-client register   --caname ca-orgdcms   --id.name orderer2   --id.secret orderer2pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
mkdir -p /home/asantopadre/runtime/orgdcms/orderer2/tls
# Enroll TLS orderer2 con SAN
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --caname ca-orgdcms   --enrollment.profile tls   --csr.hosts orderer2   --csr.hosts orderer2.orgdcms.svc.cluster.local   -M /home/asantopadre/runtime/orgdcms/orderer2/tls   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
# 1) Verifica file TLS
ls /home/asantopadre/runtime/orgdcms/orderer2/tls/{signcerts,keystore,tlscacerts}
# 2) Verifica cert/key leggibili
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -subject
openssl pkey -in /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/* -noout
# 3) Confronto variabili con orderer1
kubectl get deployment orderer1 -n orgdcms -o yaml | grep ORDERER_GENERAL_
kubectl get deployment orderer2 -n orgdcms -o yaml | grep ORDERER_GENERAL_
# 4) Check canali non ancora joinati (prima del deploy)
kubectl get pod -n orgdcms | grep or
ls /home/asantopadre/runtime/orgdcms/orderer2/tls/{signcerts,keystore,tlscacerts}
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -subject
openssl pkey -in /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/* -noout
kubectl get deployment orderer1 -n orgdcms -o yaml | grep ORDERER_GENERAL_
kubectl get deployment orderer2 -n orgdcms -o yaml | grep ORDERER_GENERAL_
kubectl get deployment orderer1 -n orgdcms -o yaml > /tmp/orderer1.yaml
cat orderer2-deployment.yaml | grep ORDERER_GENERAL_
grep ORDERER_GENERAL_ /tmp/orderer1.yaml
ls /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts
kubectl apply -f orderer2-deployment.yaml -n orgdcms
kubectl get deployment orderer1 -n orgdcms -o yaml > /tmp/orderer1.yaml
sed   -e 's/name: orderer1/name: orderer2/g'   -e 's/app: orderer1/app: orderer2/g'   -e 's|runtime/orgdcms/orderer1|runtime/orgdcms/orderer2|g'   /tmp/orderer1.yaml > /tmp/orderer2.yaml
kubectl apply -f /tmp/orderer2.yaml -n orgdcms
kubectl get pods -n orgdcms | grep orderer2
orderer2-7cc9cfbf6b-clj9m        0/1     Error     1 (10s ago)     11s
kubectl logs deployment/orderer2 -n orgdcms
kubectl delete deployment orderer2 -n orgdcms
mkdir -p /home/asantopadre/runtime/orgdcms/orderer2/msp
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --caname ca-orgdcms   -M /home/asantopadre/runtime/orgdcms/orderer2/msp   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/*    /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/*    /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/*    /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/*    /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
# individua il file chiave reale
ls /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore
rm -f /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/*
fabric-ca-client enroll   -u https://orderer2:orderer2pw@localhost:7054   --caname ca-orgdcms   --enrollment.profile tls   --csr.hosts orderer2   --csr.hosts orderer2.orgdcms.svc.cluster.local   -M /home/asantopadre/runtime/orgdcms/orderer2/tls   --tls.certfiles /home/asantopadre/runtime/orgdcms/tls-ca-runtime.pem
ls /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/*    /home/asantopadre/runtime/orgdcms/orderer2/tls/keystore/key.pem
cp /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/*    /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem
kubectl apply -f /tmp/orderer2.yaml -n orgdcms
kubectl get pods -n orgdcms | grep orderer2
kubectl logs deployment/orderer2 -n orgdcms
kubectl port-forward -n orgx deployment/fabric-tls-ca 7054:7054
kubectl port-forward -n orgx deployment/fabric-ca 7054:7054
kubectl port-forward -n orgx deployment/fabric-tls-ca 7052:7052
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
# Enroll admin TLS-CA (orgx)
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --caname ca-orgx   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
# Estrai il certificato reale della TLS-CA orgx
openssl s_client -connect localhost:7054 -showcerts </dev/null   | sed -ne '/BEGIN CERTIFICATE/,/END CERTIFICATE/p'   > /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --caname ca-orgx   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --caname ca-orgx   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
openssl s_client -connect localhost:7054 -servername localhost </dev/null   | sed -n '/BEGIN CERTIFICATE/,/END CERTIFICATE/p'   | awk 'NR==1{print} NR>1 && prev{exit} {prev=1}'   > /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
openssl x509 -in /home/asantopadre/runtime/orgx/tls-ca-runtime.pem -noout -subject -issuer
openssl s_client -connect localhost:7054 -showcerts </dev/null
openssl s_client -connect localhost:7052 -showcerts </dev/null
openssl s_client -connect localhost:7052 -servername localhost </dev/null   | sed -n '/BEGIN CERTIFICATE/,/END CERTIFICATE/p'   | awk 'NR==1{print} NR>1 && prev{exit} {prev=1}'   > /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
cat > /home/asantopadre/runtime/orgx/tls-ca-runtime.pem <<'EOF'
-----BEGIN CERTIFICATE-----
MIICljCCAj2gAwIBAgIUDDwo2ldAN+e9L2GKRvf5DMjF580wCgYIKoZIzj0EAwIw
aDELMAkGA1UEBhMCVVMxFzAVBgNVBAgTDk5vcnRoIENhcm9saW5hMRQwEgYDVQQK
EwtIeXBlcmxlZGdlcjEPMA0GA1UECxMGRmFicmljMRkwFwYDVQQDExBmYWJyaWMt
Y2Etc2VydmVyMB4XDTI2MDExMjE2MTMwMFoXDTI3MDExMjE2MTMwMFowdjELMAkG
A1UEBhMCVVMxFzAVBgNVBAgTDk5vcnRoIENhcm9saW5hMRQwEgYDVQQKEwtIeXBl
cmxlZGdlcjEPMA0GA1UECxMGRmFicmljMScwJQYDVQQDEx5mYWJyaWMtdGxzLWNh
LTY4N2NkYzk4ZmMtamI1aDcwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQRrnrZ
vmukY+8wWDOSz5R9R7V/EsXKHW1nZXiQ12cTjyLNrzkoUccaUcnnVNGU0JQ12QqX
DvhbdxI5TTBSdPXZo4G2MIGzMA4GA1UdDwEB/wQEAwIDqDAdBgNVHSUEFjAUBggr
BgEFBQcDAQYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUj0q4stum
RKmXfWLnbgkW2zoEpaIwHwYDVR0jBBgwFoAUvKs2cHtLZUO4oLg6TXMjO482KhUw
NAYDVR0RBC0wK4IeZmFicmljLXRscy1jYS03ZjRiNjc5Zjk0LXFodzJjgglsb2Nh
bGhvc3QwCgYIKoZIzj0EAwIDRwAwRAIgEV79QUuz03l6bSDAcp1Tky17+ECEXDrO
6p4q9QDq6nYCIEdEA+ssz5ffBGOZZMYvaqB263RFYfJIEZoU56gNZUc0
-----END CERTIFICATE-----
EOF

# Verifica PEM
openssl x509 -in /home/asantopadre/runtime/orgx/tls-ca-runtime.pem -noout -subject -issuer
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7052   --caname ca-orgx   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7052   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
# Register orderer3 (TLS-CA)
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
kubectl get svc -n orgx fabric-tls-ca -o yaml | grep -i port
penssl s_client -connect localhost:7052 </dev/null
openssl s_client -connect localhost:7052 </dev/null
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
nano /home/asantopadre/runtime/ca-tls-orgx/fabric-ca-client-config.yaml
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-tls-orgx
fabric-ca-client register   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
mkdir -p /home/asantopadre/runtime/orgx/orderer3/tls
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7052   --enrollment.profile tls   --csr.hosts orderer3   --csr.hosts orderer3.orgx.svc.cluster.local   -M /home/asantopadre/runtime/orgx/orderer3/tls   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
openssl x509   -in /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem   -noout -text | grep -A1 "Subject Alternative Name"
mkdir -p /home/asantopadre/runtime/orgx/orderer3/msp
abric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7054   -M /home/asantopadre/runtime/orgx/orderer3/msp   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7054   -M /home/asantopadre/runtime/orgx/orderer3/msp   --tls.certfiles /home/asantopadre/runtime/orgx/tls-ca-runtime.pem
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7054   -M /home/asantopadre/runtime/orgx/orderer3/msp   --tls.certfiles /home/asantopadre/artifacts/ca/orgx/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-orgx
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --caname ca-orgx   --tls.certfiles /home/asantopadre/artifacts/ca/orgx/ca-cert.pem
abric-ca-client register   --caname ca-orgx   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles /home/asantopadre/artifacts/ca/orgx/ca-cert.pem
fabric-ca-client register   --caname ca-orgx   --id.name orderer3   --id.secret orderer3pw   --id.type orderer   --tls.certfiles /home/asantopadre/artifacts/ca/orgx/ca-cert.pem
mkdir -p /home/asantopadre/runtime/orgx/orderer3/msp
fabric-ca-client enroll   -u https://orderer3:orderer3pw@localhost:7054   --caname ca-orgx   -M /home/asantopadre/runtime/orgx/orderer3/msp   --tls.certfiles /home/asantopadre/artifacts/ca/orgx/ca-cert.pem
cp /home/asantopadre/runtime/orgx/orderer3/tls/keystore/*    /home/asantopadre/runtime/orgx/orderer3/tls/keystore/key.pem
cp /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/*    /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem
kubectl get deployment orderer1 -n orgdcms -o yaml > /tmp/orderer1.yaml
sed   -e 's/name: orderer1/name: orderer3/g'   -e 's/app: orderer1/app: orderer3/g'   -e 's|orgdcms|orgx|g'   -e 's|runtime/orgdcms/orderer1|runtime/orgx/orderer3|g'   /tmp/orderer1.yaml > /tmp/orderer3.yaml
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl get pods -n orgx | grep orderer3
kubectl logs orderer3-5c5f4d4ff6-mlj2x -n orgx
ls /home/asantopadre/runtime/orgx/orderer3/msp
kubectl get deployment orderer3 -n orgx -o yaml | grep -A3 msp
sed -i 's|runtime/orgx/orderer1|runtime/orgx/orderer3|g' /tmp/orderer3.yaml
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl get pods -n orgx | grep orderer3
kubectl logs deployment/orderer3 -n orgx
cp /home/asantopadre/runtime/orgdcms/orderer1/msp/config.yaml    /home/asantopadre/runtime/orgx/orderer3/msp/config.yaml
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
cp /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/*    /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/ca-cert.pem
ls /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts
cp /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/tls-localhost-7052.pem    /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/ca.pem
cp /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/*    /home/asantopadre/runtime/orgx/orderer3/msp/cacerts/ca-cert.pem
ls /home/asantopadre/runtime/orgx/orderer3/msp/cacerts
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
cp /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/tls-localhost-7052.pem    /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/tls-localhost-7052-tlsca-orgx.pem
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
sed -i 's|ORDERER_GENERAL_TLS_ROOTCAS.*|ORDERER_GENERAL_TLS_ROOTCAS=/var/hyperledger/orderer/tls/tlscacerts/*.pem|g' /tmp/orderer3.yaml
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
sed -i 's|ORDERER_GENERAL_TLS_ROOTCAS.*|ORDERER_GENERAL_TLS_ROOTCAS=/var/hyperledger/orderer/tls/tlscacerts/*.pem|g' /tmp/orderer3.yaml
# Riesporta orderer1
kubectl get deployment orderer1 -n orgdcms -o yaml > /tmp/orderer1.yaml
sed   -e 's/name: orderer1/name: orderer3/g'   -e 's/app: orderer1/app: orderer3/g'   -e 's|orgdcms|orgx|g'   -e 's|runtime/orgdcms/orderer1|runtime/orgx/orderer3|g'   /tmp/orderer1.yaml > /tmp/orderer3.yaml
ls -l /tmp/orderer3.yaml
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
kubectl get pods -n orgx | grep orderer3
kubectl logs deployment/orderer3 -n orgx
ls /home/asantopadre/runtime/orgx/orderer3/msp/signcerts
# Controlla il path montato
kubectl get deployment orderer3 -n orgx -o yaml | grep -A4 hostPath
kubectl get deployment orderer1 -n orgdcms -o yaml > /tmp/orderer3.yaml
sed -i 's|orgdcms|orgx|g' /tmp/orderer3.yaml
sed -i 's|orderer1|orderer3|g' /tmp/orderer3.yaml
sed -i 's|runtime/.*/orderer1|runtime/orgx/orderer3|g' /tmp/orderer3.yaml
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
/home/asantopadre/runtime/orgx/orderer3/msp
/home/asantopadre/runtime/orgx/orderer3/tls
kubectl delete deployment orderer3 -n orgx
kubectl apply -f /tmp/orderer3.yaml -n orgx
kubectl logs deployment/orderer3 -n orgx
# Pod orderer (stato)
kubectl get pods -n orgdcms | grep orderer
kubectl get pods -n orgx | grep orderer
kubectl logs deployment/orderer1 -n orgdcms | tail -n 5
kubectl logs deployment/orderer2 -n orgdcms | tail -n 5
kubectl logs deployment/orderer3 -n orgx | tail -n 5
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
osnadmin channel list   --orderer-address localhost:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/*.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem -noout -subject -issuer
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/tls/signcerts/cert.pem -noout -subject -issuer
openssl x509 -in /home/asantopadre/runtime/orgx/orderer3/tls/signcerts/cert.pem -noout -subject -issuer
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/*.pem -noout -pubkey | openssl sha256
openssl x509 -in /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts/*.pem -noout -pubkey | openssl sha256
openssl x509 -in /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts/*.pem -noout -pubkey | openssl sha256
ls /home/asantopadre/runtime/orgdcms/orderer2/tls/tlscacerts
ls /home/asantopadre/runtime/orgx/orderer3/tls/tlscacerts
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
# Genera il genesis/config block del canale (una sola volta)
configtxgen   -profile ChannelRaft   -channelID canale1   -outputBlock ./artifacts/canale1.block
configtxgen   -configPath ./artifacts   -profile ChannelRaft   -channelID canale1   -outputBlock ./artifacts/canale1.block
grep -E "^[[:space:]]*[A-Za-z0-9_-]+:" ./artifacts/configtx.yaml
onfigtxgen   -configPath ./artifacts   -profile Canale1   -channelID canale1   -outputBlock ./artifacts/canale1.block
configtxgen   -configPath ./artifacts   -profile Canale1   -channelID canale1   -outputBlock ./artifacts/canale1.block
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address localhost:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address localhost:7053   --tls-server-name orderer1.orgdcms.svc.cluster.local   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/tls/signcerts/cert.pem   --client-key /home/asantopadre/runtime/orgdcms/orderer1/tls/keystore/key.pem
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk
openssl s_client   -connect orderer1.orgdcms.svc.cluster.local:7053   -cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk   -CAfile /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/ca-cert.pem
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
openssl s_client   -connect orderer1.orgdcms.svc.cluster.local:7053   -cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk   -CAfile /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/ca-cert.pem
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
openssl s_client   -connect orderer1.orgdcms.svc.cluster.local:7053   -cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk   -CAfile /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/ca-cert.pem
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
openssl s_client   -connect orderer1.orgdcms.svc.cluster.local:7053   -cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk   -CAfile /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem
cat /home/asantopadre/runtime/orgdcms/orderer1/msp/config.yaml
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -noout -subject
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-orgdcms
fabric-ca-client register   --id.name ordererAdmin   --id.secret ordererAdminpw   --id.type admin   --id.attrs "ou=admin:ecert"   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-orgdcms
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
# Terminale 2: enroll admin CA orgdcms
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-orgdcms
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/asantopadre/runtime/ca-orgdcms
fabric-ca-client enroll   -u https://admin:adminpw@localhost:7054   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
fabric-ca-client register   --id.name ordererAdmin   --id.secret ordererAdminpw   --id.type admin   --id.attrs "ou=admin:ecert"   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
fabric-ca-client register   --id.name ordererAdmin   --id.secret ordererAdminpw   --id.type admin   --id.attrs "ou=admin:ecert"   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
fabric-ca-client enroll   -u https://ordererAdmin:ordererAdminpw@localhost:7054   -M /home/asantopadre/runtime/orgdcms/orderer1/msp/admin   --tls.certfiles /home/asantopadre/artifacts/ca/orgdcms/ca-cert.pem
cp /home/asantopadre/runtime/orgdcms/orderer1/msp/admin/signcerts/*.pem    /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -noout -subject
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/admin/keystore/*_sk
kubectl edit deployment orderer1 -n orgdcms
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/admin/keystore/*_sk
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/admin/keystore/*_sk
kubectl edit deployment orderer1 -n orgdcms
kubectl port-forward -n orgdcms deployment/orderer1 7053:7053
ls /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp/admincerts/cert.pem   --client-key  /home/asantopadre/fabric-deploy/orderer-msps/orderer1-msp/admincerts/key.pem
# Cerca admin MSP per orderer1
find /home/asantopadre -type d -path "*orderer1*admin*"
ls /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts
ls /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/1d0a17db7e390af30ecb984dad44fad8d9e2e7c01b70690cca8a5764ff140ba1_sk
# Estrai hash della public key dal cert admin
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -noout -pubkey | openssl sha256
for k in /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/*_sk; do   echo "== $k";   openssl pkey -in "$k" -pubout | openssl sha256; done
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk
# Terminale 2
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address localhost:7053   --tls-server-name orderer1.orgdcms.svc.cluster.local   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk
sudo nano /etc/hosts
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk
kubectl get pods -n orgdcms | grep orderer1
osnadmin channel join   --channelID canale1   --config-block ./artifacts/canale1.block   --orderer-address orderer1.orgdcms.svc.cluster.local:7053   --ca-file /home/asantopadre/runtime/orgdcms/orderer1/tls/tlscacerts/tls-localhost-7052-tlsca-orgdcms.pem   --client-cert /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   --client-key  /home/asantopadre/runtime/orgdcms/orderer1/msp/keystore/8c9bfdd7b35cc6813051f4c2b5501f16f96f8565781a7d7c36989ed1c19f020d_sk
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/admincerts/cert.pem   -noout -issuer
openssl x509   -in /home/asantopadre/runtime/orgdcms/orderer1/msp/cacerts/ca-cert.pem   -noout -subject
kubectl rollout restart deployment orderer1 -n orgdcms
kubectl rollout status deployment orderer1 -n orgdcms
q
quit
exit
