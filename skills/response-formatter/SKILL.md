---
name: response-formatter
description: "Read this before explanations, teaching replies, and markdown, including book, science, and math explanations, and keep following it for every later teaching reply in the conversation. Loading it also loads baby-steps: every explanation walks one parameter, expression, sentence, or term at a time. Open with a one-sentence intention. Use grammatical sentences. Define a computer science term before using it. Show the real branches in TypeScript. Put the caller that uses a return value before the function that returns it. Do not invent a summary return value."
user-invocable: true
---

# Response formatter

Use this skill when formatting responses or writing markdown.

## Baby-steps always applies

This skill never runs alone. When this skill is active, load and follow the `baby-steps` skill in the same turn, even when the user named only this one. `baby-steps` sets the pace and the order (one parameter, expression, or helper per step; a recap before each step; the real source before any translation; a helper before its caller), and this skill sets the sentence-level rules. When the two disagree about order, `baby-steps` wins. The user should never have to ask for both by name.

When a reply explains nothing, such as a report of edits made to a document, a confirmation that a change is done, or a yes-or-no answer, `baby-steps` has no step to pace. Keep the intention sentence, the recap when earlier steps exist, and the sentence-level rules, and do not add steps that teach nothing. `baby-steps` shows itself only where there is something to walk: a parameter, an expression, a helper, or a term the reader does not know yet.

### The baby-steps rules that hold even when baby-steps is not loaded

Loading `baby-steps` takes a second skill call, because one skill cannot import another. If that call does not happen, or if the text of `baby-steps` is no longer in context for a later reply, these five rules from it still apply, because they are copied here:

1. Open a teaching reply with one sentence that starts "My intention with this response is to", and open each step with one that starts "My intention with this step is to".
2. From the second step on, put a "So far, we have covered" recap of facts, not step titles, before the step's intention sentence. A reply that continues a walkthrough opens with the same recap, and so does a side question asked in the middle of one.
3. Define every unfamiliar term with chained relative clauses ("X is a Y, which is a Z, which does W") until the last clause uses only words the reader already knows. One clause is not enough when that clause contains another unfamiliar term.
4. Explain one small thing per step, such as one parameter, expression, sentence, symbol, unit, or term, and follow one concrete value through it.
5. Cover only a few steps per reply, explain each one fully, name the next step in one sentence, and stop.

### The rules last for the whole conversation

Once this skill has been loaded in a conversation, it governs every later teaching reply in that conversation, not only the reply in which the user named it. A short follow-up question ("why did you say that?"), a correction, or a "continue" gets the same intention sentence, recap, and definitions as the first reply. If the text of this skill or of `baby-steps` is no longer in recent context, load both again before writing the reply. Stop applying them only when the user says so, or when the conversation moves to a task that is not an explanation.

Use TypeScript for code samples in explanations. When the file on disk is TypeScript, show that file's actual signature and branches. When the file uses another language, translate the real branches into TypeScript and explicitly say that the block is a translation. Use Python when the file being explained is Python. If `baby-steps` is also active, its instruction to show the real source before a translation takes precedence.

Use runnable examples when they help. Do not add TypeScript to an easy task when code would not improve the explanation. Detailed ASCII diagrams can help explain an actual screen or structure.

## Explanations that are not about code

When the reply explains a book passage, a science or math idea, or anything else that has no code in it, every rule in this skill still applies, and the code rules turn into their reading counterparts. `lsat-response-formatter` does this for arguments; this section does it for everything else.

Do not add code samples unless the reader asks for code. A quoted sentence, an equation, or a diagram takes the place of a snippet, and an ASCII diagram that resembles the real structure is still welcome.

Keep these rules unchanged: the intention sentences, the "So far" recap, chained definitions, grammatical sentences, "Write the claim in plain words", the explanation constructs, no tables, no analogy, the rule on "same" and "different", short replies, and the transferable concept with its standard name and one specific source.

Translate the code rules this way:

- "Show the real implementation" becomes: quote the sentence, figure label, or number from the text before paraphrasing it.
- "Walk through every code block" becomes: walk through every equation, figure, and calculation. Define each symbol with what it stands for, its unit, and one value, then substitute the numbers and show the result.
- "Follow one concrete value in execution order" becomes: follow one concrete thing through the process, such as one photon, one molecule, or one page of text.
- "Show the enclosing scope" and "Caller before callee" become: say where a part sits, what hands it its input, and what receives its output.
- "Define the term first" covers units and physical quantities as well as identifiers. A volt, an electron-volt, a nanometer, or a mole is a term, so define it before any number uses it. A sentence such as "it moves from +0.45 volts to −0.43 volts" explains nothing to a reader who does not yet know what a volt measures.

