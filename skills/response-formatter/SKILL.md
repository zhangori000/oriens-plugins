---
name: response-formatter
description: "Read this before explanations, teaching replies, and markdown. Loading it also loads baby-steps: every explanation walks one parameter, expression, or helper at a time. Open with a one-sentence intention. Use grammatical sentences. Define a computer science term before using it. Show the real branches in TypeScript. Put the caller that uses a return value before the function that returns it. Do not invent a summary return value."
user-invocable: true
---

# Response formatter

Use this skill when formatting responses or writing markdown.

## Baby-steps always applies

This skill never runs alone. When this skill is active, load and follow the `baby-steps` skill in the same turn, even when the user named only this one. `baby-steps` sets the pace and the order (one parameter, expression, or helper per step; a recap before each step; the real source before any translation; a helper before its caller), and this skill sets the sentence-level rules. When the two disagree about order, `baby-steps` wins. The user should never have to ask for both by name.

Use TypeScript for code samples in explanations. When the file on disk is TypeScript, show that file's actual signature and branches. When the file uses another language, translate the real branches into TypeScript and explicitly say that the block is a translation. Use Python when the file being explained is Python. If `baby-steps` is also active, its instruction to show the real source before a translation takes precedence.

Use runnable examples when they help. Do not add TypeScript to an easy task when code would not improve the explanation. Detailed ASCII diagrams can help explain an actual screen or structure.

## Non-negotiables

Write complete grammatical sentences with subjects and finite verbs. Concision means removing unnecessary clauses, not writing fragments that the reader must decode.

The principles below are an index. Read the full named principle before applying it; do not rely only on its one-line description.

## Principles

**Order**

- **Open with the intention.** Begin a longer reply or document with its purpose. Begin each document section with an intention sentence.
- **Recap before the intention.** From the second step or section on, put a "So far, we have covered" recap of the earlier facts before the intention sentence. The full rule is under `Open with the intention`.
- **Teach the transferable concept.** In any code explanation, name the algorithm, system-design idea, or computer science concept the code instantiates, by its standard name and with one specific source, then map it back onto the code. The `baby-steps` skill has the full rule.
- **Dependency order.** Define a term before making the reader use it to understand another term.
- **Start at the top.** Begin a walkthrough with the high-level behavior, then explain the requested layer.
- **Completeness.** Give every concept already introduced the same explanatory depth.
- **Show a real payload.** Show an actual request or response shape with concrete example values.
- **Look past the ticket's sample.** Investigate relevant existing behavior beyond the examples listed in a task.

**Code**

- **Show the real implementation.** Preserve actual branches, fields, and writes.
- **Show the algorithm.** Show the conditions that produce a decision, not a boolean parameter that hides them.
- **Walk through every code block.** A code block is evidence, not teaching. Right under it, write one short sentence per line or branch with one concrete value. Cut any line you will not walk. The full rule is under `Walk through every code block`.
- **Name the step.** Name a step for what it does before introducing its code identifier.
- **Caller before callee.** Show how a caller uses a return value before showing the function that produces it.
- **Reasoning above the function.** Explain a branch in prose above the code, not in a long inline comment.

**Names**

- **Define the term first.** Explain unfamiliar technical terms, libraries, and identifiers before using them.
- **Name code in this shape.** Say its kind, its name, and what it does, then show code.
- **Show the type you just named.** Show the declaration and a concrete value when introducing a type.
- **Do not coin a stand-in.** Do not replace actual predicates or fields with unexplained shorthand.
- **Unpack the call chain.** Explain each function and each call rather than compressing them into an arrow.

**Prose**

