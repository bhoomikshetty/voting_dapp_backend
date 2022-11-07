var message = {
    "nonce": 2,
    "from": "0x256144a60f34288F7b03D345F8Cb256C502e0f2C"
};

var domainData = {
  "name": "Quote",
  "version": "1",
  "chainId" : "5", // Goerli
  "verifyingContract" : "0x97b1Efe0BA9730d6C0d9fb75F53173F07521A0d3"
};


const domainType = [
  { "name": "name", "type": "string" },
  { "name": "version", "type": "string" },
  { "name": "chainId", "type": "uint256" },
  { "name": "verifyingContract", "type": "address" }
];

const metaTransactionType = [
  { "name": "nonce", "type": "uint256" },
  { "name": "from", "type": "address" }
];