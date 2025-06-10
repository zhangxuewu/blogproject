const {ethers} = require("hardhat");
async function main(){
   const Twitter= await ethers.getContractFactory("Twitter")
  const twitter = await Twitter.deploy()
  await twitter.waitForDeployment()
  const address=await twitter.getAddress()
  console.log("Twitter contract deployed to:", address)


}
main()