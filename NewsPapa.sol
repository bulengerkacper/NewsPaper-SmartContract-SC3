pragma solidity ^0.8.11;
//SPDX-License-Identifier: GPL-3.0

contract NewsPaper {

    string news_paper_name;
    uint creation_date;
    uint static_news_id;

    struct News {
        uint id;
        address owner;
        uint date;
        bytes title;
        bytes content;
    }

    News[] public news;

    constructor(string memory _news_paper_name) {
        news_paper_name = _news_paper_name;
        creation_date = block.timestamp;
        static_news_id=0;
    }

    function create_news(bytes memory _title, bytes memory _content) public {
        News memory _inject = News(++static_news_id, address(msg.sender), block.timestamp, _title, _content);
        news.push(_inject);
    }

    function reward_news_creator(uint _how_many_coins, uint _news_id) public {
            address _news_owner;
            for (uint i=0; i < news.length; i++) {
                if(news[i].id=_news_id) {
                    _news_owner=news[id].address;
                }
            }
            payable(_news_owner).transfer(_how_many_coins);
    }
}

/*
TODOS: 
-voting and giving money to post author
-comments sytem !? - maybe should be based not on struct


*/