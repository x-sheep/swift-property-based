//
//  Gen+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 20/06/2025.
//

#if swift(>=6.2)
extension Gen {
    public static func oneOf<Input>(_ generators: Generator<Value, AnySequence<Input>>...)
        -> Generator<Value, AnySequence<(index: Int, value: Input)>>
    {
        return frequency(
            generators.map { gen in (rate: 1.0, gen) }
        )
    }

    public static func frequency<Input>(
        _ generators: [(rate: FloatLiteralType, gen: Generator<Value, AnySequence<Input>>)]
    )
        -> Generator<Value, AnySequence<(index: Int, value: Input)>>
    {
        var total: FloatLiteralType = 0
        let options = generators.map { rate, gen in
            precondition(rate >= 0, "Rate must be non-negative, found a rate of \(rate)")

            total += rate
            return (limit: total, gen: gen)
        }

        return Generator(
            run: { [total] rng in
                let pick = FloatLiteralType.random(in: 0..<total, using: &rng)
                let index = options.firstIndex { $0.limit > pick }! as Int

                return (index: index, value: options[index].gen._runIntermediate(&rng))
            },
            shrink: { pair in
                let opt = options[pair.index]
                let shrunk = opt.gen._shrinker(pair.value).lazy.map { (index: pair.index, value: $0) }
                return AnySequence(shrunk)
            },
            finalResult: { pair in
                let opt = options[pair.index]
                return opt.gen._mapFilter(pair.value)
            }
        )
    }

    @_disfavoredOverload
    public static func oneOf<each Seq: Sequence>(_ generators: repeat Generator<Value, each Seq>)
        -> Generator<Value, AnySequence<(index: Int, value: Any)>>
    {
        var gens: [(rate: FloatLiteralType, gen: Generator<Value, AnySequence<Any>>)] = []

        for gen in repeat each generators {
            gens.append((rate: 1.0, gen.eraseToAny()))
        }

        return frequency(gens)
    }

    @_disfavoredOverload
    public static func frequency<each Seq: Sequence>(
        _ generators: repeat (rate: FloatLiteralType, gen: Generator<Value, each Seq>)
    )
        -> Generator<Value, AnySequence<(index: Int, value: Any)>>
    {
        var gens: [(rate: FloatLiteralType, gen: Generator<Value, AnySequence<Any>>)] = []

        for (rate, gen) in repeat each generators {
            gens.append((rate: rate, gen.eraseToAny()))
        }

        return frequency(gens)
    }
}
#endif  // swift(>=6.2)
