//
//  Gen+Frequency.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 20/06/2025.
//

#if swift(>=6.2)
extension Gen {
    /// Produces a generator that randomly selects one of the provided generators.
    ///
    /// Every generator has an equal chance of being run.
    ///
    /// ## Precondition
    /// At least one generator must be provided.
    ///
    /// ## Example
    /// ```swift
    /// enum Choice {
    ///     case plain
    ///     case number(Int)
    ///     case text(String)
    /// }
    ///
    /// Gen.oneOf(
    ///     Gen.always(Choice.plain),
    ///     Gen.int().map(Choice.number),
    ///     Gen.lowercaseLetter.string(of: 8).map(Choice.text),
    /// )
    /// ```
    ///
    /// - Parameter generators: The generators to choose from.
    /// - Returns: A new generator.
    @_documentation(visibility: internal)
    public static func oneOf<Input>(_ generators: Generator<Value, AnySequence<Input>>...)
        -> Generator<Value, AnySequence<(index: Int, value: Input)>>
    {
        return frequency(
            generators.map { gen in (weight: 1.0, gen) }
        )
    }

    /// Produces a generator that randomly selects one of the provided generators, with a weighted distribution.
    ///
    /// ## Precondition
    /// At least one generator with a weight above zero must be provided.
    ///
    /// ## Example
    /// ```swift
    /// enum Choice {
    ///     case plain
    ///     case number(Int)
    ///     case text(String)
    /// }
    ///
    /// Gen.frequency(
    ///     (0.5, Gen.always(Choice.plain)),
    ///     (1, Gen.int().map(Choice.number)),
    ///     (2, Gen.lowercaseLetter.string(of: 8).map(Choice.text)),
    /// )
    /// ```
    ///
    /// - Parameter generators: The generators to choose from, with a weight for each.
    /// - Returns: A new generator.
    @_documentation(visibility: internal)
    public static func frequency<Input>(
        _ generators: [(weight: FloatLiteralType, gen: Generator<Value, AnySequence<Input>>)]
    )
        -> Generator<Value, AnySequence<(index: Int, value: Input)>>
    {
        precondition(!generators.isEmpty, "At least one generator must be specified.")

        var total: FloatLiteralType = 0
        let options = generators.map { weight, gen in
            precondition(weight >= 0, "Weight must be non-negative, found a weight of \(weight)")

            total += weight
            return (limit: total, gen: gen)
        }

        precondition(total > 0, "At least one generator with a weight above 0 must be specified.")

        return Generator(
            run: { [total] rng in
                let pick = FloatLiteralType.random(in: 0..<total, using: &rng)
                let index = options.firstIndex { $0.limit > pick }! as Int

                return (index: index, value: options[index].gen.runFull(&rng).input)
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

    /// Produces a generator that randomly selects one of the provided generators.
    ///
    /// Every generator has an equal chance of being run.
    ///
    /// ## Precondition
    /// At least one generator must be provided.
    ///
    /// ## Example
    /// ```swift
    /// enum Choice {
    ///     case plain
    ///     case number(Int)
    ///     case text(String)
    /// }
    ///
    /// Gen.oneOf(
    ///     Gen.always(Choice.plain),
    ///     Gen.int().map(Choice.number),
    ///     Gen.lowercaseLetter.string(of: 8).map(Choice.text),
    /// )
    /// ```
    ///
    /// - Parameter generators: The generators to choose from.
    /// - Returns: A new generator.
    @_disfavoredOverload
    public static func oneOf<each Seq: Sequence>(_ generators: repeat Generator<Value, each Seq>)
        -> Generator<Value, AnySequence<(index: Int, value: Any)>>
    {
        var gens: [(weight: FloatLiteralType, gen: Generator<Value, AnySequence<Any>>)] = []

        for gen in repeat each generators {
            gens.append((weight: 1.0, gen.eraseToAny()))
        }

        return frequency(gens)
    }

    /// Produces a generator that randomly selects one of the provided generators, with a weighted distribution.
    ///
    /// ## Precondition
    /// At least one generator with a weight above zero must be provided.
    ///
    /// ## Example
    /// ```swift
    /// enum Choice {
    ///     case plain
    ///     case number(Int)
    ///     case text(String)
    /// }
    ///
    /// Gen.frequency(
    ///     (0.5, Gen.always(Choice.plain)),
    ///     (1, Gen.int().map(Choice.number)),
    ///     (2, Gen.lowercaseLetter.string(of: 8).map(Choice.text)),
    /// )
    /// ```
    ///
    /// - Parameter generators: The generators to choose from, with a weight for each.
    /// - Returns: A new generator.
    @_disfavoredOverload
    public static func frequency<each Seq: Sequence>(
        _ generators: repeat (weight: FloatLiteralType, gen: Generator<Value, each Seq>)
    )
        -> Generator<Value, AnySequence<(index: Int, value: Any)>>
    {
        var gens: [(weight: FloatLiteralType, gen: Generator<Value, AnySequence<Any>>)] = []

        for (weight, gen) in repeat each generators {
            gens.append((weight: weight, gen.eraseToAny()))
        }

        return frequency(gens)
    }
}
#endif  // swift(>=6.2)
