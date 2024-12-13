% Types
type(device).

% Assets and Protocols
device(alexaechodot).
protocols(http; https; icmp).
packet_rate(normal; exceeds_limit).

% Trusted Endpoints
trusted_endpoints(trusted_endpoint).

% Malicious Endpoints
malicious_endpoints(c2c_server1; c2c_server2; malicious_endpoint).

external_elements(X) :- trusted_endpoints(X).
external_elements(X) :- malicious_endpoints(X).

endpoint(X) :- device(X).
endpoint(X) :- external_elements(X).

endpoints(S, D) :- endpoint(S), endpoint(D).

% Predicates describing the operations in the smart home
unavailable(X) :- not available(X), endpoint(X).

{ available(X) : device(X) }.

{ communicate(S, D, P, F) : endpoints(S, D), endpoint(S), endpoint(D), protocols(P), packet_rate(F) } = 1.

% Security Requirement: Ensuring Availability of the devices in the smart home
:- unavailable(S), device(S).