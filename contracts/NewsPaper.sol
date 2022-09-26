pragma solidity ^0.8.11;
//SPDX-License-Identifier: GPL-3.0

contract NewsPaper {

    uint256 public static_news_id;
    uint256 public static_comment_id; 
    address news_paper_owner;

    struct News {
        uint256 id;
        address owner;
        uint date;
        string title;
        string content; 
    }

    struct Comment {
        uint256 comment_id;
        uint256 id_of_news;
        address owner;
        string message;
        string pseudonim;
    }

    mapping(uint256 => News) public news;
    mapping(uint256 => Comment) public comments;

    constructor() {
        static_news_id = 0; 
        static_comment_id = 0;
        news_paper_owner = msg.sender;
    }

    function create_news(string calldata _title, string calldata _content) public payable {
        News memory _inject = News(++static_news_id, address(msg.sender), block.timestamp, _title, _content);
        news[static_news_id] = _inject;
        payable(news_paper_owner).transfer(msg.value);
    }

    function get_news(uint256 _id)  public view returns (News memory ) {
        return news[_id];
    }

    function get_comment(uint256 _id)  public view returns (Comment memory ) {
        return comments[_id];
    }

    function reward_news_creator(uint _news_id) public payable {
        payable(news[_news_id].owner).transfer(msg.value * 99/100);
        payable(news_paper_owner).transfer(msg.value * 1/100);
    }


    function create_comment(string calldata _message, string calldata _pseudonim,uint256 _id_of_news) public payable {
        Comment memory _inject = Comment(++static_comment_id, _id_of_news, msg.sender, _message,_pseudonim);
        comments[static_comment_id] = _inject;
        payable(news_paper_owner).transfer(msg.value);
    }

    function reward_comment_creator(uint _comment_id) public payable {
        payable(comments[_comment_id].owner).transfer(msg.value*99/100);
        payable(news_paper_owner).transfer(msg.value * 1/100);
    }

    modifier only_admin {
		require(msg.sender == news_paper_owner," you are not an admin");
		_;
	}

    function remove_news(uint256 _id) public only_admin {
        news[_id].content="";
        news[_id].title="";

    }

    function remove_comment(uint256 _id) public only_admin {    
        comments[_id].message="";
        comments[_id].pseudonim="";
    }
}
