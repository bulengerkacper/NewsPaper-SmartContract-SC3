pragma solidity ^0.8.11;
//SPDX-License-Identifier: GPL-3.0

contract NewsPaper {

    string news_paper_name;
    uint creation_date;
    uint private static_news_id; 
    address news_paper_owner;

    struct News {
        uint id;
        address owner;
        uint date;
        string title;
        string content; 
    }

    News[] public news;

    constructor(string memory _news_paper_name) {
        news_paper_name = _news_paper_name;
        creation_date = block.timestamp;
        static_news_id = 0;
        news_paper_owner = msg.sender;
    }

    function create_news(string memory _title, string memory _content) public {
        News memory _inject = News(++static_news_id, address(msg.sender), block.timestamp, _title, _content);
        news.push(_inject);
    }

    function reward_news_creator(uint _news_id) public payable {
        address _news_owner;
        for (uint i=0; i < news.length; i++) {
            if(news[i].id ==_news_id) {
                _news_owner = news[i].owner;
            }
        }
        payable(_news_owner).transfer(msg.value * 99/100);
        payable(news_paper_owner).transfer(msg.value * 1/100);
    }

    modifier only_owner {
		require(msg.sender == news_paper_owner," you are not an admin");
		_;
	}

    function red_button() public only_owner {
        delete news;
    }
}

/*
TODOS: 
-comments sytem !? - maybe should be based not on smart contract - during consideration
*/