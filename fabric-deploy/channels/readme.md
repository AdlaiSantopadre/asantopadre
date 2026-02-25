Genera il nuovo genesis block per canale1v2(dopo aver constatato che il certificato per orgX admin non era aggiornato)

export FABRIC_CFG_PATH=/home/asantopadre/fabric-deploy/configtx

configtxgen \
  -profile Canale1 \
  -channelID canale1v2 \
  -outputBlock /home/asantopadre/fabric-deploy/channels/canale1v2.block

Verifica che dentro il block compaiano:
•	MSP OrgDCMS aggiornato
•	MSP OrgX aggiornato
Nella cartella:
# 1) Estrai ChannelConfig dal block (serve peer binary nel tuo host)
configtxlator proto_decode --input canale1v2.block --type common.Block > block.json
jq -r '.data.data[0].payload.data.config' block.json > config.json

# 2) Visualizza gli MSP presenti
jq -r '
.channel_group.groups.Application.groups
| keys[] as $org
| "\($org) MSPID=" + (.[$org].values.MSP.value.config.name)
' config.json
