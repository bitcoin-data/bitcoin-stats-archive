#!/bin/bash

URL=https://www.dsn.kastel.kit.edu/bitcoin/data/

declare -a FILES=(
  # --- Nodes ---
  #
  # Connection Count (for two nodes)
  # Desc: We operate two monitor peers that try to establish connections to all reachable peers of the Bitcoin P2P network. The total number of connections includes all connections to IPv4 and IPv6 addresses. The number of sybil connections is simply the difference between the total number of connections and the number of unique IP addresses we are connected to. As peers may be dual stacked (i.e., reachable via IPv4 and IPv6), the total number of unique reachable peers is most likely lower than what the plot suggests. The total size of the Bitcoin network, however, also includes non-reachable peers and is therefore much bigger.
  "churn0-v.gpd"
  "churn1-v.gpd"
  #
  # Distribution of Connection Durations (for two nodes)
  # Desc: This plot shows the share of peers connected to our monitor nodes for at least a certain amount of time. E.g., more than 90% of peers are connected for at least one hour. Again, we do not know how long other peers remain in the network, only how long they are connected to our peers.
  "ot10-v.gpd"
  "ot11-v.gpd"
  #
  # Churn (for two nodes)
  # Desc: Here, churn means how many connections are established or closed per hour to each of our monitor nodes. We do not know how many peers actually join or leave the network. Peaks in this plot are most likely caused by an interruption of our internet connection.
  "churn0.gpd"
  "churn1.gpd"
  #
  # IPv6 Tunnel (loading 'all' data)
  "ip,tunnel_all.gp"
  #
  # --- User Agents ---
  #
  # Version Strings
  # Desc: Announced Version strings.
  "versionstr_all.gp"
  #
  # Version ID
  # Desc: Annouced versionIDs
  "versionid_all.gp"
  #
  # Services
  # Desc: Announced Services.
  "services_all.gp"
  #
  # --- Whois ---
  #
  # Country
  # Desc: Number of peers per country.
  "whois,asn_country_code_all.gp"
  #
  # AS Description
  "whois,asn_description_all.gp"
  #
  # --- Observed Addresses ---
  #
  # Unique Addresses per Day
  # Desc: Number of unique addresses observed in unsolicted ADDR messages per day. The number of unreachable addresses is an estimate of the number of unreachable peers in the Bitcoin P2P network (see Research).
  # NO DATA!
  #
  # --- Propagation of Transactions and Blocks ---
  #
  # INV per Hour
  # Desc: This plot shows the total number of INV messages received per hour. No blockchain information is used here (i.e., it does not matter whether a transaction is included in a block or not).
  "invstat.gpd"
  #
  # Current Block Propagation Delay Distribution
  # Desc: The elapsed time between the first reception of an INV message announcing a new block and the subsequent receptions from other peers is shown here. This plot does not show when network peers receive blocks, only when they announce new blocks to our monitor peers. Blocks that were relayed by fewer than 50 % of the peers are ignored.
  # "curblock.gpd"
  #
  # Block Propagation Delay History
  # Desc: Based on above data we calculated the time it takes until 50% (90% resp.) of network peers announce a specific block.
  # already loaded above: "invstat.gpd"
  #
  # Current Transaction Propagation Delay Distribution
  # Desc: The elapsed time between the first reception of an INV message announcing a new transaction and the subsequent receptions from other peers is shown here. This plot does not show when network peers receive transactions, only when they announce new transactions to our monitor peers. Transactions that were relayed by fewer than 50 % of the peers are ignored.
  # "curtx.gpd"
  #
  # Transaction Propagation Delay History
  # Dec: Based on above data we calculated the time it takes until 50% (90% resp.) of network peers announce a specific transaction.
  # already loaded above: "invstat.gpd"
  #
  # --- Latency ---
  #
  # Current Latency Distribution
  # Desc: CDF of the current measured latency using ICMP/TYP SYN Pings and Bitcoin Pings.
  # "curicmp.gpd"
  # "curbtc.gpd"
  #
  # Latency History
  # Desc: Median Latency over time using ICMP/TYP SYN Pings and Bitcoin Pings.
  "icmppings.gpd"
  "btcpings.gpd"
  #
  # --- Activity on the Bitcoin Network ---
  #
  # Announcements per Peer
  # Desc: A considerable number of peers on the Bitcoin P2P network do not relay transactions or blocks to our monitor peer. This plot shows for each peer (x-axis) the number of announced hashes per hour.
  # "curactivity.gpd"
  #
  # Announcements per Hash
  # Desc: This plot shows for each hash (x-axis) the number of announced peers that announced that hash per hour.
  # "curinv.gpd"
  #
)

for file in ${FILES[@]}; do
  wget -O $file $URL/$file
done

# There are two more DSN setups that collect data: "I" and "N". Fetch data from these too.
mkdir -p I
URL=https://www.dsn.kastel.kit.edu/bitcoinI/data/
for file in ${FILES[@]}; do
  wget -O I/$file $URL/$file
done

mkdir -p N
URL=https://www.dsn.kastel.kit.edu/bitcoinN/data/
for file in ${FILES[@]}; do
  wget -O N/$file $URL/$file
done
