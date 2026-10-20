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

Use runnable examples when they help. Do not add TypeScript to an easy task when code would not improve the explanation. Do not draw an ASCII diagram unless the reader asked for one; the full rule is under `Diagrams only on request`.

## Explanations that are not about code

When the reply explains a book passage, a science or math idea, or anything else that has no code in it, every rule in this skill still applies, and the code rules turn into their reading counterparts. `lsat-response-formatter` does this for arguments; this section does it for everything else.

Do not add code samples unless the reader asks for code. A quoted sentence or an equation takes the place of a snippet. An ASCII diagram that resembles the real structure is drawn only when the reader asks for a diagram; the full rule is under `Diagrams only on request`.

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
- **Keep one map.** When a walkthrough names more than about four parts, open each reply with one glossary paragraph per part named so far, in reading order, each naming the part, its kind, its repository, and the real call that connects it to the next part. Draw the ASCII map only when the reader has asked for a diagram; otherwise end the reply with one sentence saying the map is available. Redo the glossary with each new part marked. The full rule is under `Keep one map`.
- **Diagrams only on request.** Never draw an ASCII diagram unless the reader asked for one in this conversation. Where a rule here would have drawn one, write its prose form, and end the reply with one sentence saying that an ASCII diagram is available. The full rule is under `Diagrams only on request`.
- **Completeness.** Give every concept already introduced the same explanatory depth.
- **Show a real payload.** Show an actual request or response shape with concrete example values.
- **Look past the ticket's sample.** Investigate relevant existing behavior beyond the examples listed in a task.

**Code**

- **Show the real implementation.** Preserve actual branches, fields, and writes.
- **Show the algorithm.** Show the conditions that produce a decision, not a boolean parameter that hides them.
- **Walk through every code block.** A code block is evidence, not teaching. Right under it, write one short sentence per line or branch with one concrete value. A one-line block and a function's signature line count. Define every keyword and operator a line uses. Cut any line you will not walk, and show fewer blocks rather than walk them thinly. Never follow a code block or a diagram with a list or with inline markers; walk it in plain sentences. The full rule is under `Walk through every code block`.
- **Name the step.** Name a step for what it does before introducing its code identifier.
- **Caller before callee.** Show how a caller uses a return value before showing the function that produces it.
- **Reasoning above the function.** Explain a branch in prose above the code, not in a long inline comment.

**Names**

- **Define the term first.** Explain unfamiliar technical terms, libraries, and identifiers before using them. When the reader says a defined term still confuses them, rebuild it from the code instead of rewording it.
- **Headings are words too.** A heading may use only terms defined above it. Write it as a plain statement that names the real parts and the real call. The full rule is under `Headings are words too`.
- **Name code in this shape.** Say its kind, its name, and what it does, then show code.
- **Show the enclosing scope.** Show the line that declares an identifier inside the construct that encloses it, say what kind of binding it is, say where the name is visible and how long the value lives, and name who creates the value and who reads it.
- **Show the whole function, never a bare body.** Every snippet keeps its function's signature line, its nesting, and its closing brace. Replace skipped lines with a `// ...` comment that says what was skipped and why it is irrelevant here. When several functions call each other, show the caller first with the call line visible. The full rule is under `Show the enclosing scope`.
- **Resolve `this`.** Every snippet with `this` names the class whose method encloses the line and the one object `this` is at run time. Every `this._field` gets its declaration and the line that assigns it. The full rule is under `Resolve this and every field it reaches`.
- **Show the type you just named.** Show the declaration and a concrete value when introducing a type.
- **Do not coin a stand-in.** Do not replace actual predicates or fields with unexplained shorthand.
- **Call a value by its code name.** Refer to a value by its identifier every time (`upNextContent`), never by a nickname such as "the row", even one defined earlier. Words with a data-structure meaning (row, column, table, record, node, tree, list, bag, slot, tier) are reserved for that meaning. Translate nicknames from tickets, teammates, and research before writing. The full rule is under `Call a value by its code name`.
- **Name new things for what they describe.** A name you propose (a type, field, function, or enum value) says which thing it describes and what it means, in plain words: `viewerFinishedPickedEpisode`, not `fullyWatched`. When an existing field is ambiguous, such as an API's `fully_watched`, say which thing it describes (this episode, this season, or the whole series) every time it appears. The full rule is under `Name new things for what they describe`.
- **Unpack the call chain.** Explain each function and each call rather than compressing them into an arrow.

