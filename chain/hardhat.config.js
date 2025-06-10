require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks:{
    ganache:{
         url:"HTTP://127.0.0.1:7545",
        accounts:["0x596301bcfc59e43e2d35cfeecbcf4144484433f8d89e8e03860b5e2d1aaf6cea"]
    }
  }
};
