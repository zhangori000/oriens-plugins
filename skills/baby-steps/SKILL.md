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

## Walk order for passages, science, and math

When there is no code, such as a book passage, a science idea, or a calculation, use this order instead of the walk order for code. Stop at the step the reader asked about.

1. Quote the sentence, figure label, or equation the reader is on.
2. Name each term, unit, or symbol in it that the reader may not know, and define each one with chained relative clauses before using it to explain anything else. A number with a unit, such as "0.45 volts" or "700 nanometers", cannot be explained until the unit has been.
3. Follow one concrete thing through the idea with real numbers, and show each calculation.
4. Say what the sentence claims, in plain words, now that every piece is defined.
5. Give the significance: why the author needs this fact and what it sets up next.
6. Name the next sentence or idea in one sentence, and stop.

Do not add code to this kind of reply unless the reader asks for it. Diagrams, including ASCII diagrams, are still welcome.

When the reader says they are lost at a word, such as "volts" or "potential", the next reply starts at that word and builds it from things the reader already knows. Do not reword the sentence that used it.

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

## Short replies: fewer steps, each fully explained

Long replies skim. When a reply covers many steps, each line stops being explained and the reader cannot ask follow-ups easily.

- Cover at most two or three code lines or names per reply, then stop. The user will ask for the next one.
- Every line shown gets explained. If a step shows a snippet, every identifier and operator in it is defined, or the snippet is cut down to what is explained.
- This applies to code the assistant wrote as a teaching sketch too, not only to pasted production code. A sketch with trailing `// 1.`, `// 2.` comments is still unexplained until a sentence per line follows it, in execution order, with one concrete value flowing through.
- For each identifier, say what kind of thing it is in computer-science terms: a local variable, a module-level exported constant (imported by other files, not a global), a function parameter, a property on an object, a global on `window`, a method, or a type. Then say what it holds, using one concrete value.
- Locate an identifier by its enclosing construct before you explain its purpose. Show the line that declares it inside the code that encloses it, and trim the middle with `// ...`. Say what the enclosing code is, such as a React function component, a hook, a Redux selector, or a method of a class. Do not give file paths or line numbers. When the reader could confuse the kind, say which kinds it is not: "It isn't a class field, it isn't a method, and it isn't stored in Redux." Then say its lifetime and its visibility: "It gets created fresh on every re-render, and no other file can see it." When other files use the same source under the same name, say that each file creates its own local variable.
- For each array method or operator, such as `.filter`, `===`, or `?.`, say what it does to this specific input and show the output.
- After the literal reading, always give the significance. Say which real-world question the line answers, such as "has this user ever purchased a subscription?" Say why the data has this shape, such as why it is an array. Say why the code compares against this particular constant. Say what the program does differently with each answer. The literal reading alone ("checks that `e.id` equals X") is not an explanation.

## Teach the transferable concept

The reader will not reopen the file. What carries over to the next codebase is the algorithm, the system-design idea, and the computer science concept that this code is one instance of. That concept is the payoff of every step.

- Do not give file paths or line numbers in teaching prose. Name the construct instead, such as a React function component, a Redux selector, or an async thunk.
- Do not spend a step on syntax trivia, such as an import line, the spelling of a type annotation, or formatting, unless the syntax changes the behavior.
- After the literal reading of a line, name the general concept that the line is an instance of, using its standard name, such as read-your-writes consistency, three-valued logic, a finite state machine, the observer pattern, or memoization.
- Be specific about the concept. Give its standard name, the exact condition it describes, and one specific source where it is taught, such as a named book chapter, a paper, or a conference talk. Do not write "this is a common pattern" or "this is a race condition" without saying which race and between which two operations.
- Then map the concept back onto this code. Say which part of this code plays which role in the concept.

Wrong: "This line prevents a race condition."

That sentence names a category without saying which two operations race or which guarantee breaks, so the reader learns nothing that transfers.

