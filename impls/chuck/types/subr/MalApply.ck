public class MalApply extends MalSubr
{
    fun MalObject call(MalObject args[])
    {
        args[0] @=> MalObject f;
        MalObject.slice(args, 1, args.size()-1) @=> MalObject _args[];
        MalObject.toMalObjectArray(args[args.size()-1].objects) @=> MalObject rest[];

        MalObject.append(_args, rest) @=> _args;
        return (eval$MalSubr).apply(f, _args);
    }
}
