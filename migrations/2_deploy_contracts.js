// @ts-nocheck
const VeNFT = artifacts.require("VeNFT");
const CheeTestToken = artifacts.require("CheeTestToken");
const TestToken = artifacts.require("TestToken");
const Lend = artifacts.require("Lend");

module.exports = function (deployer) {
  deployer.deploy(VeNFT, "Test Governance veNFT", "veTest");
  deployer.deploy(CheeTestToken, "cheeToken Test", "cheeTest");
  deployer.deploy(TestToken, "Test Governance Token", "Test");
  deployer.deploy(Lend);
};
