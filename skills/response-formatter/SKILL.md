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

4. **Background context.** Open each reply with two or three sentences on the story we are in (the ticket, the bug, the goal), what has been established so far in concrete words, and which question this reply answers, so the reader knows why we are talking about this.

5. **Specific examples.** A log of past bad examples with the sentence that failed and what should have been written. This rule stays last because it holds the most text.
   - Failed: "A series panel shows panel.title. The series metadata has no title field." (outcome bullets about a function whose inputs, `metadata` and `item`, were never defined). Should have been: define each input first (what it is, which package its type comes from, who built it), then walk the function line by line.

   - Failed: the analytics-hook reply showed `mediaId: item?.id`, `mediaType: item.type` and explained them before saying why they mattered; the reader asked "what is the point of telling me all this?". Should have been: first sentence states the claim the code proves ("analytics reads the raw panel, so Katsu cards must never replace it"), then show only the line that proves it.
