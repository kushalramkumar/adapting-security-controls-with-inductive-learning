# adapting-security-controls-with-inductive-learning

This repository contains the experiments performed to adapt a pre-defined model of a smart home using [Inductive Learning for Answer Set Programming (ILASP3)](https://www.ilasp.com/).

The smart home and its security requirements are first modelled using the [Clingo Answer Set Programming (ASP) tool](https://potassco.org/doc/start/), which uses a declarative programming paradigm where the system is represented by a logic program rather than its control flow. Then positive and negative samples of system behaviour are provided in ILASP's language (called its mode bias), to learn an adapted version of the pre-defined model. This adapted model is then used to derive the security controls of the system. We use a [data set](https://zenodo.org/records/14380178) that encodes attacks from the CICIoT2023 and IoT-23 data sets into ASP programs to create the examples for ILASP.

The layout of the repository is as follows:
- The model of the smart home is provided in home.lp
- The file dos.las demonstrates how Denial-of-Serice (DoS) attack traces can be used to learn secure versions of the communicate predicate (originally defined in home.lp).
- The file learn_predicates.las demonstrates alternate ways of learning the communicate predicate.
- The file learn_constraints.las demonstrates how security requirements (represented as integrity constraints) can be learned from attack traces.

# Pre-Requisites
1. Install [clingo](https://potassco.org/clingo/) from the official page (in turn requires Anaconda or Miniconda)
2. Install [ILASP](https://www.ilasp.com/download)

# Running our examples
## Learning secure predicates that prevent a DoS attack
```
<path-to-ILASP> --version=4 dos.las
```

Expected Output:
communicate :- packet_rate(within_limit).
communicate :- endpoints(V1,V2); available(V1).

## Learning secure predicates from positive and negative traces
```
<path-to-ILASP> --version=4 learn_predicates.las
```

Expected Output:
communicate :- endpoints(V1,V2); protocol(https); not unavailable(V2).

## Learning security requirements from system traces
```
<path-to-ILASP> --version=4 learn_constraints.las
```

Expected Output:
 :- endpoints(malicious_endpoint,V1).
 :- endpoints(V1,malicious_endpoint).
 :- endpoints(V1,V1).
 :- unavailable(V1).
 :- not protocol(https).
