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

Write complete grammatical sentences with subjects and finite verbs. Concision means removing unnecessary clauses, not writing fragments that the reader must decode. "Still in the editor" is a fragment; "The user is still in the editor" is a sentence.

The principles below are an index. Read the full named principle before applying it; do not rely only on its one-line description.

Do not characterize code before its lines appear in the reply. A label such as "display bug" or "data bug" comes after the real snippets, never instead of them. When two implementations differ, show each one's lines, walk both with the same concrete input, and only then say how they differ.

Every explanation answers why, not only what. Reading a condition aloud, such as "true when A, B, and C are all true", restates code the reader can already see. For every condition, guard, reset, default value, and wait, say what problem it prevents: the concrete wrong outcome that would happen without it, in domain words, with one example. The full rule is under `Say why each condition exists`.

Never walk a function body before saying what kind of definition it is, who calls it, when, and what it returns to that caller. For every call inside the body, either walk the callee or give one sentence that says what it returns and that its inside is not needed here. The full rules are under `Introduce a function by its kind and its caller` and `Decide whether to descend into each call`.

Everyday infrastructure words are terms. Host, environment, backend, endpoint, callback, redirect, parameter, field, body, token, client id, and scope each get defined by what they physically are in this flow, with the concrete value, the first time they appear; the full rule is under `Everyday infrastructure words are terms`. Before sending, scan the draft for a bare actor word ("the backend", "the app", "the service", "the parameter", "the status") and for one of these words used without its definition; each one is a sentence that will come back as a question.

Tell a flow as one chain of hand-offs. Each paragraph is one hop: a sender, the thing it sends, and the receiver, in that order, and the next paragraph opens with that receiver receiving it. An actor enters the story only as the receiver of a hop, never by appearing as the subject of a sentence out of nowhere. A fact a later hop needs is written out again at that hop, never pointed at with "topic 3", "step 1", or "the earlier reply". The reader should hold the whole flow after one reply, not after seven; the full rule is under `Tell the story as one chain of hand-offs`.

Count before you explain. The first time a flow comes up, say how many separate operations it has (network requests, thunks, events, screens), name each one in order, and say what each returns and why the next one is needed. A reader who is not told the count assumes there is one, and every later fact lands in that wrong picture. The full rule is under `Count the separate operations first`.

## Principles

This list is an index, one line per rule. Read the named section before applying the rule.

**Order**

- **The rules persist** for the whole conversation: `Baby-steps always applies`.
- **Not about code**: the reading counterparts for passages, science, and math: `Explanations that are not about code`.
- **Open with the intention**, put **a recap before it** from the second step on, and **tell the recap as a story**: `Open with the intention`.
- **Teach the transferable concept** by its standard name and one source: the `baby-steps` section `Teach the transferable concept`.
- **Dependency order**: `Dependency order`.
- **Start at the top**: `Start at the top`.
- **Count the operations first**: `Count the separate operations first`.
- **Tell the story as one chain of hand-offs**: each paragraph one hop, the next paragraph opening with its receiver: `Tell the story as one chain of hand-offs`.
- **Keep one map**, and re-open it per section: `Keep one map`.
- **Diagrams only on request**: `Diagrams only on request`.
- **Completeness**: `Completeness`.
- **Show a real payload**: `Show a real payload`.
- **Look past the ticket's sample**: `Look past the ticket's sample`.

**Code**

- **Show the real implementation**: `Show the real implementation`.
- **Walk through every code block**, naming each line by its code, never by its position: `Walk through every code block`.
- **Show the algorithm**: `Show the algorithm`.
- **Say why each condition exists**: `Say why each condition exists`.
- **Explain or cut a drive-by mechanism** raised inside a relative clause: `Explain or cut a drive-by mechanism`.
- **Name the step** before its identifier: `Name the step`.
- **Translate a flow's function names into actions**, at most one identifier per prose sentence: `Translate a flow's function names into actions`.
- **Caller before callee**: `Caller before callee`.
- **Reasoning above the function**: `Reasoning above the function`.

**Names**

- **Define the term first**: `Define the term first`.
- **Headings are words too**: `Headings are words too`.
- **Name code in this shape**: `Name code in this shape`.
- **Show the enclosing scope**, and never a bare function body: `Show the enclosing scope`.
- **Resolve `this`**: `Resolve this and every field it reaches`.
- **Show the type you just named**: `Show the type you just named`.
- **Do not coin a stand-in**: `Do not coin a stand-in`.
- **Introduce a channel by its owner, its reach, and its limit**; never "pipe 1": `Introduce a channel by its owner, its reach, and its limit`.
- **Call a value by its code name**: `Call a value by its code name`.
- **Give every repeated value its owner**: `Give every repeated value its owner`.
- **Name every actor; no bare "our", "we", or "the app"**: a cast list before a flow, then the cast-list name in every sentence: `Name every actor; no bare "our", "we", or "the app"`.
- **Name new things for what they describe**: `Name new things for what they describe`.
- **Unpack the call chain**, in caller order, never as numbered blocks: `Unpack the call chain`.
- **Introduce a function by its kind and its caller** before walking its body: `Introduce a function by its kind and its caller`.
- **Decide whether to descend into each call**, and say the decision: `Decide whether to descend into each call`.
- **A name is not an explanation**: a named function, hook, or earlier step gets its inputs, its output with a value, and its screen in the same paragraph: `A name is not an explanation`.
- **Show the literal value, not a verb for it**: `Show the literal value, not a verb for it`.
- **Teach a foreign concept as its own step** before the line that uses it, and **substitute every constant** with its value: `Teach a foreign concept as its own step`.
- **Restart at the lost sentence and name what it skipped**: `Restart at the lost sentence and name what it skipped`.
- **Plant the fact a later step depends on**: `Plant the fact a later step depends on`.
- **Walk before you conclude**: no conclusion in a recap, intention, or aside before the steps that earn it: `Walk before you conclude`.
- **Show the data structures side by side** when a value lives in more than one place: `Show the data structures side by side`.
- **Walk a chain of delegations hop by hop**, in one block, never as a prose list of names: `Walk a chain of delegations hop by hop`.
- **Trim the block to the lines that decide the question**: `Trim the block to the lines that decide the question`.
- **A proposal is a walkthrough**, one change per reply, every line walked: `A proposal is a walkthrough`.
- **Everyday infrastructure words are terms** (host, environment, callback, parameter, token): `Everyday infrastructure words are terms`.
- **Say what the receiver does with each field** it is sent: `Say what the receiver does with each field`.
- **Say the usual purpose before a reuse** of a token, error, or status: `Say the usual purpose before a reuse`.
- **Resolve an apparent contradiction at the step that raises it**: `Resolve an apparent contradiction at the step that raises it`.

**Prose**

- **Grammatical sentences**: `Non-negotiables`.
- **Domain sentence first, code mapping second**: `Domain sentence first, code mapping second`.
- **Write the claim in plain words**: `Write the claim in plain words`.
- **Paraphrase the reader's words; never echo them**: `Paraphrase the reader's words`.
- **Explanation constructs** (relative clauses, appositives, cause and purpose clauses): the `baby-steps` section `Explanation constructs`.
- **Say what the request does**, **write the long phrase**, **no telegram**, **no analogy**, and **no borrowed slang**: their sections below.
- **Say the operation, not the workplace word**: `Say the operation, not the workplace word`.
- **No tables** and **inline markers, not bullets**: `No tables` and `Inline markers, not bullets`.
- **No backticks inside inline code**: `No backticks inside inline code`.
- **No bare repository adjectives**: `No bare repository adjectives`.
- **No pointers to labels**, including ordinals such as "the second", topic and step numbers, and "the earlier reply": `No pointers to labels`.
- **Restate the question before answering it**; never "that answers question 3": `Restate the question before answering it`.
- **Map code to the story in the story's order**, one block, one entry per step: `Map code to the story in the story's order`.
- **Name what "same" and "different" refer to**, and what "nothing", "everything", and "the rest" stand for: `Name what "same" and "different" refer to`.

**Screens**

- **Name the real input**, **say if the viewer sees it**, and **draw the surface**: their sections below.

## Open with the intention

For a reply or document longer than a few sentences, open with one sentence that answers: "What should the reader understand or decide after reading this?"

Do not merely announce the topic. "Here is a summary of the request handling" is not an intention. "My intention is to show you which failures cause another request, so that you can decide whether this operation is safe to repeat" gives the reader a purpose.

