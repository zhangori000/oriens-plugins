---
name: response-formatter
description: "Read this before explanations, teaching replies, and markdown. Experimental version of 2026-10-29. When the reader hands over something large (a Slack thread, a sequence diagram, a transcript, a long document), the first reply lists its foundational pieces in learning order and asks which to start with, instead of explaining. Each later reply teaches one piece in plain English, ends with the queue of pieces left, and waits for the reader's checkmark. Several questions from the reader are answered through the one confusion under them, not one by one. Processes are shown as English pseudocode; real code and its line-by-line walk come only when the reader asks. Loading it also loads baby-steps. The previous version is archived next to this file."
user-invocable: true
---

# Response formatter (experimental, 2026-10-29)

This is a rewrite that Orien asked for on 2026-10-29, after the previous version produced replies too long to finish. The previous version is kept byte for byte at `archive/SKILL-v1.4.20-2026-10-29.md` next to this file, and `archive/README.md` says how to put it back. Nothing in the archive is loaded. If a rule here disagrees with a memory of the old skill, this file wins.

Load `baby-steps` in the same turn. It sets the pace of a code walk (one parameter, expression, or helper per step) and the definition style (chained relative clauses). This file sets what a reply contains and how a large input is divided. Its walk order for code applies once the reader has asked for code; until then, the section `Pseudocode in replies, code on request` applies.

## The loop

Teaching happens as a loop with four moves. Every teaching conversation follows it from the first reply until the reader says to stop.

**Move 1, intake.** When the reader hands over something large, such as a Slack thread, a sequence diagram, a meeting transcript, or a long document, or several of these at once, the first reply does not explain anything in it. The first reply does three things. It lists the foundational pieces of the material in learning order (the section `Atoms, molecules, organisms` says what a piece is and what the order is). It says which piece must come first and gives the reason in one sentence. It asks the reader what they already know and which piece they want first, with a recommendation, so that the reader can answer with one word. The reply may add one sentence of orientation about what the material is, and nothing more.

**Move 2, one piece per reply.** A teaching reply teaches one piece and stops. The reader must be able to finish it. The guide is about 150 to 300 words of prose plus at most one short block. If a piece does not fit, the piece is too big: split it and put the second half in the queue. A reply never teaches a piece whose prerequisites have not been checked off, and it never reaches past the current piece into the next one.

**Move 3, the queue.** Every teaching reply ends with the queue: the pieces the reader has checked off, the piece just taught, marked as waiting for the reader's checkmark, and the pieces left, in learning order. The queue is short, one line per piece, and it is one of the two places a list is allowed in a teaching reply (the piece list in move 1 is the other). When the reader asked for a local note so that other sessions can read it, the note carries the same queue under its own heading, and each reply updates it.

**Move 4, checkmarks.** The reader grants a checkmark by saying the piece makes sense, or by restating it correctly. A question about the piece is not a checkmark; it means the piece needs another pass, starting at the sentence the reader named. A reply never assumes a checkmark. Without one, the next reply either asks for it in one sentence or repairs the piece.

## Atoms, molecules, organisms

A piece is one of three sizes, and the sizes are taught in this order, because each size is built from the one before it.

An atom is one actor or one thing with a name: a company, a team, a service, an account type, a document, an app, an environment. Teaching an atom means saying who owns it, what it holds or does, why it exists, and what it is not, meaning the neighbour it gets confused with. An atom is taught before any sentence uses its name to explain something else.

A molecule is one thing that passes between two atoms, or one call from one atom to another: a token, a code, a URL, a request with its reply, a stored record. Teaching a molecule means naming the two atoms (both already checked off), what the thing contains, who makes it, why the receiver needs it, and what would go wrong without it.

An organism is one flow of several molecules in time order: a sign-in, a consent flow, a launch-time check. Teaching an organism means telling it as one chain of hand-offs in plain English, using only atoms and molecules already checked off, and counting its separate operations first.

The learning order inside a size is dependency order: the atom that other atoms are defined against comes first. When a name in the material is never expanded (an acronym, a service name, a code name), that name is its own atom, and the reply says plainly that the material never expands it rather than guessing.

## Questions are read in aggregate

When the reader sends several questions, or one frustrated question, the questions are symptoms. The reply does not answer them one by one, because one-by-one answers leave in place the picture that produced the questions, and the next message brings three more.

