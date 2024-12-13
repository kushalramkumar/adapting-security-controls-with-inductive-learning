#modeb(1, neq(var(endpoint), var(endpoint))).
#modeb(1, endpoints(var(endpoint), var(endpoint))).
#modeb(1, endpoints(var(endpoint), const(endpoint))).
#modeb(1, endpoints(const(endpoint), var(endpoint))).
#modeb(1, endpoint(var(endpoint))).
#modeb(1, endpoint(const(endpoint))).

%#modeb(1, malicious_endpoint(var(endpoint))).

#modeb(1, protocol(var(protocol))).
#modeb(1, protocol(const(protocol))).
#modeb(1, unavailable(var(endpoint))).
#modeh(1, communicate).

#constant(endpoint, malicious_endpoint).
#constant(endpoint, single_endpoint).
#constant(endpoint, alexaechodot).
#constant(protocol, http).
#constant(protocol, https).

#maxv(4).

#pos({}, {}, { endpoints(single_endpoint, alexaechodot). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#pos({}, {}, { endpoints(alexaechodot, single_endpoint). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#pos({}, {}, { endpoints(single_endpoint, alexaechodot). protocol(https). packet_rate(exceeds_limit). }).
#pos({}, {}, { endpoints(alexaechodot, single_endpoint). protocol(https). packet_rate(exceeds_limit). available(alexaechodot).}).

#neg({}, {}, { endpoints(malicious_endpoint, alexaechodot). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#neg({}, {}, { endpoints(alexaechodot, malicious_endpoint). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#neg({}, {}, { endpoints(single_endpoint, malicious_endpoint). protocol(https). packet_rate(exceeds_limit). }).
#neg({}, {}, { endpoints(malicious_endpoint, single_endpoint). protocol(https). packet_rate(exceeds_limit). available(alexaechodot).}).

#neg({}, {}, { endpoints(alexaechodot, alexaechodot). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#neg({}, {}, { endpoints(alexaechodot, single_endpoint). protocol(http). packet_rate(within_limit). available(alexaechodot).}).
#neg({}, {}, { endpoints(single_endpoint, alexaechodot). protocol(http). packet_rate(within_limit). available(alexaechodot).}).

#neg({}, {}, { endpoints(single_endpoint, alexaechodot). protocol(https). packet_rate(exceeds_limit). unavailable(alexaechodot).}).