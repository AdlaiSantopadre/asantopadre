'use strict';

import { Contract } from 'fabric-contract-api';

class OperationEventContract extends Contract {

  async CreateOperationEvent(ctx, eventJson) {

    const event = JSON.parse(eventJson);

    const exists = await ctx.stub.getState(event.operationEventId);
    if (exists && exists.length > 0) {
      throw new Error('Event already exists');
    }

    await ctx.stub.putState(
      event.operationEventId,
      Buffer.from(JSON.stringify(event))
    );

    return JSON.stringify(event);
  }

  async ReadOperationEvent(ctx, operationEventId) {

    const data = await ctx.stub.getState(operationEventId);

    if (!data || data.length === 0) {
      throw new Error('Event not found');
    }

    return data.toString();
  }
}

export default OperationEventContract;
