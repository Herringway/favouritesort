import std.algorithm;
import std.array;
import std.format;
import std.range;
import std.stdio;
import std.string;

void main() {
	writeln("Enter your options. Enter a blank line to end the list.");
	string[] choices = stdin.byLine().until("").map!(x => x.idup).array;
	writefln!"%-(%s\n%)"(choices.sort!((x,y) => pick(x,y), SwapStrategy.stable).enumerate(1).map!(x => format!"%s. %s"(x.index,x.value)));
}

bool pick(T)(T a, T b) {
	writefln!"0. %s or 1. %s? "(a, b);
	while (true) {
		const line = readln().chomp();
		switch(line) {
			case "0":
				return true;
			case "1":
				return false;
			default:
				writeln("Enter 0 or 1.");
				break;
		}
	}
}