// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Election {
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping(uint => Candidate) public Candidates;
  mapping (address => bool) public voters;

  uint public candidateCount;

  constructor() public{
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string memory _name) private{
    candidateCount ++;
    Candidates[candidateCount] = Candidate(candidateCount, _name, 0);
  }    

  function vote(uint _candidateId) public{
    // require that they haven't voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidateCount);

    // record that voter has voted
    voters[msg.sender] = true;

    // update candidate vote Count
    Candidates[_candidateId].voteCount ++;

  }
}
