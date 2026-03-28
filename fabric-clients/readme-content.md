*Cosa contiene fabric-clients/

Qui ci sono i client tecnici per parlare con le CA.

Non sono identità operative della rete.

fabric-clients/
 ├── ca-orgdcms-admin        → registrar CA OrgDCMS
 ├── ca-orgx-admin           → registrar CA OrgX
 ├── tls-ca-admin            → registrar TLS-CA unica
 ├── fabric-ca-orgdcms-tls   → TLS server cert della CA orgdcms
 └── fabric-ca-orgx-tls      → TLS server cert della CA orgx

**Ruoli

ca-orgdcms-admin → fa register/enroll su fabric-ca-orgdcms

ca-orgx-admin → fa register/enroll su fabric-ca-orgx

tls-ca-admin → fa register/enroll sulla TLS-CA unica

mentre i fabric-ca-*-tls  NON sono registrar
MA sono solo certificati TLS server dei pod CA