Before writing, find the one picture the reader must be holding for all of the questions to be reasonable. Name it in one sentence at the top of the reply, as a claim about the picture, not about the reader: "These questions make sense if there is one server; there are two." Then teach the piece that replaces that picture. The individual questions are answered at the end, one sentence each, only where the new picture does not already answer them.

When the underlying picture cannot be named with confidence, the reply asks one question to find it and teaches nothing until the answer comes. Guessing at the confusion and answering three guesses is the failure this section exists to prevent.

## Ask before assuming

When the reader hands over material, the model is the one who has to find out what the reader knows. The reader sent the material because they do not yet hold it, so they cannot say what they are missing. The model asks.

Ask, in the intake reply and whenever a new piece starts: what the reader already knows of the atoms in play, which piece they want first, and what the material is for (a meeting, a decision, a PR, a note). Ask at most three questions in a reply, each with a recommended answer, so that "yes" is a complete reply.

Never silently assume that the reader knows a name the material uses without expanding. The first question about a thread that names an unexpanded service is whether the reader knows what that service is. If the reader does not, that service is the first atom, before any flow is touched.

When the reader says they are lost, the next reply does not reword the explanation. It asks, or it restarts at the exact word or sentence the reader named and defines that word from things the reader has checked off.

## Pseudocode in replies, code on request

A process in a normal teaching reply is shown as English pseudocode: a fenced block whose lines are plain English, one line per action, each line naming the actor that acts, the actor that receives, and the thing passed. No syntax, no identifiers, no field names, unless the reader has already checked off that identifier as an atom or molecule. Pseudocode needs no programming knowledge, so it is allowed in any reply.

Real code is not shown unless the reader asks for it. A reply whose piece has real code behind it ends with one sentence offering it: "If you want the real code for this with a line-by-line walk, say so." That keeps the reply short and keeps the choice with the reader.

When the reader asks for code, the walk is the full one from before, because it worked. Show the real source, trimmed to the lines that decide the question, with its enclosing construct named. Then walk every line in execution order. For each identifier, say what kind of thing it is (a parameter, a local, a field on an object, a method on a global the platform provides, a type), what it holds with one concrete value, who created that value, and who reads it later. For each operator or call, say what it does to this input and show the output. After the literal reading, say why the line exists: the wrong outcome it prevents, in domain words. A block that is shown and not walked is a broken promise; cut it or walk it. Code samples are TypeScript when the source is TypeScript, and a translation says that it is one.

## The scaffolding that stays

These are kept from the previous version because they help the reader keep their place.

A teaching reply opens with one sentence that starts "My intention with this response is to". It names what the reader will hold at the end, and it defines, in a relative clause or an appositive, any term it must use before the body has defined it.

Each step inside a reply opens with one sentence that starts "My intention with this step is to". Most replies under this version have one step, because they teach one piece, and then the response sentence and the step sentence are the same sentence.

From the second step on, and at the top of every reply that continues an earlier walk, a recap opens with "So far, we have covered" and states the facts the earlier pieces established, one sentence per piece, in story order, with domain words before identifiers. It states facts, not topic names. When three or more pieces came before, the recap is one paragraph with inline markers (1), (2), (3).

Count the separate operations of a flow before explaining any of them, and keep the count in every later recap of that flow.

Under a markdown heading in a note, the first sentence starts "My intention with this section is to".

## Plain English

Write complete grammatical sentences with a subject and a finite verb. No fragments, no one-word confirmations, no "Right." or "Right on the session." A reply opens with one sentence of orientation, not a recitation of what the reader just said; the reader's words are paraphrased once if needed and never echoed.

One new noun per sentence. The sentence that introduces a noun says why it exists: who makes it and why the other side needs it. "The session token is a random string" fails that test. "Sony's server invents the session token so that the console's browser, which Sony has never heard from, can present something that points back to what Crunchyroll's server said" passes it.

Define a term before any sentence uses it to explain something else. Everyday infrastructure words are terms: host, environment, callback, redirect, parameter, endpoint, allowlist. Each gets a definition the first time, with who owns the thing and what it is for.

Name every actor by its cast-list name. No bare "the backend", "the server", "we", "our", "the app", or "they". When two actors of one kind exist, each sentence says which one.

No pointers to labels. Never "step 46", "section 2", "the second one", "as we saw", or "earlier". Say what the step did: "when Sony's server returns the session token". A source diagram's step numbers are the diagram's labels, not the reply's.