The intention sentence is itself an explanation, not a label, because it is what equips the reader with the expectation of what they are about to learn. Spend the same care on it as on the body: name the concrete things the reader will hold at the end — the parts, the question answered, the decision enabled — and attach a relative clause, appositive, or purpose phrase to each name the sentence must use before the body has defined it. A pithy intention wastes the slot.

Wrong: "My intention with this step is to explain the token endpoint."

Right: "My intention with this step is to define the token endpoint — the one URL on the authorization server where tokens are issued — and to show the single HTTPS request that 'sending the credential' physically is, so that the exchange stops being abstract."

Under every markdown section heading, begin with a sentence that starts "My intention with this section is to".

By the fifth step or section, the reader has forgotten the first four. The intention sentence looks forward, so from the second step or section on, put a recap before it. The recap starts "So far, we have covered" and names the facts the earlier steps established, such as the construct, the value, and the concept. It does not name the step titles. When three or more steps came before, write the recap as one paragraph with inline markers, (1), (2), (3), one full sentence per earlier step. A reply that continues an earlier walkthrough starts with the same recap. The `baby-steps` skill has the full rule with wrong and right examples.

A recap is a story, not an inventory. Write it in cause-and-effect order with domain words, such as "the QR login request returned, so the sign-in screen asked the server for the full account; when the account arrived, the screen moved on", and add identifiers only after the sentence already makes sense without them. A list of code facts, such as "the hook fetches while `isLoginStatusSuccessful` is `true`; it navigates once `isLoginAccountUpdateSucceeded` is `true`", hands the reader names to remember instead of a picture to hold.

## Dependency order

Define a thing before its name does explanatory work. Do not introduce several unfamiliar terms in one sentence and explain only one.

For example, first explain that an array holds an ordered collection of values. Then explain that `map` is a method on an array, which calls a function for each element and returns the results in a new array. Do not begin with "Use a higher-order array transformation" and assume the reader knows all three concepts.

Never refer to a group of downstream functions before any of those functions has been introduced. For example, writing "Instead of passing the entire five-field server object into the selection functions, the package declares `SelectableProfile` and `toSelectableProfile`" before any selection function has been introduced leaves the reader with no foundation for what "the selection functions" are, so the reader mistakes `toSelectableProfile` itself for "selection" (selecting two fields out of five). Either introduce and name the downstream function (`resolveStoredProfile`) first, or describe the immediate conversion on its own terms without naming an unexplained consumer.

Never show a function's input, such as a normalized value like `membership.status: "UNKNOWN"`, before the real code that produces it and the call site that passes it in. When proposing a new function that replaces existing code, show the existing code first, then the new function, then the existing caller calling it. Otherwise the reader has to ask "who calls that?" and "which repository is this in?".

## Start at the top

Start a walkthrough with the easiest high-level behavior. Explain one layer at a time and follow the depth requested by the reader.

Leaving the next system for later is reasonable. Leaving a term already introduced half-defined is not.

## Count the separate operations first

Any flow that takes more than one operation: two network requests in a row, a thunk that a screen starts after another thunk returns, an event that a second module answers, or a sign-in that spans several screens.

A reader who is not told how many operations a flow has assumes there is one. Every later fact then lands in that one-operation picture, and correct facts start to look absurd. A login request's status going back to `IDLE` after a successful account fetch looks pointless to a reader who pictures one request, and obvious to a reader who knows there are two, each with its own status. Defining the condition more carefully does not help, because the definition is not what is missing. The count is.

- The first time a flow comes up, before any status field, selector, or condition, say how many separate operations it has and name each one in the order it runs. For each one, say who starts it and on which event, what it returns or changes, and what the next operation needs that this one did not provide.
- When one operation bundles several calls under one status, such as a thunk that makes several HTTP calls and tracks them with one status field, count it as one operation, say that it bundles several calls, and name them once.
- Tie each status field to its operation the first time the field appears; `Give every repeated value its owner` has the rule.
- Keep the count in every later recap of the same walkthrough, so that a reader who returns after a break gets the picture back before the details.
- When the reader calls a condition pointless, contradictory, or backwards, first ask which picture would make their question reasonable. If that picture has fewer operations, actors, or moments than the code has, name the miscount in one sentence, such as "That question makes sense if there is one request; there are two", and rebuild the explanation from the count. Do not re-explain the condition in new words.
- The count is part of the claim that the walk order in `baby-steps` puts first, so it does not change that order.

Wrong: a reply that opens the QR sign-in with `selectIsLoginAccountUpdateSucceeded` and its three conditions, and mentions the account fetch only inside the walk of the third condition. The reader, still picturing one request, asks why a successful login would set its own status back to `IDLE`, and the next reply re-explains the three conditions.

Right: "Signing in with a QR code takes two separate operations, not one. The first, the QR login request, returns tokens and the account id, which prove the login but say nothing about the subscription or the profiles. The sign-in screen then starts the second, the account fetch, which is one thunk that makes several HTTP calls, because where the screen sends the user depends on the subscription and the profiles. Each operation has its own status field: `loginWithPinStatus` describes the QR login request, and `updateAccountStateStatus` describes the account fetch."

## Tell the story as one chain of hand-offs

Any flow with more than one actor: an app, an SDK, a server, a second server, a table.

A paragraph that opens with an actor the previous paragraph never handed anything to breaks the story. "third-party-oauth then spends the code" made the reader ask how third-party-oauth came into the picture, even though a request body addressed to it sat in the paragraph above; the paragraph above never said that the Tetsuo app sends that body to third-party-oauth, so the receiver appeared from nowhere. The reader said the story must flow linearly, that every important noun and verb needs its description at the point it is used, and that a picture which took seven replies to assemble should have arrived in one.

- Each paragraph of a flow is one hop, written in this order: the sender, the thing sent (a request, a code, a token, a row), and the receiver. "The Tetsuo app sends this body to third-party-oauth."
- The next paragraph's subject is that receiver, and its first sentence says what it received before saying what it does: "third-party-oauth receives the body. It takes the code out of the field `third_party_auth_code` and spends it."
- An actor enters the story only as the receiver of a hop. When it first receives something, one sentence says what it is and who owns it, in the cast list's words, even when a cast list above already said so. The cast list is a reference; the hop is where the reader meets the actor.
- Every noun that carries the story (an actor, a message, a value, a table, a screen, a channel) is introduced at the hop where it first appears, with what it physically is and who owns it, before that hop uses it. `Everyday infrastructure words are terms` and `Define the term first` give the form.
- A fact a later hop depends on is written out in full at that hop. `No pointers to labels` bans "topic 3", "step 1", "the second flow", and "the earlier reply" as substitutes for the fact.
- Before sending, read only the first sentence of every paragraph in order. Each one must name a subject that the paragraph before it handed something to. Where one does not, add the hand-off sentence to the paragraph above or move the paragraph.

Wrong: "Here is the body of the create request. [body] The field `client_id` is ... third-party-oauth then spends the code."

Right: "The Tetsuo app sends this body to third-party-oauth, Crunchyroll's Go service on Crunchyroll's AWS. [body] The field `client_id` is ... third-party-oauth receives this body. It takes the code out of the field `third_party_auth_code` and spends it by sending one HTTPS POST to Sony's PSN token server."

(Added 2026-10-29 after the reader needed seven replies to assemble a flow whose actors kept appearing without a hand-off.)

## Keep one map

Any walkthrough that names more than about four parts, such as packages, classes, objects, or services, in one reply or across several.

Facts given one per paragraph do not add up to a picture. By the third reply the reader holds a definition of each part and still cannot say how the parts connect, which they will describe as "scattered". Give the reader one place to look. By default that place is a glossary in prose, because a diagram takes a large share of the reply; the diagram is drawn only when the reader asks for one, as `Diagrams only on request` says.

