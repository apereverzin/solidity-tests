pragma solidity ^0.4.24;

contract Register {
    function getLength(address _addr) public view returns (uint) {
        return bytes(getCode(_addr)).length;
    }

    function isContract(address _addr) public view returns (bool) {
        return bytes(getCode(_addr)).length > 0;
    }

    function getCode(address _addr) private view returns (bytes o_code) {
        assembly {
            // retrieve the size of the code, this needs assembly
            let size := extcodesize(_addr)
            // allocate output byte array - this could also be done without assembly
            // by using o_code = new bytes(size)
            o_code := mload(0x40)
            // new "memory end" including padding
            mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            // store length in memory
            mstore(o_code, size)
            // actually retrieve the code, this needs assembly
            extcodecopy(_addr, add(o_code, 0x20), 0, size)
        }
    }
}
