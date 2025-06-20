//
//  Gen+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 20/06/2025.
//

extension Gen {
    public static func oneOf<Input>(_ generators: Generator<Value, AnySequence<Input>>...)
        -> Generator<Value, AnySequence<(index: Int, value: Input)>>
    {
        return frequency(
            generators.map { gen in (rate: 1.0, gen) }
        )
    }

    public static func frequency<Input>(_ generators: [(rate: Float, gen: Generator<Value, AnySequence<Input>>)])
        -> Generator<Value, AnySequence<(index: Int, value: Input)>>
    {
        var total: Float = 0
        let options = generators.map { rate, gen in
            precondition(rate >= 0, "Rate must be non-negative, found a rate of \(rate)")

            total += rate
            return (limit: total, gen: gen)
        }

        return Generator(
            run: { [total] rng in
                let pick = Float.random(in: 0..<total, using: &rng)
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
}