- Right after the intention sentence and the recap, give the glossary: one plain paragraph per part named so far, in the order a reader would meet them, with no bullets and no markers. Each paragraph starts with the part's name and says what kind of thing it is (an npm package, a class, an interface, an object built at run time), which repository its code is in, what it does, and the real call that connects it to the next part, such as `new HeartbeatPluginCreator(...)` or `creator.create(events, callbacks)`. Never describe a connection with a verb such as "hands off to" or "talks to".
- When the reader has asked for a diagram, draw one ASCII diagram above the glossary that puts every part in a single picture. Each box gives the part's name, its kind, and its repository. Label each arrow with the real call that connects two boxes, never with a verb.
- In each later reply of the same walkthrough, give the glossary again with the new part added and marked `(new)`, so that the reader sees where it attaches, and redraw the map the same way when one was asked for. Do not point back at an earlier reply's glossary or map.
- Each step after the glossary explains one part or one connection in it, and says which one by repeating the part's name or the call, never by a number. Do not number the arrows or boxes of a map; see `No pointers to labels`.
- When no diagram was asked for, end the reply with one sentence that says an ASCII diagram of these parts is available on request.
- A section of a reply that turns to a different mechanism re-opens with that mechanism's count of operations and its own glossary; it does not inherit the previous section's map. On 2026-10-28 the third section of a reply moved from the login screens to the launch-argument pipeline and named the feed service, the system launcher, the PS5 hook, its translator, the shared parser, the router, and analytics in passing, and the reader reported that the whole section made no sense and was missing information. The count ("a launch link is written by one service, delivered by the system, and read by three functions in a row") and the glossary come before the first code line of that section.

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

For a teaching sketch that is not a production signature, give parameters concrete sample defaults. Do not use `undefined` merely because a type allows it. For a real function, preserve the signature and put example values at the call site. Never explain a branch by saying an optional configuration field on the input is `undefined` (such as "`query.checksToRun` is `undefined`, so `checks` uses `DEFAULT_CHECKS`") when walking a failure scenario like an HTTP 500 outage; an unexplained `undefined` field makes the reader think the failed HTTP call returned `undefined` or that a converter function was skipped. Omit optional override fields from the initial walkthrough until the core flow is understood, and always show the concrete object literal passed at the call site.

Explain how the actual caller consumes the actual return value. Do not invent a result such as `{ action: "keep" }` when the implementation writes state and returns nothing.

## Walk through every code block

Any code you show, in any reply, not only in baby-steps.

A code block is evidence, not teaching. The reader can see the characters, but the branch order, the operator meaning, and the concrete values are still in your head. After every block, walk it: one short sentence per line or branch, in execution order, each sentence naming what that line reads, what it compares or calls, and what it returns, with one concrete value. Then say what the result means for the screen or the request. This is not a license for a long reply. A four-line block gets four or five sentences. If you will not walk a line, cut it from the block, or replace it with `// ...`.

Write the walk as plain sentences in paragraphs. Never write it as a bulleted list, a numbered list, or a paragraph of inline markers. Numbers or markers under a block read as a second set of labels next to the code's own lines and invite a later "see 3" pointer, and bullets shrink each line's walk to a caption. The same holds under a diagram.

Wrong: a function named `resolve` with four `if` lines and trailing comments such as `// 1. the URL named an episode`, followed by a new paragraph that starts "The store saves the result". The comments are labels, not a walk. The reader does not know what `find(episodes, episodeId)` returns when the id is absent, why `seasonId` is checked second, or what `resumeTarget` returns.

Right: the same block, followed by: "`if (episodeId)` asks whether the URL carried an episode id. For the sample, `episodeId` is `"EP-123"`, so `find(episodes, episodeId)` returns that episode object, and the function returns it with the word `"episodeId"`; nothing below runs. If the URL had carried only a season id, `if (seasonId)` would take the first non-clip episode of that season and return `"seasonId"`. With neither, `resumeTarget(episodes)` reads each episode's progress and returns the most recently watched episode with `"resume"`, the one after it with `"upNext"`, the last one with `"completed"`, or `null` when nothing was watched. Only when it returns `null` does the final `return` fall back to the first non-clip episode with `"seriesFallback"`. The word is what the label hook maps to the button text, so `if (episodeId)` matching is why the button says Start Watching."

Every block means every block:

- A one-line block is a block. A call shown on its own, such as `this._eventBus.emit(PlayerEventType.USER_INTERACTION, data);`, gets its own walk: which object receives the call, what each argument holds, and what the call returns. A sentence such as "That calls the event bus's `emit` method", which only introduces the next block, does not walk this one.
- A function's signature line is a line. Walk its parameters and its type parameters before the body.
- Name each line, branch, or function by quoting its code, never by its position. "The first line", "the second arrow function", and "the third" make the reader count and guess, and an ordinal followed by a verb, such as "The second receives `next`", reads as a noun doing something. Write "`if (seasonId)` takes the first episode of the season" or "the function `next => action => { ... }` takes one parameter, `next`".
- When code nests anonymous functions, such as a curried middleware `({ dispatch, getState }) => next => action => { ... }`, first say how many functions there are and who calls each one and when, then refer to each one by its parameter: "the function that takes `next`, which Redux calls once while building the store, so that this middleware knows which function to pass actions on to".
- A line is walked only when every name, keyword, and operator in it has been defined. Examples are `this`, a type parameter such as `<K extends keyof EventMap>`, the spread `...`, an arrow function `(event) => { ... }`, `switch` with `case` and `break`, `?.`, and `??`. Define each one in the walk sentence for the line where it first appears in the conversation.
- Sentences grouped under a label, such as "The disposed check", are a walk only if they still say what each of its lines reads, calls, and returns. A label followed by a paraphrase of the outcome is not a walk.
- When walking a function that has several decision gates (`if` or `switch` branches), do not lock the entire walk to one fixed input that makes every earlier branch say "this branch does not run for our example". Instead, float a concrete input for each decision gate as the walk reaches that branch, and show the concrete output that input produces, so the reader sees every gate fire with real values.
- Never put fields in a sample object (such as `original: true`) or refer to unseen downstream files, analytics events, or future return strings that do not appear in the code block currently on the screen. When the walk talks about fields or functions that are not in the displayed code block, the reader cannot tell whether the explanation is reading the displayed code or inventing something else. Every line of the displayed code block must be walked in order first, using only the variables and properties that appear in that block.
- When walking every block fully would make the reply too long, show fewer blocks and name the next one in a sentence. Never keep the blocks and thin the walks.

## Show the algorithm

Do not hide a predicate inside a boolean parameter. Show the actual conjunctions, comparisons, and early returns that determine the result.

For example, explain which fields are checked and why a comparison is necessary. A function that merely returns a supplied flag does not demonstrate the algorithm.

## Say why each condition exists

Any condition, guard, early return, reset, default value, or wait in code you explain.

Reading a condition aloud, such as "this is true when the user is logged in and every login status is idle", restates what the reader can already see. It answers "what", and the reader's question is "why": why this condition, why at this moment, why this value. A reader who knows `&&` learns nothing from hearing it described.

- Before walking the parts of a function, say in one or two domain sentences what problem the whole function solves. "After a login request succeeds, the app holds only tokens. It still has to ask the server for the account's profiles and subscription before it can decide which screen to show."
- For each operand of an `&&` or `||`, say what goes wrong without it: the specific wrong outcome, the moment it happens, and one concrete example.
- For a value set back to its default (`IDLE`, `null`, `false`), say what the default means in this state machine, what pending work the reset marks as finished, and what would repeat or break if the value stayed where it was.
- For a wait (`setTimeout`, an early `return` until something is ready, a loading guard), say what the code is waiting for and what happens if it does not wait.
- If the reason is not visible in the code, its comments, or its history, say so plainly and say where it would have to come from (the commit, the ticket, the author). Do not invent a reason.

Wrong: "`selectIsLoginAccountUpdateSucceeded` is `true` only when the account fetch succeeded, the user is logged in, and the idle check is `true`."

Right: "The screen must not leave the sign-in page until it holds the account of the user who just logged in, because where it sends the user depends on that account's subscription. The account fetch's status alone cannot prove that, since it may still say `SUCCEEDED` from a fetch that ran before this login. So the selector also requires the login request's status to be back at its default, `IDLE`, which after a successful login happens only when the follow-up account fetch succeeds."

## Explain or cut a drive-by mechanism

Any relative clause or aside attached to a walked line that raises a check, a rule, or a requirement the reader has not met: "the address registered for this client at Sony, which Sony requires to match the one in force when the code was issued".

Such a clause names a mechanism (here, redirect-address matching) without saying what two values are compared, who compares them, what happens on a mismatch, or what mistake the comparison prevents. The reader marked the clause with question marks. A relative clause can define a noun; it cannot carry a new rule.

- Either give the mechanism two or three sentences of its own: the two values compared, with one example each; the party that compares them; what happens when they differ; and the mistake or attack the comparison prevents. Or cut the clause and say in one sentence that the line is not needed for the current question.
- Test for a drive-by: the clause contains "requires", "must match", "validates", "checks", "ensures", or "is compared", and the reader has not yet seen both sides of the comparison.
- `Say why each condition exists` covers a condition that is itself the walked line. This rule covers a condition smuggled into the description of some other line.

