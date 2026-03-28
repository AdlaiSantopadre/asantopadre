'use strict';
import { Contract } from 'fabric-contract-api';

class BasicContract extends Contract {
  async CreateAsset(ctx, id, value) {
    const exists = await ctx.stub.getState(id);
    if (exists && exists.length) throw new Error(`Asset ${id} already exists`);
    const asset = { id, value, owner: ctx.clientIdentity.getID() };
    await ctx.stub.putState(id, Buffer.from(JSON.stringify(asset)));
    return JSON.stringify(asset);
  }

  async ReadAsset(ctx, id) {
    const data = await ctx.stub.getState(id);
    if (!data || !data.length) throw new Error(`Asset ${id} not found`);
    return data.toString();
  }
}

export const contracts = [BasicContract];
