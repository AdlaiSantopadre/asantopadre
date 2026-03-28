Questa cartella contiene (tra le altre)
fabric-deploy/
 ├── orgdcms/admin
 ├── orgdcms/peers/peer1
 ├── orgx/admin
 ├── orgx/peers/peer2
 └── orderers/

Riflettere sulla distinzione (riferito a orgdcms ma vale anche per orgx)
CA bootstrap/registrar (tecnico)

Origine: fabric-clients/ca-orgdcms-admin

Ruolo: registrar della CA (fa register/enroll di altri).



Org admin (operativo Fabric)

Creato dopo con:

register orgdcms-admin (usando il registrar tecnico)

enroll in fabric-deploy/orgdcms/admin

Ruolo: firma operazioni peer/channel/chaincode.