(Added 2026-10-29.)

## Name the step

Name a sequence step for its action before introducing a codebase identifier. "After the password succeeds, remove the saved PIN" gives the reader an action to follow.

A teaching function may use a simpler name when necessary, but its ordering, branches, and operations must remain faithful to the real implementation.

## Translate a flow's function names into actions

Any flow that crosses several functions, services, or machines, where each step has a code name: `AutolinkAuthCode`, `onlyCreateNewAccounts`, `GetUserId`, `SetTokenByAuthCode`.

A function name is a label its author chose, not a description of what happens. A sentence that carries three such labels gives the reader three things to look up and no action to picture. A reader given "`AutolinkAuthCode` routes `playstation` to `onlyCreateNewAccounts`, and the service trades it with Sony again in `SetTokenByAuthCode`" said they "completely didn't understand", and named the cause: "too many syntax stuff".

- Name every step in prose by the action it performs, with its actor and its target, derived from the function's own body: "the service trades the code with Sony", "the create-only path registers the account and returns a login code", "the link request writes the token row". The action phrase must be something the function's lines visibly do, so it is a description, not a coined label; `Do not coin a stand-in` still forbids inventing a name for a predicate or a set of fields.
- Give each identifier one mapping sentence per section, after the action has been described: "In code, the create-only path is `onlyCreateNewAccounts` in `service/auto_link.go`." After that sentence, the prose uses the action phrase, and the identifier appears only in code blocks and in the walk directly under a block, where the lines are in view.
- A prose sentence carries at most one identifier. Two identifiers in one sentence mean the sentence is a code map, not an explanation; split it into a domain sentence and a mapping sentence as `Domain sentence first, code mapping second` requires.
- Use the same action phrase for the same function every time. A function that is "the link request" in one paragraph and "the token writer" in the next has become two things.
- When a flow forks, name each path by the decision that picks it and by what it does: "the PlayStation path, which only creates accounts" and "the Amazon path, which also links to an existing account by email". Never name a path only by its function.
- This rule is for functions, requests, and paths, which are actions. `Call a value by its code name` is for values, which are things, and it still holds: `partnerProfile.UserId` stays `partnerProfile.UserId`, while the function that fills it is "the step that reads the ID token".

Wrong: "`AutolinkAuthCode` routes `playstation` to a function named `onlyCreateNewAccounts`, and that function registers the account and returns the login code without writing any token row. The second request is the PUT from `linkAccount` in the app, and the service trades it with Sony again in `SetTokenByAuthCode`."

Right: "For PlayStation, Crunchyroll's third-party-oauth service takes a create-only path. It trades the code with Sony's PSN token server, reads the PSN id and the email out of the ID token, and if neither is already known it creates the account through Crunchyroll's accounts API and returns a Crunchyroll login code. It stores no Sony token on this path. The link request, which the Tetsuo app sends after login with a second code, is the one that makes third-party-oauth trade with Sony's PSN token server again and write the token row. In code, the create-only path is `onlyCreateNewAccounts`, and the link request is handled by `SetTokenByAuthCode`, both in `service/auto_link.go`."

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

When a helper narrows a response into a smaller type, give the helper's parameter the full response type, so the reader sees which fields enter and which are dropped.

## Do not coin a stand-in

Do not invent labels such as "the tile rule" to replace a predicate, a key, or several fields. Show the actual condition or fields when they matter.

Do not open a discussion of every field that a type leaves out. Stay with the object and behavior being explained.

## Introduce a channel by its owner, its reach, and its limit

Any flow in which one actor can reach other actors over more than one path: an SDK inside an app and the app's own HTTP client; a Webview and the app's own fetch; a WebSocket and a REST client.

A coined label such as "pipe 1" and "pipe 2" leaves the reader translating labels back to things. The reader said the two pipes "kinda made sense" and then supplied the explanation that was missing: one path is the console's SDK, which talks only to Sony and never to Crunchyroll; the other is the Tetsuo app's Crunchyroll HTTP client, which carries every Crunchyroll API call.

- Name each path by the component that owns it, in the cast list's words: "the console's SDK", "the Tetsuo app's Crunchyroll HTTP client". `Do not coin a stand-in` already bans "pipe 1".
- For each path, one sentence gives three things: what it physically is (a library loaded inside the app; an HTTP client object inside the app), the one party it reaches, and the party it cannot reach.
- Then say which message travels which path, by the message's name: "The authorization code comes back through the console's SDK. The create request goes out through the Tetsuo app's Crunchyroll HTTP client."
- Do this before the first hop that uses either path, so that every later hand-off can name its path in the cast list's words.

(Added 2026-10-29.)

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

## Give every repeated value its owner

Any value that appears in more than one field, request, or moment: a status such as `SUCCEEDED` or `IDLE`, a boolean, `null`, or an id.

Two fields can hold the same value with different meanings. `SUCCEEDED` on the login request and `SUCCEEDED` on the account fetch describe two different requests, and a reader who sees two bare `SUCCEEDED`s concludes that two different moments are the same moment.

- Every time such a value appears in prose, attach its owner and its meaning: "the login request's status is `SUCCEEDED`, which means the login answered and nothing has acted on that answer yet". Never write "the status is `SUCCEEDED`" or "everything is positive".
- Name moments by the event that defines them, with its owner: "the moment the QR login request returns" and "the moment the account fetch returns". Never write "the fetch has succeeded" when two requests exist.
- The first time a status field appears, say what it describes: a request, a screen, or a fact about the user. "`loginWithPinStatus` describes the QR login request, not whether anyone is logged in."
- In a snapshot of state, comment each field with its meaning at that moment, and put the moments side by side so the reader sees which field changed.

Wrong: two snapshot comments that read "the QR login request has just succeeded" and "the fetch has succeeded", with `SUCCEEDED` in both and no word on whose `SUCCEEDED` each one is.

Right: "When the QR login request returns, the login request's status is `SUCCEEDED`, meaning its answer has arrived and nothing has acted on it yet, while the account fetch's status still shows a result from before the login. When the account fetch returns, the account fetch's status is `SUCCEEDED`, meaning the new user's account is now in the store, and the login request's status is back at `IDLE`, meaning its follow-up is done."

## Name every actor; no bare "our", "we", or "the app"

Any sentence in a flow that crosses programs, machines, or companies: "our service trades the code with Sony", "the app sends the code", "we store the token".

"Our", "we", "the app", "the service", and "the backend" each have several candidates once a flow has two companies and three programs. A reader asked "who is OUR? who is the app?" after a walk that used both words in every paragraph. Each bare word makes the reader pick a candidate, and a wrong pick silently breaks every later sentence, because the reader then assigns each action to the wrong machine.

- Before the first step of a flow, give a cast list: one line per actor with its proper name, the company or team that owns it, the kind of program it is, and the machine it runs on. "The Tetsuo app: Crunchyroll's PS5 app, JavaScript, built by LRX Core, running on the console in the viewer's home."
- In every later sentence, call each actor by its cast-list name. Never write "the app", "the service", "the backend", "our side", "we", "us", or "our" while more than one program or company is in the flow. Write "Crunchyroll's third-party-oauth service" and "Sony's PSN token server", not "our service" and "Sony".
- A company name alone is not an actor. "Sony" here is at least two organizations, SIE for PlayStation and Sony DX for Sony Account, and several servers. Name the program or server: "Sony's PSN token server", "Sony DX's M-DCIM service".
- People are actors too. When a flow has two people, such as Alex and Sam sharing one console, say which one acts; "the user" names neither.
- Possessives follow the same rule: "the Tetsuo app's request" and "third-party-oauth's MySQL table", not "our request" and "our table".
- A repeated full name is cheaper than a wrong guess. Do not shorten to "the app" in the third paragraph because the first paragraph named it; the reader may have started at the third paragraph.
- Inside the walk directly under a code block, where a method reads `this`, the identifier does the naming, as `Resolve this and every field it reaches` says.

Wrong: "The app sends the code. Our service trades it with Sony and writes the row."

Right: "The Tetsuo app sends the code to Crunchyroll's third-party-oauth service. third-party-oauth trades the code with Sony's PSN token server, then writes the row into third-party-oauth's own MySQL table."

## Name new things for what they describe

