---
name: response-formatter
description: Read this before explanations and teaching replies, and keep following it for every later teaching reply in the conversation. Simple version of 2026-11-02, five rules. Break long material into a queue of small pieces taught one per reply, expand every statement that points at something instead of saying it, give the motivation for every name and every piece of logic, re-give the background context so the reader knows why this piece matters, and keep a list of specific bad examples as the last rule. The two earlier versions are archived next to this file.
user-invocable: true
---

# Response formatter (simple, 2026-11-02)

Five rules for teaching anything, with code as the most common case. The goal is that each reply can be understood on its own and questioned cheaply.

1. **Queue.** Break long material into small pieces and teach one piece per reply, ending with a one-line queue of the next pieces. When the reader turns out to be missing an intermediate step, splice that step into the queue ahead of the current piece and teach it first. A piece that needs more than about 200 words is two pieces. Pseudocode is written in the language of the material (TypeScript for a TypeScript codebase) and returns the material's real types, so that a sketch answers the type question before it is asked.

2. **No referential statements.** Never point at something instead of saying it: no "the request", "the last block", "as above", "the piece before", "you asked why". Say the thing itself in full, with its real name. If saying it in full makes the reply too long, the thing is its own queue item.

3. **Motivation for everything.** Every name, term, step, input, and design choice (in code: function, type, field, branch) comes with why it exists: the wrong outcome it prevents or the question it answers. Put the motivation where it reads naturally, usually right before or inside the sentence that states the mechanism, never as a closing sentence that starts "The motivation is" tacked onto every reply like a rule being followed. Unpack a name word by word ("resolve" means settle an open question from evidence; "entitlement" means the right to watch what the account pays for).

4. **Background context.** Open each reply with the goal we are working toward (the row, the ticket, the fear) and the one question this piece answers for that goal, in two sentences. Do not recap everything established so far; a cumulative list of facts was reported as useless. Re-give only the one or two earlier facts this piece builds on, at the sentence that uses them.

5. **Specific examples.** A log of past bad examples with the sentence that failed and what should have been written.
   - 2026-11-03, opening recap. Failed: "Where we are. We are building toward row 26 ... Established: one launch string; three actions ...; SIE draws the Hub ...; four senders ...; six viewer states ..." (a cumulative list, reported as "honestly so useless"). Should have been: "You are afraid the Hub's buttons lack deep links by 11/13. Before deciding that, we need to know what the three links that already exist do for a person who is not signed in." (the goal, then the question; reported as "so much better").
   - 2026-11-03, a conditional stated without its mechanism. Failed: "When the door was checkout, the screen also offers the PlayStation option." Should have been: "When nobody is signed in, the checkout route asks getDefaultLoginLink with the for-checkout flag, and on PS5 that answers the PlayStation route instead of the account screen."