**Prose**

- **Grammatical sentences.** Write sentences rather than captions.
- **Write the claim in plain words.** Before judging any sentence that makes a claim, restate it as one short sentence with a subject, a verb and an object, every abstract phrase replaced by the concrete thing it refers to here, and reread that sentence before each judgment. Show the compression being done the first time. The full rule is under `Write the claim in plain words`.
- **Explanation constructs.** Attach explanations to the nouns and actions that they explain.
- **Say what the request does.** Say what a request returns or changes.
- **Write the long phrase.** Keep the real path, field, or screen name when shortening it would lose meaning.
- **No telegram.** Write platform comparisons as complete sentences.
- **No analogy.** Use precise technical terms rather than metaphors.
- **Say the operation, not the workplace word.** Replace "hand-off", "wire up", "lives in", "talks to", and "owns" with the real call or declaration. Split "owns" into who declares the interface, who writes the implementation, and who constructs the object. The full rule is under `Say the operation, not the workplace word`.
- **No borrowed slang.** Avoid ambiguous jargon and marketing shorthand.
- **No tables.** Use prose, sentences with inline markers, or code instead of comparison tables.
- **Inline markers, not bullets.** Enumerate inside full sentences with (1), (2), (3) for order or (a), (b), (c) for parallel items, instead of bulleted or numbered lists, so each item stays an explained sentence rather than a caption. Never directly under a code block or diagram, and never pointed back to. The full rule is under `Inline markers, not bullets`.
- **No backticks inside inline code.** Any expression with a backtick or `${}` goes in a fenced block, never in an inline span.
- **No bare repository adjectives.** "Shared", "core", "default", "platform": say which folder, which build, which consumers, the first time.
- **No pointers to labels.** Never make the reader look up a number, letter, or symbol defined somewhere else, such as "at ③", "step 2", "block A", or "fact 3 above". Write the call, object, or fact itself. The full rule is under `No pointers to labels`.
- **Name what "same" and "different" refer to.** Any sentence with "same", "different", "other", "each", or "both". Name the one thing that stays fixed and list the things that vary, then show them side by side. Search this file for the heading `Name what "same" and "different" refer to`.

**Screens**

- **Name the real input.** Identify the outside event or launch arguments the code actually reads.
- **Say if the viewer sees it.** State whether a screen appears.
- **Draw the surface.** When the reader has asked for a diagram of a screen or tree, make it resemble the actual screen or structure; without that request, describe the surface in prose.

## Open with the intention

For a reply or document longer than a few sentences, open with one sentence that answers: "What should the reader understand or decide after reading this?"

Do not merely announce the topic. "Here is a summary of the request handling" is not an intention. "My intention is to show you which failures cause another request, so that you can decide whether this operation is safe to repeat" gives the reader a purpose.

Under every markdown section heading, begin with a sentence that starts "My intention with this section is to".

By the fifth step or section, the reader has forgotten the first four. The intention sentence looks forward, so from the second step or section on, put a recap before it. The recap starts "So far, we have covered" and names the facts the earlier steps established, such as the construct, the value, and the concept. It does not name the step titles. When three or more steps came before, write the recap as one paragraph with inline markers, (1), (2), (3), one full sentence per earlier step. A reply that continues an earlier walkthrough starts with the same recap. The `baby-steps` skill has the full rule with wrong and right examples.

## Dependency order

Define a thing before its name does explanatory work. Do not introduce several unfamiliar terms in one sentence and explain only one.