- **Grammatical sentences.** Write sentences rather than captions.
- **Explanation constructs.** Attach explanations to the nouns and actions that they explain.
- **Say what the request does.** Say what a request returns or changes.
- **Write the long phrase.** Keep the real path, field, or screen name when shortening it would lose meaning.
- **No telegram.** Write platform comparisons as complete sentences.
- **No analogy.** Use precise technical terms rather than metaphors.
- **No borrowed slang.** Avoid ambiguous jargon and marketing shorthand.
- **No tables.** Use prose, lists, or code instead of comparison tables.
- **No backticks inside inline code.** Any expression with a backtick or `${}` goes in a fenced block, never in an inline span.
- **No bare repository adjectives.** "Shared", "core", "default", "platform": say which folder, which build, which consumers, the first time.

**Screens**

- **Name the real input.** Identify the outside event or launch arguments the code actually reads.
- **Say if the viewer sees it.** State whether a screen appears.
- **Draw the surface.** Make diagrams resemble the actual screen or structure.

## Open with the intention

For a reply or document longer than a few sentences, open with one sentence that answers: "What should the reader understand or decide after reading this?"

Do not merely announce the topic. "Here is a summary of the request handling" is not an intention. "My intention is to show you which failures cause another request, so that you can decide whether this operation is safe to repeat" gives the reader a purpose.

Under every markdown section heading, begin with a sentence that starts "My intention with this section is to".

By the fifth step or section, the reader has forgotten the first four. The intention sentence looks forward, so from the second step or section on, put a recap before it. The recap starts "So far, we have covered" and names the facts the earlier steps established, such as the construct, the value, and the concept. It does not name the step titles. When three or more steps came before, write the recap as a short numbered list. A reply that continues an earlier walkthrough starts with the same recap. The `baby-steps` skill has the full rule with wrong and right examples.

## Dependency order

Define a thing before its name does explanatory work. Do not introduce several unfamiliar terms in one sentence and explain only one.

For example, first explain that an array holds an ordered collection of values. Then explain that `map` is a method on an array, which calls a function for each element and returns the results in a new array. Do not begin with "Use a higher-order array transformation" and assume the reader knows all three concepts.

## Start at the top

Start a walkthrough with the easiest high-level behavior. Explain one layer at a time and follow the depth requested by the reader.

Leaving the next system for later is reasonable. Leaving a term already introduced half-defined is not.

## Completeness

Before sending, read the draft from the reader's perspective. For every unfamiliar noun, explain what kind of thing it is and what it does. When discussing data flow, also explain who creates the value, where it is stored, and which operation consumes it.

Repeat this check for unfamiliar nouns introduced by the explanation itself. Stop when the remaining words are familiar or when you explicitly state that the relevant code was not examined.

Completeness is horizontal: explain the sibling concepts already named. It is not permission to introduce unrelated systems.

## Show a real payload

When explaining a request or response, show an object with real field names and concrete values. State when values are examples rather than a captured response.

Do not replace the object with a list of field names. Explain which object owns each field and how the code reads or writes it. Do not make unsupported claims about fields or behavior.

## Look past the ticket's sample

A task's examples are the minimum investigation scope, not necessarily the end of it. Read relevant existing calls and neighboring implementations when they can reveal a shared shape, a version difference, or an identifier mismatch.

Explain what those extra calls establish. If they add nothing relevant, say so and stop rather than expanding into unrelated work.

## Show the real implementation

When code exists, show its real signature, branches, fields, and writes. Do not replace it with a fabricated summary result.

For a teaching sketch that is not a production signature, give parameters concrete sample defaults. Do not use `undefined` merely because a type allows it. For a real function, preserve the signature and put example values at the call site.

Explain how the actual caller consumes the actual return value. Do not invent a result such as `{ action: "keep" }` when the implementation writes state and returns nothing.

## Walk through every code block

Any code you show, in any reply, not only in baby-steps.

A code block is evidence, not teaching. The reader can see the characters, but the branch order, the operator meaning, and the concrete values are still in your head. After every block, walk it: one short sentence per line or branch, in execution order, each sentence naming what that line reads, what it compares or calls, and what it returns, with one concrete value. Then say what the result means for the screen or the request. This is not a license for a long reply. A four-line block gets four or five sentences. If you will not walk a line, cut it from the block, or replace it with `// ...`.

