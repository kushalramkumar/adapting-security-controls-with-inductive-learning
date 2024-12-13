#modeb(1, neq(var(endpoint), var(endpoint))).
#modeb(1, endpoints(var(endpoint), var(endpoint))).

#modeb(1, malicious_endpoint(var(endpoint))).

#modeb(1, protocol(var(protocol))).
#modeb(1, protocol(const(protocol))).
#modeb(1, unavailable(var(endpoint))).
%#modeh(1, communicate(var(endpoints), var(protocol), var(packet_rate))).
#modeh(1, communicate).
#modeb(1, communicate).

#constant(endpoint, malicious_endpoint).
#constant(endpoint, trusted_endpoint).
#constant(endpoint, alexaechodot).
#constant(protocol, http).
#constant(protocol, https).

#maxv(4).

#pos({communicate}, {}, { endpoints(trusted_endpoint, alexaechodot). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#pos({communicate}, {}, { endpoints(trusted_endpoint, alexaechodot). protocol(https). packet_rate(exceeds_limit). available(alexaechodot).}).
#pos({communicate}, {}, { endpoints(alexaechodot, trusted_endpoint). protocol(https). packet_rate(within_limit). available(alexaechodot).}).
#pos({communicate}, {}, { endpoints(alexaechodot, trusted_endpoint). protocol(https). packet_rate(exceeds_limit). available(alexaechodot).}).

#pos({}, {communicate}, { endpoints(trusted_endpoint, alexaechodot). protocol(https). packet_rate(exceeds_limit). unavailable(alexaechodot).}).
#pos({}, {communicate}, { endpoints(alexaechodot, malicious_endpoint).}).
#pos({}, {communicate}, { endpoints(malicious_endpoint, alexaechodot).}).
%#pos({}, {communicate}, { endpoints(trusted_endpoint, trusted_endpoint). }).