For example, first explain that an array holds an ordered collection of values. Then explain that `map` is a method on an array, which calls a function for each element and returns the results in a new array. Do not begin with "Use a higher-order array transformation" and assume the reader knows all three concepts.

## Start at the top

Start a walkthrough with the easiest high-level behavior. Explain one layer at a time and follow the depth requested by the reader.

Leaving the next system for later is reasonable. Leaving a term already introduced half-defined is not.

## Keep one map

Any walkthrough that names more than about four parts, such as packages, classes, objects, or services, in one reply or across several.

Facts given one per paragraph do not add up to a picture. By the third reply the reader holds a definition of each part and still cannot say how the parts connect, which they will describe as "scattered". Give the reader one place to look. By default that place is a glossary in prose, because a diagram takes a large share of the reply; the diagram is drawn only when the reader asks for one, as `Diagrams only on request` says.

- Right after the intention sentence and the recap, give the glossary: one plain paragraph per part named so far, in the order a reader would meet them, with no bullets and no markers. Each paragraph starts with the part's name and says what kind of thing it is (an npm package, a class, an interface, an object built at run time), which repository its code is in, what it does, and the real call that connects it to the next part, such as `new HeartbeatPluginCreator(...)` or `creator.create(events, callbacks)`. Never describe a connection with a verb such as "hands off to" or "talks to".
- When the reader has asked for a diagram, draw one ASCII diagram above the glossary that puts every part in a single picture. Each box gives the part's name, its kind, and its repository. Label each arrow with the real call that connects two boxes, never with a verb.
- In each later reply of the same walkthrough, give the glossary again with the new part added and marked `(new)`, so that the reader sees where it attaches, and redraw the map the same way when one was asked for. Do not point back at an earlier reply's glossary or map.
- Each step after the glossary explains one part or one connection in it, and says which one by repeating the part's name or the call, never by a number. Do not number the arrows or boxes of a map; see `No pointers to labels`.
- When no diagram was asked for, end the reply with one sentence that says an ASCII diagram of these parts is available on request.

## Diagrams only on request

Any reply in which a rule of this skill or of `baby-steps` would draw an ASCII diagram: the map from `Keep one map`, the render tree or call tree for similar names, the surface from `Draw the surface`, or a figure in a passage, science, or math explanation.

A diagram takes a large share of the reply and pushes the walk below the fold. The reader who wants one can ask for it, and the reader who did not ask should not pay for it.

- Draw an ASCII diagram only when the reader has asked for one in this conversation, with words such as "diagram", "draw", "map", "tree", "picture", or "show me the structure". A request holds for the rest of that walkthrough, so later replies of the same walkthrough redraw without being asked again. A new topic needs a new request.
- Where a rule would have drawn a diagram, write its prose form instead: the glossary of `Keep one map`, a paragraph that says which part contains which for similar names, or a description of the screen for `Draw the surface`.
- End such a reply with one sentence, and only one, that says an ASCII diagram is available on request, such as "An ASCII diagram of these parts is available if you ask for one." Put it after the sentence that names the next step. Do not repeat the offer in a reply that drew a diagram, and do not offer one when no rule would have drawn one.
- When a diagram is drawn, every existing rule about diagrams still applies: real calls on the arrows, no numbered boxes, no list or markers directly under it, and a walk in plain sentences.

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

Write the walk as plain sentences in paragraphs. Never write it as a bulleted list, a numbered list, or a paragraph of inline markers. Numbers or markers under a block read as a second set of labels next to the code's own lines and invite a later "see 3" pointer, and bullets shrink each line's walk to a caption. The same holds under a diagram.

Wrong: a function named `resolve` with four `if` lines and trailing comments such as `// 1. the URL named an episode`, followed by a new paragraph that starts "The store saves the result". The comments are labels, not a walk. The reader does not know what `find(episodes, episodeId)` returns when the id is absent, why `seasonId` is checked second, or what `resumeTarget` returns.