Right: "The Redux store is the app's client-side copy of server data. Right after the app creates a profile, that copy lags behind the server until the refetch finishes. A decision that reads the copy during that window violates read-your-writes consistency, which is the guarantee that a user always sees the effects of their own writes (Martin Kleppmann, *Designing Data-Intensive Applications*, 1st edition, Chapter 5, 'Reading Your Own Writes'). The early return `if (isUpdatingAccount) return false` restores that guarantee by refusing to decide until the copy includes the new profile."

## Show where every name in a snippet comes from

A snippet that uses a name it does not define forces the reader to guess. `return [{ sku: planID, price: sku.displayPrice }]` alone leaves `planID`, `sku`, and `displayPrice` unexplained.

- Above the snippet, show the real lines that create each name, trimmed with `// ...`. Read the file to find them.

  ```ts
  const planID = isEligibleForFreeTrial ? FREE_TRIAL_PLAN_ID : REGULAR_PLAN_ID;
  const result = await window.storeSdk.getProductInfo(planID);
  // ...
  const sku = result[0].skus[0];
  // ...
  return [{ sku: planID, price: sku.displayPrice }];
  ```

- When a name comes from far away or from another file, add a typed comment header above the snippet instead, and label it as a summary rather than source:

  ```ts
  // planID: string, which is 'PLAN_TRIAL' or 'PLAN_MONTHLY', chosen a few lines up
  // sku: Sku, which is { id, name, price: number, displayPrice: string, ... }, declared in store-sdk.d.ts
  ```

- For each name, the prose then states its type, one concrete value, and its owner. The owner is our code, an npm package, or the platform runtime, such as a console store SDK exposed on `window`.
- Explain those origins before the line that uses them.
- Never leave a name for the reader to infer from its spelling.

## Re-introduce names; do not rely on memory

- When a step uses a function, type, or variable from an earlier step or an earlier reply, give a short recap first: one sentence on what it is and a two-to-five-line code reminder.
- Never write "from section 2" or "as we saw earlier" without that recap. The reader may have forgotten it.

## Be very detailed

- Depth means every word in the current expression is defined. It does not mean adding the next branch, the next user, or the next project.
- Take one small step at a time. A step is one parameter, one expression, or one helper.
- Explain what the code literally says before explaining what it does, and explain what it does before explaining why it exists.
- Split a compound expression into its parts, and define each operator the first time it appears.
- Show a concrete example with real input values and the output they produce.
- Never write "the same X" or "different Ys" without the referents in the same paragraph. Name the one thing that stays fixed, count and name the things that vary, and show them side by side so the reader sees the variation. "Different labels on the same link" fails; three URLs with one path and three query strings passes. The `response-formatter` skill has the full rule under the heading `Name what "same" and "different" refer to`.
- Write in full grammatical sentences, not fragments or captions.

## Intention sentences

- Open the reply with one sentence that starts "My intention with this response is to".
- Open each step with one sentence that starts "My intention with this step is to".

## "So far" recaps

The reader forgets the earlier steps by the time a later step arrives. An intention sentence looks forward to the current step. A "So far" recap looks back at the facts the earlier steps established, so that the reader does not have to scroll up.

- From the second step on, open each step with a recap that starts "So far, we have covered".
- Open a reply that continues an earlier walkthrough the same way, so that the recap also covers the steps from earlier replies.
- Recap facts, not topics. Each earlier step gets one clause or sentence that names the concrete thing it established, such as the file, the construct, the value, or the function that wrote the value.
- When three or more steps came before, write the recap as a short numbered list with one grammatical sentence per earlier step, instead of one long sentence.
- The recap does not replace "Re-introduce names; do not rely on memory." When the current step uses a name, still give that name's code reminder.

Wrong: "So far, we have covered the file, the component, and the hook."

That sentence lists step titles. The reader still has to scroll up to learn which file and which component.

Right, for the third step: "So far, we have covered that `isUpdatingAccount` is a local `const` inside a React function component, which React calls again on every re-render, and that its value comes from the Redux store, which is the app's client-side copy of server data."