Any identifier you propose in a sketch, a design, or code: a type, a field, a function, a parameter, or an enum value. Also any existing field whose name leaves out what it describes.

A reader learns a new name once and then reads every later line through it. A name that skips its subject makes every later line ambiguous. `fullyWatched` does not say what was fully watched: one episode, a season, or the whole series. `ContinueWatching` names a screen feature, so the reader cannot tell that the type describes the server's answer to "which episode is next?".

- Name the subject and the fact. A boolean answers one yes-or-no question about one named thing, so its name contains that thing: `viewerFinishedPickedEpisode`, `viewerNeverWatchedSeries`. A number names its unit and its subject: `secondsWatchedOfPickedEpisode`, not `playheadSeconds`.
- Name a type for the data it describes, not for the screen or feature that uses it: `NextEpisodeFromServer`, not `ContinueWatching`. Avoid truncated jargon (`Tri`), vague umbrella nouns (`EligibilityFactor`), and words that are both a verb and a noun (`FreeTrialCheck`). Never reuse a union of `"NO"` disqualification strings (such as `"ALREADY_HAS_PREMIUM_SUBSCRIPTION"`) as the reason for an `"UNKNOWN"` branch (such as `{ canStartFreeTrial: "UNKNOWN", unknownSource: "ALREADY_HAS_PREMIUM_SUBSCRIPTION" }`), which contradicts itself in plain English when `membership.status` is `"UNKNOWN"`. Give the `"NO"` branch and the `"UNKNOWN"` branch their own truthful reason unions (`FreeTrialDisqualificationReason` for why the answer is `"NO"`, such as `"VIEWER_ALREADY_HAS_PREMIUM"`, and `FreeTrialUnknownReason` for why the answer is `"UNKNOWN"`, such as `"MEMBERSHIP_STATUS_IS_UNKNOWN"`), both under the plain property name `reason`.
- Name the values of a union or an enum as plain statements: `'episodePicked'` and `'nothingNext'`, not `'found'` and `'none'`. Write error codes the same way: `'PICKED_EPISODE_NOT_IN_LIST'`.
- Long names are fine. A sketch is read far more times than it is typed.
- When you explain an existing field you cannot rename, such as an API's `fully_watched` or `never_watched`, say which thing it describes every time it appears, in a relative clause: "`fully_watched`, which says whether the viewer finished the picked episode (not the season)". If two fields describe different things, say so side by side, because readers assume sibling fields describe the same thing.
- When you map an existing field to a proposed one, show the mapping in one place, field by field, so that the reader sees each old name next to its new name.

Wrong: "`fullyWatched` is false, so the viewer has not finished it."

Right: "`viewerFinishedPickedEpisode` comes from the API's `fully_watched`, which describes only the episode the server picked. It is false, so the viewer has not finished episode 2. `viewerNeverWatchedSeries` comes from `never_watched`, which describes the whole series: it is true only when the viewer has watched nothing in it."

## Unpack the call chain

If a function calls a second function, which calls a third, explain all three. For each, say what kind of code it is and what it does.

Do not replace those explanations with `A -> B -> C`. Show the relevant calls after the prose when code helps.

Organize a multi-function walk by the chain itself, in caller order, and give the whole chain once before the first body: "at boot, `initializeFeatureFlagsProxy` calls `proxyManager.initialize`, which calls `ProxyClient.initialize`, which calls `prewarm`, which calls `fetchFeatureFlags`, which calls `fetchLrxConfigFromS3`". Each later step's heading names the call that leads into it, such as "`prewarm` calls `this.fetchFeatureFlags()`". Do not organize the walk as "Block 1", "Block 2", "Block 3" chunks that jump between classes; a reader who meets `CacheManager` for the first time in "Block 3", with no sentence saying that `prewarm` in "Block 1" is what calls `cacheManager.set`, experiences the pieces as scattered and stops. Every class, object, or module that a step walks must already appear in the glossary from `Keep one map`, with the real call that reaches it. (Added 2026-10-26 after a walk of the feature-flag proxy introduced `ProxyClient`, `CacheManager`, and `LrxHttpClient` in separate numbered blocks and the reader could not say how they connected.)

## Introduce a function by its kind and its caller

Any function, method, or hook whose body you are about to walk.

A body walked on its own answers "what do these lines do" but not "what is this thing and when does it run". The reader of a walk that opened with `private async prewarm(): Promise<boolean> {` asked afterwards: is that a method of some object, an exported module function that others call, and who calls it? Those questions come first, because every line in the body is read differently once the reader knows the body runs once at boot inside one object versus on every render.

Before the body, write one or two sentences that give four facts: (1) what kind of definition it is, such as a private method of the class `ProxyClient`, an exported function of the module `LocalDefaults`, a React hook, or an arrow function stored in a `const`; (2) who calls it and at what moment, such as "`ProxyClient.initialize` calls it once, at app boot, after the config URL is resolved"; (3) what it returns to that caller, with one concrete value; and (4) for a method, which object `this` is at run time, as `Resolve this and every field it reaches` says. When the caller has not been introduced yet, introduce the caller first; `Caller before callee` already requires the order.

Wrong: a code block that starts `private async prewarm(): Promise<boolean> {`, followed directly by "`const flags = await this.fetchFeatureFlags()` performs the GET".

Right: "`prewarm` is a private method of the class `ProxyClient`. `ProxyClient.initialize`, which the boot code calls once through `proxyManager.initialize(config)`, calls `await this.prewarm()` right after it resolves the config URL, so `prewarm` runs once per app launch. It returns `true` when the download succeeded and `false` when the app fell back to local defaults; `initialize` only logs that result. Inside it, `this` is the one `ProxyClient` object that `ProxyManager` created." Then the block, then the line-by-line walk.

## Decide whether to descend into each call

Any call inside a block you are walking, such as `fetchLrxConfigFromS3(...)`, `getLocalFeatureFlags()`, or `this.cacheManager.set(flags)`.

Not every call deserves its own walk, and a walk that opens every callee drowns the reader; but a call skipped silently leaves the reader unsure whether something important hides inside it. Open the callee's source before deciding, then make the decision in the reply so the reader knows which it was.

- Descend, with its own introduction and walk, when the callee's branches produce the behavior being explained, when the reader asked about it, or when its return value's shape is not obvious from the call site. The `catch` branch of `fetchFeatureFlags` that handles a 304 is such a callee when the question is why flags vanished.
- Otherwise skip it with one assurance sentence that names what goes in, what comes out with a concrete value, and that the inside is not needed here: "`fetchLrxConfigFromS3(this.lrxHttpClient, this.lrxConfig.url)` sends the GET and returns `{ fullConfig, flags }`, the parsed file and its `featureFlags` section as an array; it is plain transport with no branches that matter here, so we are not going into it."
- Never skip a call by naming it and moving on. The assurance sentence is the minimum, and "performs the GET" without the return value is not an assurance.
- When you later need a skipped callee's internals, descend then, and say that you are now opening what the earlier reply skipped.

This rule tells an assistant to read the callee's file and judge, rather than either descending into everything or hand-waving; both failures were reported by the same reader on the same day.

## A name is not an explanation

Any sentence that explains a value or a step by naming a function, hook, helper, or earlier step: "`checkoutRedirectTo` is read by `useRedirectTo('checkoutRedirectTo')`", "after the PSN account creation, the helper replaces the route with `/checkout`", "the parser carries the UTM fields onto the destination URL".

The reader holds no function body in memory, not even one shown in an earlier reply, and said so on 2026-10-28 after reading "`checkoutRedirectTo` is read by `useRedirectTo('checkoutRedirectTo')`": they cannot run a hook from its name the way a machine would. A name tells the reader where to look, not what happens. `Decide whether to descend into each call` already forbids skipping a call by naming it; this rule covers the same failure when a name is used as the explanation of a value, a step, or a noun phrase.

- Every function, hook, or helper named in an explaining sentence gets, in the same paragraph, either its trimmed body or an assurance sentence with three parts: what it reads from (a query parameter, a store field, a response body), what it returns with one concrete value, and whether it draws anything. "`useRedirectTo('checkoutRedirectTo')` is a hook that reads the query parameter named `checkoutRedirectTo` from the current URL, base64-decodes it, and returns the path, so on `/plan-chooser?checkoutRedirectTo=L2RldGFpbC9HNFBIMFdYVko%3D` it returns `/detail/G4PH0WXVJ`; it draws nothing."
- A noun phrase that stands for an earlier step, such as "the PSN account creation" or "the detour", is re-expanded where it is used: which function ran, who started it, and what the viewer saw while it ran. "After `executeThirdPartyAuth` has created the account from the PlayStation code, which the viewer experiences as a loading spinner and then a toast, it replaces the route with `/checkout`."
- A collective noun for code, such as "the parser", "the router", or "the translator", is introduced once per reply with its file, its kind, and its one-line job before it is used as a subject: "the shared parser, `getNavTargetFromDeeplink` in `deeplinkParser.ts`, turns a query string into a route path".
- This holds across replies and across sections of one reply. A function walked yesterday, or in the previous section, is a bare name here.