Right: the same block, followed by: "The first line asks whether the URL carried an episode id. For the sample, `episodeId` is `"EP-123"`, so `find` returns that episode object and the function returns it with the word `"episodeId"`; nothing below runs. If the URL had carried only a season id, the second line would take the first non-clip episode of that season and return the word `"seasonId"`. With neither, the third line calls `resumeTarget`, which reads each episode's progress and returns the most recently watched episode with `"resume"`, the one after it with `"upNext"`, or the last one with `"completed"`, or `null` when nothing was watched. Only then does the last line fall back to the first non-clip episode with `"seriesFallback"`. The word is what the label hook maps to the button text, so the first line firing is why the button says Start Watching."

Every block means every block:

- A one-line block is a block. A call shown on its own, such as `this._eventBus.emit(PlayerEventType.USER_INTERACTION, data);`, gets its own walk: which object receives the call, what each argument holds, and what the call returns. A sentence such as "That calls the event bus's `emit` method", which only introduces the next block, does not walk this one.
- A function's signature line is a line. Walk its parameters and its type parameters before the body.
- A line is walked only when every name, keyword, and operator in it has been defined. Examples are `this`, a type parameter such as `<K extends keyof EventMap>`, the spread `...`, an arrow function `(event) => { ... }`, `switch` with `case` and `break`, `?.`, and `??`. Define each one in the walk sentence for the line where it first appears in the conversation.
- Sentences grouped under a label, such as "The disposed check", are a walk only if they still say what each of its lines reads, calls, and returns. A label followed by a paraphrase of the outcome is not a walk.
- When walking every block fully would make the reply too long, show fewer blocks and name the next one in a sentence. Never keep the blocks and thin the walks.

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

When the reader says a term still confuses them after it was defined, for example "every time I hear 'facade' I am still confused", the definition did not work. Do not repeat it in other words. Rebuild it from what that part does in the code at hand: show the real lines that create it and use it, place it in the glossary from `Keep one map` (or on the map, when the reader asked for one), and say what the caller would have to do without it.

## Headings are words too

A heading is read before the paragraph that defines its words, and a reader who skims reads only the headings. So a heading may use only terms that are defined above it or that the reader already knew. The undefined-term rules apply to headings exactly as they apply to sentences.

Write a heading as a plain statement of what the section shows, naming the real parts and the real call.

Wrong: "Step 3: the hand-off happens in two stages, and the plugin gets five things". "Hand-off" was never defined, and "five things" names nothing.

Right: "Step 3: the facade calls `new HeartbeatPluginCreator(...)`, and later player-core calls `create(...)` on that object". This works only once the facade and player-core have been defined above it.

## Name code in this shape

Use this sequence: the kind of code, its name, what it does, then a concrete example.

For example: "`trim` is a method on a string. It returns a string with whitespace removed from the beginning and end."

Do not place `Object.method` in parentheses as though the reader already understands the object, method, and result.

## Show the enclosing scope

You name an identifier, such as a field, a variable, a parameter, or a constant.

A name on its own line cannot be reasoned about. Scope is the region of code in which a name can be seen. A variable is a named storage location that one piece of code writes so that another piece of code can read it later. The reader needs five facts before the meaning of the value makes sense: what kind of binding the name is, which construct encloses it, where the name is visible and how long the value lives, who writes the value, and who reads it later. A value is created so that someone can use it, so the reader is part of the definition.

- Show the line that declares or assigns the identifier inside the code that encloses it, and trim the middle with `// ...`. Name the enclosing construct: the object literal a function returns, a React function component, a Redux reducer, a class, or the module itself.
- Never show a function body without its function. A block of `if` statements cut out of a function leaves the reader unable to tell which function they are in, what its parameters are, what is nested inside what, and who called it. Keep the signature line, every enclosing block's opening line, and the closing braces. Replace each skipped region with a comment that says what it does and why it does not matter here, such as `// ... (builds the season, episode and movie cases; not used by these two inputs)`. When the value travels through several functions, show them caller first, each one whole in this trimmed form, with the line that calls the next function left visible.
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

## Resolve this and every field it reaches