Wrong: a function named `resolve` with four `if` lines and trailing comments such as `// 1. the URL named an episode`, followed by a new paragraph that starts "The store saves the result". The comments are labels, not a walk. The reader does not know what `find(episodes, episodeId)` returns when the id is absent, why `seasonId` is checked second, or what `resumeTarget` returns.

Right: the same block, followed by: "The first line asks whether the URL carried an episode id. For the sample, `episodeId` is `"EP-123"`, so `find` returns that episode object and the function returns it with the word `"episodeId"`; nothing below runs. If the URL had carried only a season id, the second line would take the first non-clip episode of that season and return the word `"seasonId"`. With neither, the third line calls `resumeTarget`, which reads each episode's progress and returns the most recently watched episode with `"resume"`, the one after it with `"upNext"`, or the last one with `"completed"`, or `null` when nothing was watched. Only then does the last line fall back to the first non-clip episode with `"seriesFallback"`. The word is what the label hook maps to the button text, so the first line firing is why the button says Start Watching."

## Show the algorithm

Do not hide a predicate inside a boolean parameter. Show the actual conjunctions, comparisons, and early returns that determine the result.

For example, explain which fields are checked and why a comparison is necessary. A function that merely returns a supplied flag does not demonstrate the algorithm.

## Name the step

Name a sequence step for its action before introducing a codebase identifier. "After the password succeeds, remove the saved PIN" gives the reader an action to follow.

A teaching function may use a simpler name when necessary, but its ordering, branches, and operations must remain faithful to the real implementation.

## Caller before callee

When one function returns a value that another function branches on, show the caller first so that the reader sees what each return value causes.

The following example is standalone teaching code, not an excerpt from an application. The `saveIfValid` function returns either `"saved"` or `"rejected"` to its own caller.

```typescript
function saveIfValid(text: string): "saved" | "rejected" {
  const validation = validateText(text);
  if (validation === "empty") return "rejected";
  return "saved";
}

function validateText(text: string): "valid" | "empty" {
  if (text.trim().length === 0) return "empty";
  return "valid";
}

saveIfValid("hello");
```

The example only reports a decision; it does not persist text. Never describe an operation that the shown code does not perform.

## Reasoning above the function

Explain a branch in the paragraph above the function. Keep the function body focused on the actual implementation rather than multiline teaching comments.

## Define the term first

Use precise computer science terminology, but define unfamiliar terms before using them. Libraries, infrastructure names, interfaces, callbacks, headers, query strings, and path parameters all count.

Say what kind of thing an identifier is. Distinguish a function from an object, a method, a library, and a declaration.

If a sentence lists several concepts, give each concept its own definition and a small example before moving to the next. An explanation must not introduce a new layer of unexplained jargon.

## Name code in this shape

Use this sequence: the kind of code, its name, what it does, then a concrete example.

For example: "`trim` is a method on a string. It returns a string with whitespace removed from the beginning and end."

Do not place `Object.method` in parentheses as though the reader already understands the object, method, and result.

## Show the type you just named

When introducing an interface or type alias, show its declaration and one concrete value. If the value comes from a response, show the relevant response object too.

Explain which original field supplies each resulting field. Do not substitute a phrase such as "the list field" for the actual key and the object that contains it.

## Do not coin a stand-in

Do not invent labels such as "the tile rule" to replace a predicate, a key, or several fields. Show the actual condition or fields when they matter.

Do not open a discussion of every field that a type leaves out. Stay with the object and behavior being explained.

## Unpack the call chain

If a function calls a second function, which calls a third, explain all three. For each, say what kind of code it is and what it does.

Do not replace those explanations with `A -> B -> C`. Show the relevant calls after the prose when code helps.

## Grammatical sentences

Every sentence needs a subject and a finite verb. "Still in the editor" is a fragment; "The user is still in the editor" is a sentence.

Do not use pithy fragments or compact labels that force the reader to reconstruct the meaning.

## Explanation constructs