## Show the literal value, not a verb for it

Any line that builds a string, URL, query, object, or key, such as `addRedirectTo(url, `/detail/${contentId}`, 'checkoutRedirectTo')`, `JSON.stringify(saved)`, or `build(['action=detail', ...])`.

A verb such as "attached under", "carried onto", "stored under", "wired through", or "threaded into" describes the operation as the writer pictures it and leaves the reader to imagine the result. The reader called "the title's detail page is attached under `checkoutRedirectTo`" unreadable on 2026-10-28. Write the result instead.

- Give one concrete input and the exact output the line produces, on its own code line: "With `contentId=G4PH0WXVJ`, the line turns `/plan-chooser?utm_source=ps5_anime_hub` into `/plan-chooser?utm_source=ps5_anime_hub&checkoutRedirectTo=L2RldGFpbC9HNFBIMFdYVko%3D`, where the last value is `/detail/G4PH0WXVJ` base64-encoded."
- Then say who reads that value later, by name, as `Caller before callee` and `Give every repeated value its owner` require.
- The prose may still name the operation, but only after the literal result is on the page.

## Teach a foreign concept as its own step

Any walked line that depends on a concept from outside the code being walked: an HTTP header, an ETag, a status code such as 304, an axios interceptor, a Redux thunk, a cookie, a cron expression.

A walk that is going well breaks the moment a line leans on such a concept and the walk keeps its pace. The reader of a walk of `response.headers[ETAG_HEADER]` asked afterwards what an ETag header is and why the name was in capitals, and said they stopped reading there; every step after that was lost, including steps that were fine on their own. One undefined foreign term costs the rest of the reply.

- Before the first line that uses the concept, pause the walk and give the concept its own step, with its own intention sentence. Build it in dependency order from things the reader knows: what an HTTP header is (a name and a value sent before the body, in both directions) before what the `etag` header is (a version tag of the file the server sends) before what `If-None-Match` does (the client sends the tag back and asks for a short "unchanged" answer) before what `304 Not Modified` means. Show a real exchange as `Show a real payload` requires: the actual request line and headers, and the actual response status and headers, captured if possible, with one concrete value such as `etag: "5fa57d08…"`.
- Then say which code runs where in that exchange: which function sends the request, which code runs on the response, and only then resume the walk at the line that was waiting.
- A library concept such as an interceptor gets the same treatment: what kind of thing it is (a function the library calls on every request or on every response), who registers it (`instance.interceptors.response.use(fn)` inside `createLrxHttpClient`), when the library calls it, what it receives, and what it must return.
- When a walked line indexes or compares with a named constant, such as `response.headers[ETAG_HEADER]` or `status === NOT_MODIFIED_STATUS`, show the constant's declaration first (`const ETAG_HEADER = 'etag';`) and read the line with the value substituted ("`response.headers['etag']`"). Say once that all-capital names are the convention for module-level constants whose value never changes; the capitals carry no other meaning.
- Do not describe such code as "two small pieces run inside that call" and move on. A sentence that names code without saying what it does is the exact failure.

Wrong: "Two small pieces of the HTTP client run inside that GET. The response interceptor runs `const etag = response.headers[ETAG_HEADER]`."

Right: a step that first shows the real response, `HTTP/2 200` with `etag: "5fa57d08…"`, defines a header and an ETag from that response, then shows `const ETAG_HEADER = 'etag';`, then walks `response.headers['etag']` with the substituted value. (Added 2026-10-26.)

## Restart at the lost sentence and name what it skipped

The reader says a reply lost them, and names or quotes where.

`baby-steps` already says the next reply starts at the exact characters the reader named. Two more things made such a restart work on 2026-10-26, so they are rules now.

- Open by naming the sentence that lost the reader in a few plain words of your own, never by copying it (see `Paraphrase the reader's words`), and listing, in one sentence, the definitions it skipped, in the order the new reply will supply them: "That sentence skipped four things in a row: what a header is, what an ETag is, what an interceptor is, and what the capital-letter name holds. Each gets its own step now." The reader then knows the reply is a repair, not a repeat, and knows what to expect.
- Give each skipped definition its own step with its own intention sentence, and keep every step that the reader said was fine out of the reply except as one recap sentence. Re-sending the good steps buries the repair.

## Plant the fact a later step depends on

Any step that establishes a fact which a later step's branch or bug turns on, such as "a 304 carries no body" when the bug is a client that threw its copy away and then got a 304.

A fact stated in passing is forgotten by the time it matters, and the later step then has to re-derive it, which breaks that step's pace. When the step that establishes the fact is being written, say in one sentence that the fact is the one to hold onto: "Hold onto that: a 304 carries no body, so a client that no longer has its copy gets nothing back." Do not say what conclusion it later supports; `Walk before you conclude` forbids that. In the later step, repeat the fact in the same words instead of pointing back at the earlier step, as `No pointers to labels` requires.

## Walk before you conclude

Any recap, intention sentence, aside, or "one addition" that states a fact the steps have not yet walked: "the interceptor turns a 304 into a thrown error" before that line was walked, "the Katsu helpers are unaffected" before the expiry and the readers were walked, "because that decides whether this bug can hit the Series Page" before the reader has seen the bug.

A reader who is being walked one step at a time reads a conclusion stated ahead of its steps as a claim they have to take on faith, and said so: "I don't like conclusions before we worked through them" and "I'd prefer a natural reading into the bug: first teach me the mechanisms so I understand behavior, and then I can naturally understand it is a bug." A conclusion ahead of its steps also makes the later walk feel like confirmation of something already decided, so the reader skims it and misses the one line that matters.

- A recap contains only facts that a walked line established, stated in the same code words, and when the fact came from an earlier reply, quote the line that established it, such as "`this.cachedFullConfig = result.fullConfig` keeps the whole file". A fact the reader cannot match to a walked line reads as new, and the reader will ask "we covered this?".
- An intention sentence says what the step will show, never what it proves. "My intention with this step is to show which of the three stores this reader reaches" is right; "...because that decides whether the bug can hit the Series Page" is wrong until the bug has been walked.
- Do not call a thing "the bug", "the problem", "unaffected", "safe", or "what it turns on" before the steps that establish it. Walk the mechanisms in order and let the reader see the failure arrive; name it as a bug in the step where the wrong value is produced, not before.
- When confirming a reader's summary, confirm only what they said. Add a missed fact only if it was already walked; a fact not yet walked belongs in its own later step, not in the confirmation.

(Added 2026-10-26 after a reply stated the 304-to-error conversion and "unaffected" ahead of their steps, and the reader rejected the recap and the conclusion.)

## Show the data structures side by side

Any walkthrough in which a value is kept in more than one place: a cache, a map, a field, a store, a cookie, a file.

A reader who has met two or three stores one at a time asks whether they are the same thing: "we have an etags map and also a cache, are they separate?" Prose that introduced each one on its own does not answer that, because the question is about their relation.

- The first time a second store appears, and again whenever a reader asks, list every store in one block with its declaration, its owner, its key, and its real contents at one concrete moment, such as "right after the boot download":

```text
etags            Map in createLrxHttpClient      key: the config URL        value: "5fa57d08…"           expires: never
cache            MemoryCache in Cache.ts         key: 'config:tizen'        value: { data: [flags], timestamp, ttl: 300000 }   expires: 5 min
cachedFullConfig field of ProxyClient            no key                     value: the whole parsed JSON  expires: never
```

- Then say, in one sentence per store, which code writes it and which code reads it, with the real call.
- After that block, every later mention of a store uses its code name, as `Call a value by its code name` requires, so the reader can find it in the block.

## Walk a chain of delegations hop by hop

A value reached through several functions that each do nothing but call the next: a helper that calls `getBooleanFlag`, which calls `resolveFlag`, which calls `readRemoteFlagValue`, which calls `proxyManager.getCachedConfig()`, which calls `client.getCachedConfig()`, which returns a field.