Any code that contains `this`, such as `this._eventBus.emit(...)`, `this.dispose()`, or `this._apiServicesContainer = ...`.

`this` is a keyword, not a name declared in the block, so the reader cannot find it by reading the snippet. Inside a constructor or method of a class, `this` is the one object of that class whose constructor or method is running right now. Inside an arrow function, `this` is whatever `this` was in the code around the arrow function. Each class's `this` is a different object, so `this` in `PlayerOrchestrator` and `this` in `PlayerEventBus` are two different objects even when they appear on consecutive lines of a reply.

- The first time `this` appears in a conversation, define it with the real class. Show the class declaration line and the enclosing method's signature, trimmed with `// ...`, and say which object `this` is at run time and which code created that object, such as "the one `PlayerEventBus` object that `KatamariPlayer`'s constructor created with `new PlayerEventBus()`". Name the concept once with one source, such as *You Don't Know JS Yet: Objects & Classes*, Chapter 4, "This Works".
- In every later snippet, the walk sentence for a line with `this` names that line's class again.
- For each `this._field` a line reads, apply `Show the enclosing scope`: show the field declaration inside the class and the line that assigns it, which is usually in the constructor, and give the value it holds in the example.
- For each `this.method()` call, say which method of which class runs and what it returns.

Wrong: "`if (this._isDisposed) return;` If the bus has been shut down, `emit` does nothing." The reader does not know what `this` is, where `_isDisposed` is declared, or what sets it.

Right: "This line is inside the method `emit` of the class `PlayerEventBus`, so `this` is the one `PlayerEventBus` object that `KatamariPlayer`'s constructor created with `new PlayerEventBus()`. `_isDisposed` is a private field of that class, declared as `private _isDisposed: boolean = false;`, so it is `false` on every new bus, and only the bus's own `dispose` method sets it to `true`. While the video plays, the condition is `false`, so `return` does not run."

## Show the type you just named

When introducing an interface or type alias, show its declaration and one concrete value. If the value comes from a response, show the relevant response object too.

Explain which original field supplies each resulting field. Do not substitute a phrase such as "the list field" for the actual key and the object that contains it.

## Do not coin a stand-in

Do not invent labels such as "the tile rule" to replace a predicate, a key, or several fields. Show the actual condition or fields when they matter.

Do not open a discussion of every field that a type leaves out. Stay with the object and behavior being explained.

## Call a value by its code name

Any value, object, or response that the code gives a name: a variable, a field, a parameter, a type, or one entry of a response body.

A nickname for a value is a second vocabulary the reader has to keep in their head next to the code's. Defining the nickname once does not fix that. By the next paragraph the reader has forgotten the definition, and if the nickname is a word that already means something in computer science, the old meaning wins. A reply once defined "the up-next row" as the object the up-next request returns, then three paragraphs later wrote "the thunk already holds the row as `upNextContent`". The reader pictured a horizontal line of a table, could not connect it to an API response, and stopped reading.

- Use the code's identifier every time the value appears, such as `upNextContent`. The first time in each section, attach what it is and where it comes from in a relative clause: "`upNextContent`, a field of the Redux series state whose value is the first entry of the up-next response".
- Never shorten an identifier to a common noun. Do not call a value "the row", "the record", "the node", "the bag", "the payload", "the answer", or "the blob" unless the code itself uses that word for that value. Words with an established data-structure meaning, such as row, column, table, record, tuple, node, tree, list, stream, queue, bag, set, map, slot, and tier, are reserved for that meaning.
- Translate before you write. When a ticket, a teammate, or a research agent uses a nickname, replace it with the identifier. Mention the nickname only if the reader will meet it elsewhere, and then say once "the ticket calls this the row".
- When one value passes through several names, name each one where it appears and show the line that copies one into the next. For example, the response's `data.data[0]` becomes the state field `upNextContent`, and the thunk then copies that field into its own local `const upNextContent`.
- Do not say a function "holds", "has", or "carries" a value. Say which line reads the value, and from which object.

