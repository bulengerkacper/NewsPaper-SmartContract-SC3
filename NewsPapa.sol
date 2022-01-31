pragma solidity ^0.8.11;
//SPDX-License-Identifier: GPL-3.0

contract NewsPapa {

    struct News {
        address owner;
        uint date;
        bytes title;
        bytes content;
    }

    News[] public news;

    constructor() {}

    function create_news(bytes memory _title, bytes memory _content) public {
        News memory _inject = News(address(msg.sender),block.timestamp,_title, _content);
        news.push(_inject);
    }
}