Naming the hops in prose, even with an assurance that they have no interesting branches, loses the reader by the third name, and the sentence at the end ("so it reads `cachedFullConfig`") lands as a claim they did not see. The reader called such a walk "terrible" even though every sentence in it was true.

- Show the hops in one code block, in caller order, each hop reduced to its signature line and the single line that calls the next hop or returns the value, with `// ...` for the rest:

```ts
export function isKatsuDefaultPlaybackTargetEnabled(): boolean {
  return getBooleanFlag('katsuSeriesWatchTarget', false);
}

function getBooleanFlag(flagName: string, defaultValue = false): boolean {
  const value = resolveFlag(flagName);
  // ...
}

function resolveFlag(flagName: string) {
  // ... the localStorage override check
  const remote = readRemoteFlagValue(flagName);
  // ...
}

function readRemoteFlagValue(flagName: string) {
  const meta = proxyManager.getCachedConfig()?.featureFlags?.[flagName];
  // ...
}

// ProxyManager
getCachedConfig() { return this.client?.getCachedConfig() ?? null; }

// ProxyClient
getCachedConfig() { return this.cachedFullConfig; }
```

- Walk it as one chain, one sentence per hop, each sentence naming the call and the value it carries, and end on the store the chain reaches. Then the reader can say which store the chain reads, because they watched the value travel.

## Trim the block to the lines that decide the question

Any block shown while answering a specific question, such as "which store does this reader reach" or "why is the item missing".

`Walk through every code block` requires walking every line shown, and that rule is right; the mistake is showing lines that the question does not need and then dutifully walking them. A reader called a walk of `needsRefresh`, a `mounted` guard, and `applyLocalOverrides` "way too meticulous into details that don't matter", and they were right: none of those values changes which store the reader reaches.

- Before showing a block, ask of each line whether a different value on that line would change the answer to the question. If not, delete the line from the block and replace it with a `// ...` comment that says what the removed lines do, such as `// ... guards and overrides; they do not change which store is read`.
- Keep the signature line, the line that reaches the store or makes the decision, and the `return` that carries the value out. Walk those.
- When the reader later asks about one of the removed lines, show it then, on its own, with its own walk.
- The test is the reader's question, not the function's importance. The same function gets a different trim for a different question.

## A proposal is a walkthrough

A reply that proposes a change, a design, or a fix is a teaching reply, because the reader has to understand the code before they can agree to it, so it keeps the pacing of an explanation. Present one change per reply, show its real lines, walk each line with one concrete value as `Walk through every code block` requires, name the next change in one sentence, and stop. Do not lay out a whole design in one reply as a run of sections that each describe a class's methods in a paragraph; the reader cannot read that once from beginning to end, and a proposal that needs five readings is one the reader will not accept.

When the proposal introduces two things that look alike, such as two getters on one store, the same step says whether one is derived from the other and why both exist, or merges them. A word that names a computed quantity, such as "age", is defined by its expression and one value, `Date.now() - fetchedAt`, which is 3,600,000 after an hour, before the word does any work.

## Everyday infrastructure words are terms

Any word that names a piece of a system and that engineers use without thinking: host, domain, environment, sandbox, staging, backend, frontend, server, endpoint, callback, redirect, parameter, field, body, header, token, refresh token, access token, client id, scope.

`Define the term first` lists libraries, interfaces, headers, and query strings, and the writer applied it to those while treating "host", "test environment", "callback", and "parameter" as plain English. On 2026-10-29 one reply drew a question at each of those four ("what is a host?", "what is a test environment?", "parameter to what?", "what does callback on the backend mean?"), and the reader said every paragraph had a problem. The reader knows these words exist. What they lack is what the word physically is in this flow.

- The first time such a word appears in a reply, define it by what it physically is here, with the concrete value from the flow: "the host is the part of the address between `https://` and the first slash, `account.sp-int.cassia.io`, which names the server that answers the request".
- Say which thing it belongs to: whose server, which request, which body. "The parameter" is wrong; "one field in the body of the `POST /v2/clients/auth_session` request that Crunchyroll's account backend sends to the M-DCIM Backend" is right.
- A credential word (token, code, client id, secret) is defined by three facts: who issues it, who presents it to whom, and how long it lives.
- An environment is defined as a complete second copy of a system, with its own servers, database, hostnames, credentials, and test accounts, run for a stated purpose, with its name and the real system's name side by side.
- A callback or redirect is defined as an address on the receiving party's server, registered in advance, to which the sending party makes the browser go, with the values appended to it shown.
- `Re-introduce names; do not rely on memory` holds for these words too; an earlier reply's definition does not carry.

Wrong: "Its test environment is named `sp-int`. Its pages come from the host `account.sp-int.cassia.io`."

Right: "Sony DX runs a second, complete copy of M-DCIM for developers, with its own servers, database, and test accounts. Such a copy is called an environment, and this one is named `sp-int`. The copy's pages are served from `account.sp-int.cassia.io`. That string is the host: the part of the address between `https://` and the first slash, which names the server that answers."

## Say what the receiver does with each field

Any sentence in which one actor sends another actor a value: an address, a version string, a status, an id.

"The backend sends M-DCIM the URLs of Crunchyroll's terms" tells the reader that a value moved and nothing about why. On 2026-10-29 the reader asked whether Crunchyroll was really sending Sony the addresses of Crunchyroll's own documents, and for what. `Say why each condition exists` covers conditions; a field that crosses a boundary needs the same why.

- For each field sent, say in the same sentence or the next what the receiver does with it and what it could not do without it: "M-DCIM's page turns `sp_tosua_url` into a QR code, because the page is Sony's and holds no copy of Crunchyroll's terms."
- When several fields travel together, give each its own clause. Never write "plus the URLs".
- If the receiver's use is not in the source, say so and name the diagram or document that would hold it.

## Say the usual purpose before a reuse

A mechanism used for a second purpose: a refresh token whose refusal signals changed terms, an error response that carries a list of required agreements, an HTTP 304 used as a cache signal.

A reader who knows the usual purpose reads the reuse as a non sequitur. On 2026-10-29 a reply said a backend "checks the M-DCIM refresh token to learn whether the user must re-accept the Sony account terms", and the reader asked what a refresh token, which gets a new access token, has to do with terms.

- Define the mechanism by its usual purpose first, with its concrete values: the access token that expires after five minutes, the refresh token that outlives it and is used only to get the next access token.
- Then state the reuse as a rule the other party added, and quote the line that makes it work, such as the diagram guard "refresh_token has been expired or ToSUA/PP updated" and the response `error=invalid grant`.
- Then say what the caller cannot tell apart because of the reuse, such as expiry versus changed terms, when the source leaves the two joined.

## Resolve an apparent contradiction at the step that raises it

A step that uses one thing to reach another when an earlier step or reply said the two are different, such as a PSN authorization code that opens a Sony account page after "the PSN account and the Sony account are different accounts".

The reader holds the earlier fact and reads the step as a reversal. On 2026-10-29 the reader asked whether the writer now claimed the same PSN code reaches a Sony consent page. The writer knew the relation, a second code for M-DCIM's own client id, and did not say it where the step raised it.

- At that step, say in one sentence that it looks like a contradiction, restating the earlier fact in the same words.
- Then name the relation under `Name what "same" and "different" refer to`: the one thing that stays fixed (here the console function that issues codes) and the things that vary (the client id and the scope), shown side by side.
- Then say how the receiver turns one into the other, such as "M-DCIM looks up, or creates, the Sony account that belongs to the PSN account the code proves".

## Domain sentence first, code mapping second

Any sentence that describes what the program does.

A sentence whose subject is a code construct, such as "the hook's decision fetches the account while `isLoginStatusSuccessful` is `true`", names neither who acts nor why, and it treats a boolean as a period of time. The reader cannot picture it.

- Write the domain sentence first: who acts, what they do, when, and why, in words the reader already knows. "Right after the login request returns, the sign-in screen asks the server for the full account, because the login answer contains only tokens."
- Then map it to the code in a separate sentence: "In code, the `Account` screen's hook reads `isLoginStatusSuccessful`, and when it is `true` the hook dispatches `updateAccountState()`."
- A boolean is a condition at a moment, not a span of time. Write "when `isLoginStatusSuccessful` becomes `true`" or "if it is `true` at that moment", and say which event made it `true`.

## Write the claim in plain words