Wrong: "The series thunk, `fetchContentVideosMetadata`, already holds the row as `upNextContent`, so it would just pass it along."

Right: "`fetchContentVideosMetadata` reads `upNextContent` from the Redux store with `const upNextContent = selectSeries(getState()).upNextContent`. `upNextContent` is the first entry of the response from `GET /content/v2/discover/up_next/{seriesId}`, which `fetchSeries` stored earlier, or `null` when that request returned no content. The change passes that same object to Katsu as one more argument."

## Name new things for what they describe

Any identifier you propose in a sketch, a design, or code: a type, a field, a function, a parameter, or an enum value. Also any existing field whose name leaves out what it describes.

A reader learns a new name once and then reads every later line through it. A name that skips its subject makes every later line ambiguous. `fullyWatched` does not say what was fully watched: one episode, a season, or the whole series. `ContinueWatching` names a screen feature, so the reader cannot tell that the type describes the server's answer to "which episode is next?".

- Name the subject and the fact. A boolean answers one yes-or-no question about one named thing, so its name contains that thing: `viewerFinishedPickedEpisode`, `viewerNeverWatchedSeries`. A number names its unit and its subject: `secondsWatchedOfPickedEpisode`, not `playheadSeconds`.
- Name a type for the data it describes, not for the screen or feature that uses it: `NextEpisodeFromServer`, not `ContinueWatching`.
- Name the values of a union or an enum as plain statements: `'episodePicked'` and `'nothingNext'`, not `'found'` and `'none'`. Write error codes the same way: `'PICKED_EPISODE_NOT_IN_LIST'`.
- Long names are fine. A sketch is read far more times than it is typed.
- When you explain an existing field you cannot rename, such as an API's `fully_watched` or `never_watched`, say which thing it describes every time it appears, in a relative clause: "`fully_watched`, which says whether the viewer finished the picked episode (not the season)". If two fields describe different things, say so side by side, because readers assume sibling fields describe the same thing.
- When you map an existing field to a proposed one, show the mapping in one place, field by field, so that the reader sees each old name next to its new name.

Wrong: "`fullyWatched` is false, so the viewer has not finished it."

Right: "`viewerFinishedPickedEpisode` comes from the API's `fully_watched`, which describes only the episode the server picked. It is false, so the viewer has not finished episode 2. `viewerNeverWatchedSeries` comes from `never_watched`, which describes the whole series: it is true only when the viewer has watched nothing in it."

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

## Say the operation, not the workplace word

Some words borrowed from offices and buildings describe a relationship without saying which operation creates it. Examples are "hand-off", "hands it", "wire up", "plumbing", "glue", "lives in", "sits behind", "talks to", "flows into", "holds", "carries", and "owns". A reader who does not already know the code cannot turn them back into an operation. These words break the `No analogy` rule more often than any other kind, because they sound technical.

Replace each one with the operation: which function calls which function with which arguments, or which file declares what.

Wrong: "The facade hands the creator the providers."

Right: "The facade's constructor calls `new HeartbeatPluginCreator(apiServicesContainer, appInfoProvider, deviceInfoProvider)`, and the creator's constructor stores those three arguments in private fields."

"Owns" needs the most care, because it merges three questions that can have three different answers:

1. Which repository declares the interface, that is, the shape the object must have?
2. Which repository contains the code that implements it, that is, the bodies of its methods?
3. Which code constructs the object at run time and passes it on?

For a provider in a player library, the library declares the interface, the host app writes the implementation, and the host app constructs the object and passes it to the library. "Tetsuo owns it" hides the fact that the shape came from the library. When "owns" is tempting, answer all three questions instead.

## No borrowed slang

Avoid language-idiom verbs such as "unwrap" or "flatten" unless the next words explain exactly what happens to the values.

Do not use "copy" to mean words on a screen. Write "The screen says..." or "The heading is...". Avoid reusing words with established interface or language meanings as shorthand, even after defining them once; see `Call a value by its code name`.

## No tables