Attach an explanation to the word or action it explains:

- A relative clause begins with "which", "that", "who", or "where" and describes the preceding noun: "A Promise is an object, which represents a value that may become available later."
- An appositive renames a noun: "`map`, a method on arrays, returns a new array."
- A participial phrase describes a noun: "The loop, having used its last attempt, returns the failure."
- A sentential relative clause explains a whole statement: "The loop stops early, which means that later elements are not visited."
- A cause clause uses "because" or "since" to explain why an action occurs.
- A condition clause uses "if", "unless", or "only if" to explain when an action occurs.
- A time clause uses "when", "before", "after", "until", or "while" to explain ordering.
- A contrast clause uses "although", "whereas", or "while" to distinguish behaviors.
- A purpose phrase uses "so that" or "in order to" to explain the goal.
- A means phrase uses "by" plus a verb ending in "-ing" to explain the mechanism.
- A result clause uses "so" or "which means" to explain the consequence.

Choose prepositions precisely. "By" states the means; "for" states the purpose; "with" and "without" state what accompanies an action; "from" and "into" describe a transformation; "per" states a unit; "on" identifies a trigger.

Use "that is" or "in other words" to restate an explanation. Use "for example" or "such as" to introduce a concrete instance.

## Say what the request does

Say what a request returns or changes. Do not stack nouns onto its verb.

Write "This request returns the saved documents", not "This is the saved-document list GET".

## Write the long phrase

Do not shorten a name, path, JSON structure, or screen description if doing so removes context. A slightly longer explanation is preferable to one that requires the reader to ask what it means.

## No telegram

For platform comparisons, write who performs the action, which screen is involved, and which request supplies the data. Preserve the order when one request depends on another.

## No analogy

Do not use metaphors or cute nicknames for technical behavior. Use precise terms and explain them.

## No borrowed slang

Avoid language-idiom verbs such as "unwrap" or "flatten" unless the next words explain exactly what happens to the values.

Do not use "copy" to mean words on a screen. Write "The screen says..." or "The heading is...". Avoid reusing words with established interface or language meanings as unexplained shorthand.

## No tables

Use prose, lists, or TypeScript instead of tables. Comparisons need complete sentences that preserve who does what and why.

When two implementations differ, show each implementation's relevant behavior and explain the difference in prose.

## No backticks inside inline code

A template literal, a tagged template, or any expression that contains a backtick cannot go inside a single-backtick inline code span. The inner backtick closes the span early, and the rest of the paragraph renders as broken code.

- Put any expression containing a backtick or a `${}` placeholder in a fenced code block.
- In prose, describe the expression in words or show its evaluated value instead.

Wrong: The expression `playheadSecs !== null && \`playheadSecs=${playheadSecs}\`` uses the `&&` operator.

Right: The third element is built by this expression, which uses the `&&` operator:

```ts
playheadSecs !== null && `playheadSecs=${playheadSecs}`
```

For the input `'120'`, it evaluates to the string `'playheadSecs=120'`.

## No bare repository adjectives

Words such as "shared", "core", "default", "platform", "legacy", and "common" are folder names or team shorthand, not descriptions. A reader outside the team reads "the shared parser" as "a parser that is somehow shared" and learns nothing.

- The first time such a word modifies a noun, say what it means concretely: which folder, which build, which consumers. "The parser in `shared/Utils` is compiled into every platform's bundle, so Tizen, webOS, Xbox and PS5 all run the same copy. Editing it risks all four."
- After that definition, prefer the concrete phrase ("the parser every platform runs") over the bare adjective.

## Name the real input

For a deep link or outside event, name the launch arguments or event fields that the code actually reads. Do not invent a delivery channel or application.

## Say if the viewer sees it

When a screen is skipped, explicitly say that the user does not see it. When it appears, say so next to the diagram.

## Draw the surface

When a diagram helps explain a screen or tree, draw a detailed ASCII representation that resembles the actual surface or structure. Avoid a one-line abstraction that omits the relevant behavior.
