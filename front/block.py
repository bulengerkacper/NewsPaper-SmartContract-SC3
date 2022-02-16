from web3 import Web3
from abi_file import *
contract='0xa22664f472df6b6cc75e62f9bd83b14bc0571c86'
contract_2='0xA22664F472df6b6cC75e62f9bD83B14bc0571C86'
project_id="ba21b4d517ff44faa90e11145185d65d"
url="https://ropsten.infura.io/v3/ba21b4d517ff44faa90e11145185d65d"
web3 = Web3(Web3.HTTPProvider(url))
print(web3.isConnected())

contract_instance = web3.eth.contract(address=contract_2, abi=abis) 
returned=contract_instance.functions.get_current_news_id().call()
print(returned)

def addNews(name,content,gaz):
    web.eth.accounts[0]
    ret_val=contract_instance.functions.create_news(name,content).call({'from': web3.eth.accounts[0]})
    print("chain_czek")
    print(ret_val)
    # print("add news content:" + ret_val)

def getLastXNews(amount):
    returned=contract_instance.functions.get_current_news_id().call()
    val=0
    news_fetched=""
    while val < returned:
        fetched_data = contract_instance.functions.news(val).call()
        print("title: "+fetched_data[3])
        print("content: "+fetched_data[4])
        news_fetched+="title: "+fetched_data[3]+"</br>"
        news_fetched+="content: "+fetched_data[4]+"</br>"
        val=val+1
    return news_fetched
