user1 = User.create(username: "Hi", email: "hi@hi.com", password: "hi")

circumstance_1 = Circumstance.create(params["circumstances"][0])
circumstance_2 = Circumstance.create(params["circumstances"][1])

concerned_party_1 =  ConcernedParty.create(identifier: "Drug user", circumstance: "is responsible for maximizing Party 2's health.")
concerned_party_2 =  ConcernedParty.create(identifier: "Dependent", circumstance: "is dependent upon Party 1 to be maximally healthy.")

imperative_ranking_1 = ImperativeRanking.create(params["imperative_rankings"][0])
imperative_ranking_2 = ImperativeRanking.create(params["imperative_rankings"][1])

possible_action_1 = PossibleAction.create(description: "Party 1 uses drugs")
effect_likelihood_1 = EffectLikelihood.create(characteristic: "happiness", operation: "increase", likelihood: .8)
possible_action_1.effect_likelihoods << effect_likelihood_1

possible_action_2 = PossibleAction.create(description: "Party 1 does not use drugs")
effect_likelihood_2 = EffectLikelihood.create(characteristic: "health", operation: "maximize", likelihood: .8)
possible_action_2.effect_likelihoods << effect_likelihood_2

ethical_argument_1 = EthicalArgument.create(
    title: "When is drug use immoral?",
    topic: "drugs"
    summary: "People should not consume drugs while responsible for dependents.",
    concerned_parties: []
)