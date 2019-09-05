user_1 = User.create(username: "Hi", email: "hi@hi.com", password: "hi")

circumstance_1 = Circumstance.create(context: "is responsible for maximizing Party 2's health.")
circumstance_2 = Circumstance.create(context: "is dependent upon Party 1 to be maximally healthy.")

concerned_party_1 =  ConcernedParty.create(identifier: "Drug user", circumstances: [circumstance_1])
concerned_party_2 =  ConcernedParty.create(identifier: "Dependent", circumstances: [circumstance_2])

imperative_ranking_1 = ImperativeRanking.create(characteristic: "health", concerned_party: concerned_party_2, operation: "maximize", importance_ranking: 1)
concerned_party_1.imperative_rankings << imperative_ranking_1
imperative_ranking_2 = ImperativeRanking.create(characteristic: "happiness", concerned_party: concerned_party_1, operation: "increase", importance_ranking: 2)
concerned_party_2.imperative_rankings << imperative_ranking_2

possible_action_1 = PossibleAction.create(description: "Party 1 uses drugs")
effect_likelihood_1 = EffectLikelihood.create(characteristic: "happiness", operation: "increase", likelihood: 0.8, concerned_party: concerned_party_1)
possible_action_1.effect_likelihoods << effect_likelihood_1

possible_action_2 = PossibleAction.create(description: "Party 1 does not use drugs")
effect_likelihood_2 = EffectLikelihood.create(characteristic: "health", operation: "maximize", likelihood: 0.8, concerned_party: concerned_party_2)
possible_action_2.effect_likelihoods << effect_likelihood_2

user_1.authored_ethical_arguments << EthicalArgument.create(
    title: "When is drug use immoral?",
    topic: "drugs",
    summary: "People should not consume drugs while responsible for dependents.",
    concerned_partys: [concerned_party_1, concerned_party_2],
    possible_actions: [possible_action_1, possible_action_2]
)