Any sentence that makes a claim and is about to be judged: a requirement in a ticket, an error message, a design assertion, a reviewer's comment, an argument's conclusion. Judging it while it is still in its original wording means judging the wording. Restate it first.

The restatement is one short sentence with a subject, a verb and an object, in words a newcomer already knows, with every abstract phrase replaced by the concrete thing it refers to in this context. Then keep that sentence visible and reread it before each judgment about the original, so the judgment is about the claim and not about a word in it.

To get there:

1. Copy the original sentence exactly, for your own use. The copy stays out of the reply when the sentence is the reader's own words (see `Paraphrase the reader's words`).
2. Cross out hedges ("probably", "should", "may") and remember them separately; they come back when the judgment turns on strength.
3. Cross out clauses that only restate background or repeat an earlier sentence, and keep the part that makes the claim.
4. Replace each abstract phrase with the concrete thing it names here. "The ability to warm their flowers" is the heat. "The functions of government" is the jobs. "Idempotent" is "safe to send twice". "The shared parser" is "the parser every platform's bundle includes".
5. Read what is left as one sentence. If a word in it is still abstract, ask what it points to here and write that instead.
6. Check the short form against the original, and add back as a short tag any qualifier the judgment might hinge on ("significantly", "only", "over any distance").

Show the compression being done the first time in a reply or document, one move at a time, so the reader can copy the move. When the original is source material the reader has not seen in full, such as a passage, a ticket, or a board, the moves may quote its pieces; when the original is something the reader typed or pasted, show only the plain-words result. After that, later claims in the same reply can show only the result.

Wrong: judging "philodendrons probably evolved the ability to warm their flowers as a means of attracting these beetles" directly, and getting lost in a choice that mentions heat, beetles and attraction without saying the heat does the attracting.

Right: "The claim, in plain words, is: the heat is for the beetle. Rereading that before the choice: does this choice say anything about the heat doing the attracting? It does not."

The test of a short form is that rereading it makes the next judgment easier. If it does not, the short form is still carrying an abstract word.

## Paraphrase the reader's words

Any sentence the reader typed or pasted into the chat: their own question, a draft they wrote, a colleague's message or a tool's output they pasted, or the sentence they are asking about.

Echoing those words back verbatim, in quotation marks or as a block, breaks the reader's flow. They wrote or pasted the text moments ago, it is often rough or long, and a word-for-word copy makes them read it a second time before the reply says anything new. (Added 2026-10-28 after a reply opened a step by quoting the reader's own pasted sentence word for word, and the reader said it ruined their flow.)

- Restate what they said as one clean sentence in plain words, the same way `Write the claim in plain words` restates a claim, and move on. "Your draft's second question asks whether the app should skip its one-plan screen" replaces a quoted copy of that question.
- This covers every form of echo: quotation marks around their words, a fenced block of their message, "you wrote:" followed by their text, and "that sentence" followed by the sentence. Name what the sentence is about instead.
- When the reply must point at one exact spot in their text, name it by its content in a few words, such as "the line about the three-plan selector", not by copying it.
- Source material still gets quoted where the other rules say so: a line of code read from a file, a sentence of a book passage, an equation, a board's or ticket's text, a captured response. Those are evidence the reader has not necessarily seen. The reader's own words are not evidence; they are the question.
- A pasted draft the reader asks to have corrected or rewritten is returned whole, with the changes made, because then the text itself is the deliverable. Outside that, the paragraphs that discuss the draft paraphrase it.

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

Some words borrowed from offices and buildings describe a relationship without saying which operation creates it. Examples are "hand-off", "hands it", "wire up", "plumbing", "glue", "lives in", "lives under", "sits behind", "sits under", "on top of", "talks to", "flows into", "holds", "carries", and "owns". A reader who does not already know the code cannot turn them back into an operation. These words break the `No analogy` rule more often than any other kind, because they sound technical.

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
- Ordinals and position words used as names are labels too: "the first", "the second", "the third", "the outer one", "the next line". Quote the code, or name the thing by what it is.
- Do not number the arrows or boxes in a diagram, because a number in a diagram invites a pointer to it later. Label an arrow with its real call instead.
- Inline markers such as (1) and (a) are fine for order inside a paragraph, such as the steps of a sequence or a recap, as long as no later sentence refers to an item by its marker. They are never fine directly under a code block or a diagram; see `Inline markers, not bullets` and `Walk through every code block`.
- A heading such as "Step 2: `playerOrchestrator` calls `emit` on `eventBus`" may keep its number, because the words after the number say what the step is. Later text still names the content, never "see step 2".
- Topic numbers, queue positions, step numbers, and reply pointers are labels too: "both come from topic 3", "step 1 put the token on the server", "the second flow", "the earlier reply". The reader does not keep a numbered map of the conversation, and said so. Write the fact: "the row that third-party-oauth wrote when the Tetsuo app sent the link request". (Added 2026-10-29.)
- Repeating the call or fact costs a few words. Making the reader scroll costs their place in the explanation.

## Restate the question before answering it

Any paragraph that resolves something the reader asked earlier: "that answers question 3", "this is the answer to your MySQL confusion", "as you asked".

By the time the answer arrives, the reader has forgotten the question. A pointer such as "that answers question 3" sends them scrolling, and a reader who does not scroll reads the paragraph as a fact with no purpose. The reader said: "I don't remember my question, just restate it in very readable terms and tell me what it answers."

- Open the paragraph with the question itself, in plain words, as a full sentence: "You asked whether the PSN id goes into the same row as the tokens."
- Give the answer in the next sentence, in the same words the question used: "It does, and the link request is the one that writes it."
- Never write "that answers", "this is the answer to", "as you asked", "your question", or a question's number in place of the question. `No pointers to labels` already bans ordinals as names; a question number is one more label.
- When one paragraph resolves two questions, restate each one before its answer, as two short paragraphs.

Wrong: "That row answers question 3. Alex's PSN account id lands in the row's `identity_provider_user_id` column."

Right: "You asked whether the PSN id goes into the same row as the two tokens. It does. Alex's PSN account id lands in the row's `identity_provider_user_id` column, beside the refresh token and the access token."

## Map code to the story in the story's order

Any "mapping to code" or "in code" passage that follows a flow told in plain words.

A mapping written as a prose list of identifiers, "the create request is handled by `onlyCreateNewAccounts`, the link request by `SetTokenByAuthCode`, the trade by `retrieveAccessToken`", reads as four names the reader must hold at once, and the reader said it "doesn't make sense either". The story gave them an order and actors; the mapping threw both away.

- Put the mapping in one code block, in the order the story told the steps, one entry per step. Each entry is the real route or signature line, trimmed, with a comment that repeats the step's plain name and its actor: `// request 1, the create request: the Tetsuo app -> third-party-oauth`.
- Under the block, one sentence per entry, in the same order, naming the file. Not a paragraph that mentions all of them.
- Do not add identifiers the story did not need. A helper the story never mentioned does not appear in the mapping.

## Name what "same" and "different" refer to

Any sentence that uses a comparative word: "same", "different", "other", "another", "each", "both", "the former", "the latter". The same rule covers a quantity word that stands for an unnamed thing: "nothing", "everything", "the rest", "whole", "untouched", "intact".

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

The quantity words fail the same way. "The PlayStation path itself loses nothing" drew "????" from the reader on 2026-10-28, because "nothing" stood for a value the sentence never named. Right: "The detour through `/third-party-auth` does not clear `CheckoutController.redirectTo`, which still holds `/detail/G4PH0WXVJ` when the route comes back to `/checkout`."

## Name the real input

For a deep link or outside event, name the launch arguments or event fields that the code actually reads. Do not invent a delivery channel or application.

## Say if the viewer sees it

When a screen is skipped, explicitly say that the user does not see it. When it appears, say so, next to the diagram if the reader asked for one.

Every step of a flow says what is on the screen at that moment, including "nothing new: the spinner from the previous step is still up" and "Sony's purchase sheet, drawn by the system over our app". A step with no screen statement reads as a screen the reader has to imagine. On 2026-10-28 a step said "the helper replaces the route with `/checkout`" and the reader had to ask whether the account creation before it happened out of sight, and whether checkout has a visible screen; both answers belonged in the step.

## Draw the surface

When the reader has asked for a diagram of a screen or tree, draw a detailed ASCII representation that resembles the actual surface or structure, and avoid a one-line abstraction that omits the relevant behavior. Without that request, describe the surface in prose, naming each visible control and what it does, and offer the diagram as `Diagrams only on request` says.
