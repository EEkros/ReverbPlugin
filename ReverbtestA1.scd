
//
//Reverb1 {
//	*ar  {| in |
//		var out = in;
//		out = AllpassN.ar ( out,0.05, 0.05.rand, 1 );
//		^out;
//	}
// }

(
 x = {
	 var freq, son, out;

	freq = EnvGen.ar ( Env.perc ( 0, 0.1 ,10000 ), Dust.ar ( 1 ));
	// out = { Re	son = SinOsc.ar ( freq, 0, 0.1 );
	son = Saw.ar ( freq, 0, 0.1 );
    verb1.ar ( son, cutoff: 2500 )}.dup;
}.play ( s );
)
x.free;

 XLine.k
 XLine.k
SLIne.kkk

FreqScope.new;

FreqScope.new;
FreqScope.new;


(
  SynthDef ( "dreyblattcord", { arg freq = 440;
	var osc, son;

	osc = Saw.ar ( freq ); // 800 Hz sine oscillator
	// Reverb1.ar ( osc );
	son = DelayN.ar ( osc, 0.2,0.1 );
    osc = osc + son;
	Out.ar ( 0, osc ); // send output to audio bus zero.
}).add;
)

	s.scope; // scope so you can see the effect
	x = Synth.new("dreyblattcord");
	x.set("freq", 660);
	x.set("freq", 880, "out", 1);
	x.free;