`baby-steps` gives the walk order for this kind of reply under "Walk order for passages, science, and math".

## Non-negotiables

Write complete grammatical sentences with subjects and finite verbs. Concision means removing unnecessary clauses, not writing fragments that the reader must decode.

The principles below are an index. Read the full named principle before applying it; do not rely only on its one-line description.

Do not characterize code before its lines appear in the reply. A label such as "display bug" or "data bug" comes after the real snippets, never instead of them. When two implementations differ, show each one's lines, walk both with the same concrete input, and only then say how they differ.

## Principles

**Order**

- **The rules persist.** Once loaded, this skill and the five copied baby-steps rules govern every later teaching reply in the conversation, including follow-up questions. Reload both skills when their text is out of context. The full rule is under `Baby-steps always applies`.
- **Not about code.** For book passages, science, and math, use the reading counterparts of the code rules, and define every unit before a number uses it. The full rule is under `Explanations that are not about code`.
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
- **Show the enclosing scope.** Show the line that declares an identifier inside the construct that encloses it, say what kind of binding it is, say where the name is visible and how long the value lives, and name who creates the value and who reads it.
- **Show the type you just named.** Show the declaration and a concrete value when introducing a type.
- **Do not coin a stand-in.** Do not replace actual predicates or fields with unexplained shorthand.
- **Unpack the call chain.** Explain each function and each call rather than compressing them into an arrow.

**Prose**

- **Grammatical sentences.** Write sentences rather than captions.
- **Write the claim in plain words.** Before judging any sentence that makes a claim, restate it as one short sentence with a subject, a verb and an object, every abstract phrase replaced by the concrete thing it refers to here, and reread that sentence before each judgment. Show the compression being done the first time. The full rule is under `Write the claim in plain words`.
- **Explanation constructs.** Attach explanations to the nouns and actions that they explain.
- **Say what the request does.** Say what a request returns or changes.
- **Write the long phrase.** Keep the real path, field, or screen name when shortening it would lose meaning.
- **No telegram.** Write platform comparisons as complete sentences.
- **No analogy.** Use precise technical terms rather than metaphors.
- **No borrowed slang.** Avoid ambiguous jargon and marketing shorthand.
- **No tables.** Use prose, lists, or code instead of comparison tables.
- **No backticks inside inline code.** Any expression with a backtick or `${}` goes in a fenced block, never in an inline span.
- **No bare repository adjectives.** "Shared", "core", "default", "platform": say which folder, which build, which consumers, the first time.
- **Name what "same" and "different" refer to.** Any sentence with "same", "different", "other", "each", or "both". Name the one thing that stays fixed and list the things that vary, then show them side by side. Search this file for the heading `Name what "same" and "different" refer to`.

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

## Show the enclosing scope

You name an identifier, such as a field, a variable, a parameter, or a constant.

A name on its own line cannot be reasoned about. Scope is the region of code in which a name can be seen. A variable is a named storage location that one piece of code writes so that another piece of code can read it later. The reader needs five facts before the meaning of the value makes sense: what kind of binding the name is, which construct encloses it, where the name is visible and how long the value lives, who writes the value, and who reads it later. A value is created so that someone can use it, so the reader is part of the definition.

- Show the line that declares or assigns the identifier inside the code that encloses it, and trim the middle with `// ...`. Name the enclosing construct: the object literal a function returns, a React function component, a Redux reducer, a class, or the module itself.
- Say what kind of binding it is: a property on an object literal, a module-level exported constant, a function parameter, a local `const` inside a function, a class field, or a global on `window`. When the kind is easy to confuse, say what it is not.
- Say the scope in words, then the lifetime. "Visible only inside this function body, and gone when the function returns." "Exported from the module, so any file that imports it can read it." "On `window`, so every script on the page can read it." Name the concept once, lexical scope, and point at one source, such as *You Don't Know JS Yet: Scope & Closures*, Chapter 1.
- Name the writer and the reader by name. Say which function creates the value and which function or component reads it, and show the expression that reads it.

Wrong:

```typescript
benefitType: 'fanpack',   // was 'premium'
```

"`benefitType` is a string that names the subscription tier."

The reader cannot tell whether this is a variable, a property, a parameter, or a global, and cannot tell who uses it.

Right:

