namespace Quantum_Number_Generator{
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation Main() : Int {
        let max = 15;
        Message("Random number between ) and {max} : ");
        return Inrange(max);
    }

    operation Inrange(max : Int) : Int{

        mutable bits =[];
        let nBits = BitSizeI(max);
        for idxBit in 1..nBits {
            set bits += [RandomBit()];
    }
    let sample = ResultArrayAsInt(bits);
    return sample > max ? Inrange(max) | sample;
    }

    operation RandomBit() : Result {
        use q = Qubit();
        H(q);
       let result = M(q);
       Reset(q);
        return result;
    }
}