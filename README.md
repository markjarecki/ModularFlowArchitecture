# ModularFlowArchitecture
This repository contains an example modular, multi-layered flow iOS architecture.

Designed for working with a regularly changing codebase, across specialised teams, and to rapidly incorporate your user flows into your applications.

Read my Medium article  describing this example project. 

### Building a dynamic modular iOS architecture
https://medium.com/fluxom/building-a-dynamic-modular-ios-architecture-1b87dc31278b

## Requirements

XCode 10.2

## Installation

1. `git clone https://github.com/markjarecki/ModularFlowArchitecture.git`
2. `cd ModularFlowArchitecture`
3. Open ModularFlowArchitecture.xcworkspace in Xcode
4. Build it and run

## Caveats

- Code is provided as-is
- FLXFlow processing is not thread-safe, so call `process(action:)` on the main thread