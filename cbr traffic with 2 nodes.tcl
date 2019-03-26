set ns [new Simulator]

set nf [open a.nam w]
$ns namtrace-all $nf

set nf1 [open out4.tr w]
$ns trace-all $nf1

proc finish {} {
global ns nf nf1
$ns flush-trace
close $nf
exec nam a.nam &

exit 0
}

set n1 [$ns node]
set n2 [$ns node]

$n1 color red
$n2 color blue

$ns duplex-link $n1 $n2 2Mb 10ms DropTail

set udp0 [new Agent/UDP]
$ns attach-agent $n1 $udp0

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 1
$cbr0 attach-agent $udp0

set null1 [new Agent/Null]
$ns attach-agent $n2 $null1

$ns connect $udp0 $null1

$ns at 0.5 "$cbr0 start"
$ns at 5.5 "$cbr0 stop"
$ns at 6.0 "finish"
$ns run


