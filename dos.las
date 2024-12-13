%% Final Hypothesis: 
%%  
%communicate :- endpoints(V1,V2).
%:- endpoints(V1,V2); not available(V1); not packet_rate(within_limit). 

#modeb(1, endpoints(var(endpoint), var(endpoint))).
#modeb(1, unavailable(var(endpoint))).
#modeb(1, available(var(endpoint))).
#modeb(2, endpoint(var(endpoint))).

%#modeb(1, endpoints(const(endpoint), const(endpoint))).
%#modeb(1, unavailable(const(endpoint))).
%#modeb(1, available(const(endpoint))).
%#modeb(2, endpoint(const(endpoint))).

#modeb(1, packet_rate(const(packet_rate))).
#modeb(1, communicate).
#modeh(1, communicate).

#constant(endpoint, malicious_endpoint).
#constant(endpoint, single_endpoint).
#constant(endpoint, alexaechodot).
#constant(endpoint, amazonplug).

#constant(packet_rate, within_limit).
#constant(packet_rate, exceeds_limit).

#maxv(4).

% Learn: :- communicate(X,Y,_,P,F), X = single_endpoint, device(Y), protocols(P), F = exceeds_limit, not available(Y). % Diagnosis: DoS

#pos({communicate}, {}, {endpoints(alexaechodot, single_endpoint). endpoint(alexaechodot). endpoint(single_endpoint). packet_rate(within_limit). available(alexaechodot).}).
#pos({communicate}, {}, {endpoints(single_endpoint, alexaechodot). endpoint(alexaechodot). endpoint(single_endpoint). packet_rate(within_limit). available(alexaechodot).}).
#pos({communicate}, {}, {endpoints(amazonplug, single_endpoint). endpoint(amazonplug). endpoint(single_endpoint). packet_rate(within_limit). available(amazonplug).}).
#pos({communicate}, {}, {endpoints(single_endpoint, amazonplug). endpoint(amazonplug). endpoint(single_endpoint). packet_rate(within_limit). available(amazonplug).}).

#pos({communicate}, {}, {endpoints(alexaechodot, single_endpoint). endpoint(alexaechodot). endpoint(single_endpoint). packet_rate(exceeds_limit). available(alexaechodot).}).
#pos({communicate}, {}, {endpoints(amazonplug, single_endpoint). endpoint(amazonplug). endpoint(single_endpoint). packet_rate(exceeds_limit). available(amazonplug).}).
#neg({communicate}, {}, {endpoints(single_endpoint, amazonplug). endpoint(amazonplug). endpoint(single_endpoint). packet_rate(exceeds_limit). available(amazonplug).}).
#neg({communicate}, {}, {endpoints(single_endpoint, alexaechodot). endpoint(alexaechodot). endpoint(single_endpoint). packet_rate(exceeds_limit). available(alexaechodot).}).

#neg({communicate}, {}, {endpoints(single_endpoint, alexaechodot); endpoint(alexaechodot); endpoint(single_endpoint); packet_rate(exceeds_limit); unavailable(alexaechodot).}).
#neg({communicate}, {}, {endpoints(single_endpoint, amazonplug); endpoint(amazonplug); endpoint(single_endpoint); packet_rate(exceeds_limit); unavailable(amazonplug).}).
#neg({communicate}, {}, {endpoints(malicious_endpoint, alexaechodot); endpoint(alexaechodot); endpoint(single_endpoint); packet_rate(exceeds_limit); unavailable(alexaechodot).}).
#neg({communicate}, {}, {endpoints(malicious_endpoint, amazonplug); endpoint(amazonplug); endpoint(single_endpoint); packet_rate(exceeds_limit); unavailable(amazonplug).}).

%#neg({communicate}, {}, {}).