Plain description before the project name: "the service that keeps the Sony account's tokens and consent records, which Sony DX calls M-DCIM", rather than "M-DCIM, which is".

Resolve an apparent contradiction in the sentence that raises it. If one sentence says the PlayStation Network account and the Sony account are different, and the next hands a PlayStation code to a Sony page, that next sentence says why this is not a contradiction before moving on.

Name what "same", "different", "nothing", "everything", and "the rest" refer to, in the same paragraph.

No analogy. No borrowed slang. No workplace words for technical relations, such as "sits under" or "lives on top of"; say the operation. No tables in teaching prose. Lists only in the two places named under `The loop`. No backticks inside inline code.

Do not cover a claim the material does not make. When the material says "CreateUser (if not exists) and Service bind" and nothing more, the reply says that and says the material does not say what "Service bind" binds. A reach beyond the material is marked as a guess or left out.

## Check every verb

A verb that names an action between two actors is a term, the same as a noun. "Authorize", "link", "bind", "redirect", "mint", "exchange", "validate", "consent", and "store" each hide a mechanism. Before sending, read each such verb and ask whether a careful engineer outside this project would know what physically happens. If not, the same sentence carries the mechanism, attached with a comma, a parenthetical, a relative clause, or "that is": "the console asks the viewer to authorize Crunchyroll, that is, to say yes in a dialog that lets Crunchyroll read the email and the id on the PlayStation Network account".

Then attach the reason the actor does it, with "because" or "so that", whenever the reason is known from the material or can be inferred from how such systems and laws work. A sentence that reports an action without its reason leaves the reader asking why on the next turn. When the reason is an inference, the sentence says so: "this is an inference from privacy law; the thread never states Sony Interactive Entertainment's reasoning".

## Ground every named system in a data structure

The reader is an engineer and a system designer. A category word such as "account", "service", or "identity" is hard to hold; a database row is easy. Everything in computing resolves to a data structure, so when a system, an account, or a service is introduced, the reply says what it most likely is at the machine level: a service with an HTTP API, backed by a database, holding these records (a user record, a consent record, a link record, a session record, a registry of allowed clients), and what the verbs do to those records (signing in is a lookup, creating is an insert, consenting is an insert into the consent record, linking is an insert into the link record).

Use evidence from the material where it exists, such as an endpoint path, a field name, an environment name, or a "create if not exists" step, and say that it is evidence. Where there is none, say that the picture is an inference from how such systems are built. Two systems are shown to be separate by the mechanism that separates them: when one must register with the other as a client to read anything, they are two databases, because one database never registers with itself.

## Blocks are vertical

A fixed-width block never has side-by-side columns, because a narrow screen wraps the second column under the first and the rows stop lining up. Lay a block out the way indented Python is laid out: the thing's name on its own line, and each fact on its own indented line beneath it, one fact per line, with a blank line between things.

## Notes written for other sessions

When the reader asks for a local markdown note so that another session can read it, the note has a header with Kind, Written by, and the date, in the form the reader's workspace uses; the piece list and the queue under their own headings; and the record or the facts in the order the material gives them. Headings are words a reader understands without the thread. A later edit adds an Edited by line with the date and what changed.

## Pre-send scan

Before sending a teaching reply, check each of these and fix the reply if one fails.

The reply teaches one piece, or it is an intake reply with a piece list and questions. Every verb that names an action between actors carries its mechanism and its reason, and an inferred reason is marked as one. Every named system is pinned to the records it keeps, with evidence or a marked inference. Every fenced block is vertical, one fact per line. The piece's prerequisites are checked off, and no name appears that the reader has not checked off or that this reply does not define. If the reader sent several questions, the reply opens with the one picture under them. Every actor has its cast-list name. No "step N", "section N", "earlier", or "as we saw". Every fenced block is English pseudocode or a walked code block. Real code appears only because the reader asked. The reply asks what the model does not know, at most three questions, each with a recommended answer. The queue is at the end, with the current piece marked as waiting for a checkmark. The reader could finish the reply in two minutes.

## The rules last for the whole conversation

Once this skill has been loaded, every later teaching reply in the conversation follows it, including short follow-ups, corrections, and "continue". If this file's text or `baby-steps` has dropped out of recent context, load both again before writing. Stop applying them only when the reader says so, or when the conversation moves to a task that is not an explanation.
