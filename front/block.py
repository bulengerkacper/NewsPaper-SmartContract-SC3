from web3 import Web3
from abi_file import *
contract='0xa22664f472df6b6cc75e62f9bd83b14bc0571c86'
contract_2='0xA22664F472df6b6cC75e62f9bD83B14bc0571C86'
project_id="ba21b4d517ff44faa90e11145185d65d"
url="https://ropsten.infura.io/v3/ba21b4d517ff44faa90e11145185d65d"
web3 = Web3(Web3.HTTPProvider(url))
print(web3.isConnected())

#contract="https://ropsten.etherscan.io/tx/0xedd44734041c54c10cb3cc5290aca5d91435d3980702a1befda2d55625916922"
contract_instance = web3.eth.contract(address=contract_2, abi=abis) 
returned=contract_instance.functions.get_current_news_id().call()
print(returned)


def addNews(name,content,gaz):
    ret_val=contract_instance.functions.create_news(name,content).call()
    print("chain_czek")
    print(ret_val)
    # print("add news content:" + ret_val)
