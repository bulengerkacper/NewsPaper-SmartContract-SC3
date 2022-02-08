$.get('/menu',
    function (data, textStatus, jqXHR) {  
    $('menu').append(data);
});

$.get('/rules',
    function (data, textStatus, jqXHR) {  
    $('rules_data').append(data);
});

abi = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_news_paper_name",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "comments",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "comment_id",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "id_of_news",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "message",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "pseudonim",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_id_of_news",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_message",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_pseudonim",
				"type": "string"
			}
		],
		"name": "create_comment",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_title",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_content",
				"type": "string"
			}
		],
		"name": "create_news",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "news",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "id",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "date",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "title",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "content",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "red_button",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_comment_id",
				"type": "uint256"
			}
		],
		"name": "reward_comment_creator",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_news_id",
				"type": "uint256"
			}
		],
		"name": "reward_news_creator",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	}
]

const address = '0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8'
const Web3 = require('web3')
const rpcURL = 'http://127.0.0.1:8545' // Your RCP URL goes here
const web3 = new Web3(rpcURL)

const contract = new web3.eth.Contract(abi, address)


contract.methods.news(0)
contract.methods.comments(0)
/*
contract.methods.name().call((err, result) => { console.log(result) })
contract.methods.symbol().call((err, result) => { console.log(result) })
contract.methods.balanceOf('0xd26114cd6EE289AccF82350c8d8487fedB8A0C07').call((err, result) => { console.log(result) })
*/

function addNews() {
    var title = document.getElementById("textarea_field_news_title").value;
    var content = document.getElementById("textarea_field_news_content").value;
    var gaz = document.getElementById("textarea_field_gas").value;
    contract.methods.create_news(title,content).call((err, result) => { console.log(result) })
    console.log(title);
    console.log(content);
    console.log(gaz);
}

function addComment() {
    var message = document.getElementById("textarea_field_message").value;
    var pseudonim = document.getElementById("textarea_field_pseudonim").value;
    contract.methods.create_comment(0,"First comment","Writter1").call((err, result) => { console.log(result) })
}
  