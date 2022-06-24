# Chee Finance veNFT pools
## Test Steps
1. Use `veNFT` contract to mint `veTest`.
2. Approve lending contract use of `veTest`.
3. On lending contract, use `mint` function to deposit `veTest` and borrow `cheeTest`s;
4. Check current interest (`Test`s) on lending contract;
5. Approve lending contract use of `cheeTest`s & `Test`s;
6. Use `redeem` or `liquidate` on lending contract with `cheeTest`s & `Test`s;
## Contract addresses (Celo Alfajores Testnet):
Lend: `0x2757aB26b28Eba44d0Df6EC8D7dE16906760c914`

TestToken: `0xa561D40Add7Df0f606b130761E3e2Aa3336BD784`

veNFT: `0xF25dd6FA4544b4021cb16c027ac9Ccbb6c0d6772`

cheeTest: `0x3f9d2879FBfcF6072833e243931Fe1BBcb0E1af5`
