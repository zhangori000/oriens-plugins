---
name: baby-steps
description: "Use for /baby-steps, or when the user asks for baby steps, a detailed walkthrough, or help understanding syntax or logic. Explain in great detail, one small step at a time, and define every term with chained relative clauses ('X is a Y, which is a Z, which does W') until every word is one the reader already knows."
user-invocable: true
---

# Baby steps

Use this skill when the user wants to understand something slowly and in depth. Also follow `response-formatter` if it is available. When the two disagree about order, this walk order wins.

## Walk order for code

A baby step is one parameter, one expression, or one helper. A step is not a conclusion, a list of users, or a project handoff.

When the user pastes code, or points at a signature, an `if`, or a return, use this order. Stop at the step they asked for.

1. State the claim in one or two sentences: what data the code reads, and what decision it returns. Do not open with why another system, project, or later section cares.
2. Show the real source. A translation into another language comes after that source, and the paragraph says it is a translation.
3. If they asked what an input means, stop after the inputs. For each parameter, give its name, its type, one concrete value, the function that created that value, and the later field that reads it.
4. Follow one concrete value in execution order. For `compose`, read from the bottom line upward, because the output of each part is the input of the part above it. Define each library function at the moment it appears, and give the plain equivalent. `any(pred)` is `.some(pred)`. `converge(and, [f, g])` is `f(item) && g(item)`. `Boolean(0)` is `false`, and `Boolean(1)` is `true`. Confirm the actual library's semantics before applying these equivalents to existing code.
5. Explain a helper before the function that calls it.
6. For a `return`, name the caller and the consumer before interpreting the object. Say which function called this one, and which response field, stored value, or header receives the result. "It returns the same lists" is not an explanation until those two names are in the reply.
7. Show one input and the output object or value it produces.
8. Only after that output, and only if the user is asking why the section exists, say how this rule disagrees with another rule.

When the user says the explanation is confusing, or that the function was not broken down, the next reply starts at the exact characters they named. Do not rewrite the conclusion in simpler words.

An intention sentence names the code unit. "My intention with this step is to follow `path(['data', 'access_token'])` on one response" identifies the expression being explained. It does not substitute a business conclusion for executing the code.

## Why summary-first replies fail

If the user asks what the inputs are, then who calls a function, then who reads the returned object, those questions correspond to steps 3 and 6.

Summarizing the business result before executing the signature skips the requested explanation. A shorter retelling of the same conclusion does not repair a skipped step.

## The core rule: define recursively with relative clauses

A relative clause is a clause that begins with "which", "that", "who", or "where" and describes the noun before it. Use relative clauses to define every term, and keep chaining them until every word in the definition is one the reader already knows.

Stop only when the last clause uses plain words. Do not stop after one level when the definition itself contains an unexplained term.

One level is not enough:

"`map` is a higher-order function."

Recursive is right:

"`map` is a method on arrays, which is a function attached to every array, which takes another function as its argument, which makes `map` a higher-order function, which is any function that accepts or returns another function. `map` calls that argument once per element and returns a new array, which holds each result in the same order."

## Explanation constructs

Use these grammatical constructs to attach an explanation to the word or action it explains. Chain them, so that each new clause explains a word from the clause before it.

**For nouns (the adjective role)**

- A relative clause is a clause that starts with "which", "that", "who", or "where" and describes the noun before it. "A Promise is an object, which stands for a value that will exist later."
- An appositive is a noun phrase placed right after another noun to rename it, set off by commas. "`map`, a method on every array, returns a new array."
- A participial phrase is a phrase that starts with a verb ending in "-ing" or "-ed" and describes a noun. "The loop, having used its last send, returns the failure." "A value typed `unknown` must be checked before use."

**For actions and whole statements (the adverb role)**

- A sentential relative clause is a "which" clause that describes the entire clause before it, not one noun. "The loop stops early, which means the remaining elements are never visited."
- An adverbial clause of cause starts with "because" or "since" and says why. "It returns `false` because the server already said how long to wait."
- An adverbial clause of condition starts with "if", "unless", or "only if" and says when the action applies. "It resends the request only if the endpoint is replay-safe."
- An adverbial clause of time starts with "when", "before", "after", "until", or "while". "It waits until the Promise settles."
- An adverbial clause of contrast starts with "although", "whereas", or "while" and sets two facts against each other. "A GET is resent, whereas a POST is sent once."
- A purpose phrase starts with "so that" or "in order to" and says what the action is for. "It trims the slash so that the URL never contains `//`."
- A means phrase starts with "by" plus a verb ending in "-ing" and says how the action is done. "It avoids a second parse by reading `data` directly."
- A result clause starts with "so" or "which means" and says what follows from the action. "The budget is 1, so the loop never runs."

**Prepositional phrases**

A preposition is a word that links a noun to the rest of the sentence and states their relationship. Pick the preposition that states the exact relationship.

- "By" states the means: "by reading the header".
- "For" states the purpose or the beneficiary: "a default for apps that pass no timeout".
- "With" and "without" state what accompanies the action: "a request without a body".
- "Instead of" states the rejected alternative: "returns a value instead of throwing".
- "Through" and "via" state the channel: "sent through the app's transport".
- "From" and "into" state a transformation: "turns the JSON into cards".
- "Per" states the unit that something is counted or applied against: "a 15-second deadline per send".
- "Because of" and "due to" state a cause as a noun phrase: "fails because of a missing token".
- "Despite" states a fact that did not change the outcome: "sent once despite the 503".
- "On" states the triggering event: "retries on a 503".

**Signposts for definitions and examples**

- "That is" or "in other words" restates the previous sentence in plainer words.
- "For example" or "such as" introduces a concrete instance right after an abstract term.

## Show first, then explain

- The one-or-two-sentence claim in the walk order comes before the first code block. After that, put each expression's code before the paragraph that explains that expression.
- Build a composite type one piece at a time. Show each piece as its own small code block with a sentence, then show the combined type last.
- When a word such as "object", "intersection", or "union" appears, show a tiny literal example of it before defining it.
- Write one idea per sentence. Never pack several type terms, fields, and consequences into one sentence. If a sentence contains a list of three or more technical nouns, split it.

## Re-introduce names; do not rely on memory

- When a step uses a function, type, or variable from an earlier step or an earlier reply, give a short recap first: one sentence on what it is and a two-to-five-line code reminder.
- Never write "from section 2" or "as we saw earlier" without that recap. The reader may have forgotten it.

## Be very detailed

- Depth means every word in the current expression is defined. It does not mean adding the next branch, the next user, or the next project.
- Take one small step at a time. A step is one parameter, one expression, or one helper.
- Explain what the code literally says before explaining what it does, and explain what it does before explaining why it exists.
- Split a compound expression into its parts, and define each operator the first time it appears.
- Show a concrete example with real input values and the output they produce.
- Write in full grammatical sentences, not fragments or captions.

## Intention sentences

- Open the reply with one sentence that starts "My intention with this response is to".
- Open each step with one sentence that starts "My intention with this step is to".

## Avoid

- Avoid tables. Use prose, lists, or code.
- Avoid analogies. Use precise technical terms, and define them with relative clauses.
- Avoid guessing about real code. Read the file on disk first when it exists.
- Avoid leading with a translation of Go, Swift, or Kotlin. Show the real source first.
- Avoid explaining a `return` before naming the function that called it and the field or consumer that receives its value.
- Avoid answering "what is this input?" by walking later branches.
- Avoid running ahead. Cover what the user asked about, then stop.