Right, for the fifth step:

> So far, we have covered these facts:
>
> 1. `isUpdatingAccount` is a local `const` inside a React function component, which React calls again on every re-render.
> 2. Its value comes from a selector, which is a pure function that reads one field out of the Redux store.
> 3. `useAppSelector` subscribes the component to that field, which is the observer pattern: the store notifies the component, and the component re-renders.
> 4. The field is a four-state request lifecycle (`IDLE`, `LOADING`, `SUCCEEDED`, `FAILED`), which is a small finite state machine, and the selector returns `true` only in `LOADING`.
>
> My intention with this step is to show which transition moves that state machine into `LOADING`.

## Similar names: draw the tree before using either

Two identifiers that differ only by a suffix, a plural, or one word, such as `Switcher` and `Switch`, `Item` and `Items`, or `Provider` and `Provide`, cannot be told apart from prose alone. The reader loses which one is the parent, which one owns the data, and which one draws the screen.

- Before the first sentence that uses either name, draw the render tree or call tree in ASCII. Give each node its name, its kind (route component, container, presentational child, hook, reducer), the folder it lives in, and a one-line role.
- After the drawing, refer to each one by role plus name every time, such as "the container `MultiProfileSwitcher`" and "the child `MultiProfileSwitch`", never by name alone.
- When the two names are the same word in two folders, say which folder each use refers to.

Wrong: "`MultiProfileSwitcher` calls a hook and passes the value to `MultiProfileSwitch`, which captures it in state."

That sentence uses both names before the reader has a picture of which contains which.

Right:

```text
<Route path="/multi-profile-switcher">
└── MultiProfileSwitcher      container, folder shared/MultiProfileSwitcher
    │                          loads the account, decides skeleton vs. real list
    └── MultiProfileSwitch    presentational child, folder shared/MultiProfileSwitch
                               draws the tiles and the local toast
```

"The container `MultiProfileSwitcher` reads the URL flag and passes it as a prop to the child `MultiProfileSwitch`, which captures it in state."

## Explain the mechanism that moves control before using its verb

Verbs such as "navigates to", "routes to", "listens to", "dispatches", "emits", and "subscribes" each hide a mechanism. The reader who does not already know the mechanism reads the verb as magic and cannot follow the next step.

- Before the first use of such a verb, write the mechanism as a chain of concrete steps: who calls what, what value changes, who observes that change, and what component or function results.
- For client-side routing, the chain is: a component calls `history.push(url)`, which writes the new URL into the browser's history without a page load; the router subscribed to that history object re-renders; it compares the new pathname against each `<Route path>` in declaration order; the first matching Route renders its child component, and the previous Route's child unmounts.
- For an event bus, the chain is: a module calls `emit(name, payload)`; the bus looks up every function registered under `name`; it calls each with `payload`; those functions were registered by components that called `subscribe` on mount.
- For data that "flows down" in React, the chain is every hop, named: the store field, the selector that reads it, the component that calls the selector, the prop name it passes, the next component, the context object it places the value in, and the hook that reads the context. "Flows down from the container" is not a chain; it is the verb the chain replaces.
- Define "in flight" the first time: a request is in flight when its function has been called and its Promise has neither resolved nor rejected, so the store still holds the values from before the request.
- Do not write "the route renders X" or "the switcher listens to the URL" until the chain exists earlier in the reply.

## Avoid

- Avoid tables. Use prose, lists, or code.
- Avoid analogies. Use precise technical terms, and define them with relative clauses.
- Avoid guessing about real code. Read the file on disk first when it exists.
- Avoid leading with a translation of Go, Swift, or Kotlin. Show the real source first.
- Avoid explaining a `return` before naming the function that called it and the field or consumer that receives its value.
- Avoid answering "what is this input?" by walking later branches.
- Avoid running ahead. Cover what the user asked about, then stop.
