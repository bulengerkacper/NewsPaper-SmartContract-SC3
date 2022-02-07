pragma solidity ^0.8.11;
//SPDX-License-Identifier: GPL-3.0

contract NewsPaper {

    string news_paper_name;
    uint creation_date;
    uint256 private static_news_id;
    uint256 private static_comment_id; 
    address news_paper_owner;

    struct News {
        uint id;
        address owner;
        uint date;
        string title;
        string content; 
    }

    struct Comment {
        uint comment_id;
        uint id_of_news;
        address owner;
        string message;
        string pseudonim;
    }

    News[] public news;
    Comment[] public comments;

    constructor(string memory _news_paper_name) {
        news_paper_name = _news_paper_name;
        creation_date = block.timestamp;
        static_news_id = 0;
        news_paper_owner = msg.sender;
    }

    function create_news(string memory _title, string memory _content) public payable {
        News memory _inject = News(++static_news_id, address(msg.sender), block.timestamp, _title, _content);
        news.push(_inject);
        payable(news_paper_owner).transfer(msg.value);
    }

    function reward_news_creator(uint _news_id) public payable {
        address _news_owner;
        for (uint256 i=0; i < news.length; i++) {
            if(news[i].id ==_news_id) {
                _news_owner = news[i].owner;
                break;
            }
        }
        payable(_news_owner).transfer(msg.value * 99/100);
        payable(news_paper_owner).transfer(msg.value * 1/100);
    }


    function create_comment(uint _id_of_news, string memory _message, string memory _pseudonim) public payable {
        Comment memory _inject = Comment(++static_comment_id, _id_of_news, msg.sender, _message,_pseudonim);
        comments.push(_inject);
        payable(news_paper_owner).transfer(msg.value);
    }

    function reward_comment_creator(uint _comment_id) public payable {
        address _comment_owner;
        for(uint256 i=0; i < comments.length; i++) {
            if(comments[i].comment_id == _comment_id) {
                _comment_owner = comments[i].owner;
                break;
            }
        }
        payable(_comment_owner).transfer(msg.value*99/100);
        payable(news_paper_owner).transfer(msg.value * 1/100);
    }


    modifier only_admin {
		require(msg.sender == news_paper_owner," you are not an admin");
		_;
	}

    function red_button() public only_admin {
        delete news;
    }
}

/*
TODOS: 
- rewrite to u256
-comments sytem !? - maybe should be based not on smart contract - during consideration
-counting awards
*/