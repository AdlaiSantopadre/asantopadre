'use strict';//use strict mode per evitare errori comuni e migliorare la sicurezza del codice

import { Contract } from 'fabric-contract-api';

class OperationEventContract extends Contract {


  async CreateOperationEvent(
    ctx,
    operationEventId,
    operatorDid,
    operationType,
    timestamp,
    room,
    device,
    hash
  ) {

    const exists = await ctx.stub.getState(operationEventId);
    if (exists && exists.length) {
      throw new Error(`Event ${operationEventId} already exists`);
    }

    const event = {
      operationEventId,
      operatorDid,
      operationType,
      timestamp,
      room,
      device,
      hash,
      docType: "operationEvent"// Aggiunta di un campo docType per facilitare le query
      // con CouchDB e l'organizzazione dei dati sulla blockchain
    };

    await ctx.stub.putState(
      operationEventId,// La chiave per l'evento sarà
      // l'ID univoco generato nel controller, garantendo tracciabilità e immutabilità
      Buffer.from(JSON.stringify(event))
    );

    return JSON.stringify(event);
  }

  async ReadOperationEvent(ctx, operationEventId) {

    const data = await ctx.stub.getState(operationEventId);

    if (!data || data.length === 0) {
      throw new Error(`Event ${operationEventId} not found`);
    }

    return data.toString();
  }

  async QueryByOperator(ctx, operatorDid) {

    const query = {
      selector: {
        docType: "operationEvent",
        operatorDid
      }
    };

    return await this._query(ctx, query);
  }

  async QueryByRoom(ctx, room) {

    const query = {
      selector: {
        docType: "operationEvent",
        room
      }
    };

    return await this._query(ctx, query);
  }

  async QueryAll(ctx) {

    const query = {
      selector: {
        docType: "operationEvent"
      }
    };

    return await this._query(ctx, query);
  }

  async _query(ctx, query) {

    const iterator = await ctx.stub.getQueryResult(JSON.stringify(query));
    const results = [];

    let res = await iterator.next();
    while (!res.done) {
      const value = res.value.value.toString('utf8');
      results.push(JSON.parse(value));
      res = await iterator.next();
    }

    return JSON.stringify(results);
  }
}

export const contracts = [OperationEventContract];

