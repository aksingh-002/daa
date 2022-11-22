pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract Election {
    struct Candidate {
        uint id;
        string name;
        uint vote_count;
    }

    struct Voter {
        uint voter_id;
        uint cand_id;
    }

    Candidate[] all_candidates;
    Voter[] all_voters;

    function add_candidate(uint id, string name) public {
        all_candidates.push(Candidate(id, name, 0));
    }

    function vote(uint voter_id, uint cand_id) public {
        uint flag = 0;
        for (uint i = 0; i < all_candidates.length; i++) {
            if (all_candidates[i].id == cand_id) {
                all_candidates[i].vote_count += 1;
                all_voters.push(Voter(voter_id, cand_id));
                flag = 1;
                break;
            }
        }
        
        if (flag == 0){
            revert ("Candidate does not exist !");
        }
    }

    function getResult() public view returns (Candidate[] memory) {
        return all_candidates;
    }

    function winnerElection() public view returns (Candidate memory) {
        uint max = 0;
        uint ind = 0;
        for (uint i = 0; i < all_candidates.length; i++) {
            if (all_candidates[i].vote_count > max) {
                ind = i;
                max = all_candidates[i].vote_count;
            }
        }

        return all_candidates[ind];
    }
}