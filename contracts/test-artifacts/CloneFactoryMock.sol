pragma solidity ^0.5.0;

import '../proxies/CloneFactory.sol';
import '../proxies/Clone2Factory.sol';
import '../proxies/Clone2Probe.sol';
import '../proxies/Create2Probe.sol';


contract CloneFactoryMock is
  CloneFactory,
  Clone2Factory,
  Clone2Probe,
  Create2Probe
{
  event CloneCreated(address proxyAddress);

  function createClone(
    address target
  ) external
  {
    address result = _createClone(target);
    emit CloneCreated(result);
  }

  function createClone2(
    address target,
    bytes12 salt
  ) external
  {
    address result = _createClone2(target, salt);
    emit CloneCreated(result);
  }
}