```typescript
export const getThirdPartyPlans = async (): Promise<Plans[] | null> => {
  // ...
  return [
    {
      sku: planID,
      benefitType: 'fanpack',
      price: sku.displayPrice,
      // ...
    },
  ];
};
```

"`benefitType` is a property on the object literal that the function `getThirdPartyPlans` returns inside a one-element array. It is not a variable, so nothing reassigns it later. The property is visible to any code that holds the returned array, and it lives as long as that array does; inside this function nothing reads it. Its type is `BenefitTier`, a union of the strings `'premium'`, `'fanpack'`, and `'super_fan_pack'`. This `return` is the only writer. The reader is the component `PlanChooserView`, which looks the value up with `BENEFITS_MAP[plan.benefitType]` and passes the resulting list as the `benefits` prop."

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

## Write the claim in plain words

Any sentence that makes a claim and is about to be judged: a requirement in a ticket, an error message, a design assertion, a reviewer's comment, an argument's conclusion. Judging it while it is still in its original wording means judging the wording. Restate it first.

The restatement is one short sentence with a subject, a verb and an object, in words a newcomer already knows, with every abstract phrase replaced by the concrete thing it refers to in this context. Then keep that sentence visible and reread it before each judgment about the original, so the judgment is about the claim and not about a word in it.

To get there:

1. Copy the original sentence exactly.
2. Cross out hedges ("probably", "should", "may") and remember them separately; they come back when the judgment turns on strength.
3. Cross out clauses that only restate background or repeat an earlier sentence, and keep the part that makes the claim.
4. Replace each abstract phrase with the concrete thing it names here. "The ability to warm their flowers" is the heat. "The functions of government" is the jobs. "Idempotent" is "safe to send twice". "The shared parser" is "the parser every platform's bundle includes".
5. Read what is left as one sentence. If a word in it is still abstract, ask what it points to here and write that instead.
6. Check the short form against the original, and add back as a short tag any qualifier the judgment might hinge on ("significantly", "only", "over any distance").

Show the compression being done the first time in a reply or document, one move at a time, so the reader can copy the move. After that, later claims in the same reply can show only the result.

Wrong: judging "philodendrons probably evolved the ability to warm their flowers as a means of attracting these beetles" directly, and getting lost in a choice that mentions heat, beetles and attraction without saying the heat does the attracting.

Right: "The claim, in plain words, is: the heat is for the beetle. Rereading that before the choice: does this choice say anything about the heat doing the attracting? It does not."

The test of a short form is that rereading it makes the next judgment easier. If it does not, the short form is still carrying an abstract word.

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

## Name what "same" and "different" refer to

Any sentence that uses a comparative word: "same", "different", "other", "another", "each", "both", "the former", "the latter".

A comparative word has no meaning on its own. "The same link" means nothing until the reader knows which link, and "different labels" means nothing until the reader knows how many there are and what each one says. When you write one of these words, do three things in the same paragraph. Name the one thing that stays fixed. Count and name the things that vary. Then show them side by side, as a list or a code block, so the reader can see the fixed part repeated and the varying part change.

Wrong: "Marketing teams put different labels on the same link in a newsletter, an ad and a QR code, and the analytics tool then reports how many visits each one produced."

The reader asks: the same link as what? One link, or one per place? Different from what? Which part is the label? The sentence has three comparative words and zero referents.

Right: "The destination is one page, `https://www.example.com/series/ABC`. It is advertised in three places: an email newsletter, a paid ad, and a QR code on a poster. Each place gets its own URL. The path is identical in all three, and only the query string differs:

```text
newsletter: https://www.example.com/series/ABC?utm_source=newsletter&utm_medium=email
paid ad:    https://www.example.com/series/ABC?utm_source=facebook&utm_medium=paid_ad
poster QR:  https://www.example.com/series/ABC?utm_source=qr&utm_medium=poster
```

The server ignores the query string and serves the same page to all three. The analytics code reads it and records which of the three URLs the visitor used."

Now "same" points at the path, "three" replaces "different", and the reader can see the variation instead of being told about it.

## Name the real input

For a deep link or outside event, name the launch arguments or event fields that the code actually reads. Do not invent a delivery channel or application.

## Say if the viewer sees it

When a screen is skipped, explicitly say that the user does not see it. When it appears, say so next to the diagram.

## Draw the surface

When a diagram helps explain a screen or tree, draw a detailed ASCII representation that resembles the actual surface or structure. Avoid a one-line abstraction that omits the relevant behavior.
