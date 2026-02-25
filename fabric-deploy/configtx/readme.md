configtx necessita di risolvere un path locale dunque
configtx/
contiene la copia degli MSP
di fabric-ca-orgx
di fabric-ca-orgdcms
 e  degli orderer

MSP in orgdcms è trust-only.Il canale usa quell’MSP per:
validare firme altrui
valutare policy (Readers/Writers/Admins)
