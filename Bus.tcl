

#To monitor traffic for Bus topology using NS2

set ns [new Simulator]


set nf [open out.nam w]
$ns namtrace-all $nf

set nf1 [open bus.tr w]
$ns trace-all $nf1


proc finish {} {
    global ns nf nf1
    $ns flush-trace
    close $nf
    exec nam out.nam &
    exit 0
}

#Create four nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#CreateLanbetween the nodes
set lan0 [$ns newLan "$n0 $n1 $n2 $n3 $n4" 0.5Mb 40ms LL Queue/DropTail MAC/Csma/Cd Channel]

#Create a TCP agent and attach it to node n0
set tcp0 [new Agent/TCP]

$ns attach-agent $n1 $tcp0

#Create a TCP Sink agent (a traffic sink) for TCP and attach it to node n3
set sink0 [new Agent/TCPSink]
$ns attach-agent $n3 $sink0
#Connect the traffic sources with the traffic sink
$ns connect $tcp0 $sink0

# Create a CBR traffic source and attach it to tcp0
set ftp0 [new Application/FTP]

$ftp0 attach-agent $tcp0

#Schedule events for the CBR agents
$ns at 0.5 "$ftp0 start"
$ns at 7.5 "$ftp0 stop"


#Call the finish procedure after 5 seconds of simulation time
$ns at 8.0 "finish"

#Run the simulation
$ns run