Use prose, sentences with inline markers, or TypeScript instead of tables. Comparisons need complete sentences that preserve who does what and why.

When two implementations differ, show each implementation's relevant behavior and explain the difference in prose.

## Inline markers, not bullets

Any reply or document that would otherwise use a bulleted list or a numbered list.

A bullet invites a fragment. Once a line starts with a dot, the writer stops writing sentences and starts writing captions, each item shrinks to a label, and the reader gets less explanation than a paragraph would have given. Keep the enumeration inside the prose instead, so that every item stays a full, explained sentence.

- Mark items inside a sentence or a paragraph with parenthesized markers: (1), (2), (3) when the order matters, such as steps or a recap, and (a), (b), (c) when it does not, such as parallel options or caveats.
- Each item is a full clause with its own subject and verb, explained as deeply as it would be in a paragraph. A fragment with a marker in front of it is still a fragment.
- When an item needs more than one sentence, give it its own paragraph that starts with its marker, and write that paragraph in full.
- Start the markers again at (1) or (a) in each paragraph or section. Do not nest one set of markers inside another.
- Never refer back to an item by its marker, as in "see (2)". Write the thing itself; see `No pointers to labels`.
- Do not use markers directly under a code block or a diagram. Walk those in plain sentences in execution order; see `Walk through every code block`.
- This rule is about what the reader receives. The bulleted lists in this skill file are instructions to the writer, not examples of reply style.

Wrong:

- `parallel`: runs the agents at once
- `agent`: starts a helper

Right: "The script makes two calls: (a) `parallel(thunks)`, which calls every function in the array at the same time and waits until all of them have finished, and (b) `agent(prompt, options)`, which starts one helper conversation with that prompt and returns its final answer to the script."

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

## No pointers to labels

Any sentence, heading, diagram note, or list item that refers to something by a label defined elsewhere: a circled number such as ③ on a map, "step 2", "block A", "item 3 above", "the second case", or "the arrow numbered 5".

The reader will not scroll up to resolve a label, so a label in a sentence carries no information. "The constructor runs at ⑨" tells the reader nothing unless they find the map, find ⑨, and come back. This holds inside one reply as well as across replies, because a long reply puts the map several screens above the step that cites it.

- Write the thing itself every time: the call, the object, or the fact. "The constructor runs at ⑨" becomes "The constructor runs when `HeartbeatPluginCreator.create` calls `new HeartbeatPlugin(events, ...)`."
- Do not number the arrows or boxes in a diagram, because a number in a diagram invites a pointer to it later. Label an arrow with its real call instead.
- Inline markers such as (1) and (a) are fine for order inside a paragraph, such as the steps of a sequence or a recap, as long as no later sentence refers to an item by its marker. They are never fine directly under a code block or a diagram; see `Inline markers, not bullets` and `Walk through every code block`.
- A heading such as "Step 2: `playerOrchestrator` calls `emit` on `eventBus`" may keep its number, because the words after the number say what the step is. Later text still names the content, never "see step 2".
- Repeating the call or fact costs a few words. Making the reader scroll costs their place in the explanation.

## Name what "same" and "different" refer to

Any sentence that uses a comparative word: "same", "different", "other", "another", "each", "both", "the former", "the latter".

A comparative word has no meaning on its own. "The same link" means nothing until the reader knows which link, and "different labels" means nothing until the reader knows how many there are and what each one says. When you write one of these words, do three things in the same paragraph. Name the one thing that stays fixed. Count and name the things that vary. Then show them side by side, as a code block or as one sentence with inline markers, so the reader can see the fixed part repeated and the varying part change.

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

When a screen is skipped, explicitly say that the user does not see it. When it appears, say so, next to the diagram if the reader asked for one.

## Draw the surface

When the reader has asked for a diagram of a screen or tree, draw a detailed ASCII representation that resembles the actual surface or structure, and avoid a one-line abstraction that omits the relevant behavior. Without that request, describe the surface in prose, naming each visible control and what it does, and offer the diagram as `Diagrams only on request` says.
