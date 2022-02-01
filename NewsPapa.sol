pragma solidity ^0.8.11;
//SPDX-License-Identifier: GPL-3.0

contract NewsPaper {

    string news_paper_name;
    uint creation_date;
    uint static_id;

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
        static_id=0;
    }

    function create_news(bytes memory _title, bytes memory _content) public {
        News memory _inject = News(++static_id, address(msg.sender), block.timestamp, _title, _content);
        news.push(_inject);
    }
}
