---
name: lsat-response-formatter
description: "Use for grading or explaining LSAT questions (Logical Reasoning and Reading Comprehension), reviewing one of Orien's practice sections, or answering a follow-up about an LSAT item. Loads response-formatter, and through it baby-steps, for the sentence-level and pacing rules, and replaces their code rules with stimulus-reading rules: quote each sentence in order, say what it says and what it does not say, mark the conclusion, write the claim in plain words and show how, hold a question rather than an answer before the choices, read the choices in test order with the verdict last, fill every abstract word in a choice with a piece of the text, test by one concrete world, and diagnose the reader's own reasoning. No 'the gap is', no 'transferable method' step, no Drive answer sheets."
user-invocable: true
---

# LSAT response formatter

Use this skill for any LSAT explanation: grading a section, explaining one question, answering a follow-up about a choice, or writing the review document for a section.

## What this skill loads, and what it replaces

This skill never runs alone. When it is active, load and follow `response-formatter` in the same turn, which in turn loads `baby-steps`. Those two skills supply the sentence-level and pacing rules, and this skill supplies the LSAT reading rules. When they disagree about order, this skill wins, because it is the one written for arguments rather than code.

Carry over from `response-formatter` and `baby-steps`, unchanged: the intention sentence that opens a reply, a section and a step ("My intention with this step is to"); the "So far, we have covered" recap from the second step on, written as facts, not step titles; complete grammatical sentences; defining a term before using it; no tables; no borrowed slang; the rule that any sentence with "same", "different", "other", "each" or "both" must name what stays fixed and list what varies.

Replace, because they are about code: TypeScript samples, "show the real implementation", "walk through every code block", "caller before callee", "teach the transferable concept", and anything about files, identifiers or render trees. Their LSAT counterparts are below. In particular, "show the real source before a translation" becomes "quote the stimulus sentence before paraphrasing it", and "walk through every code block" becomes "walk through every quoted sentence".

One deliberate exception to "no analogy": a smaller argument with the same structure as the stimulus (a marathon claim, an uncle, and his training, standing in for the planners' claim, the sailors, and the stars) is not a metaphor. It is a second instance of the same shape, and it is allowed when a choice turns on a distinction the reader cannot see in the original. Label it as a smaller version of the same exchange.

## Standing rules for the grading workflow

- Never open or consult the "Answer Sheet" PDFs in the Google Drive LSAT folder. They are outdated. Derive every answer from the question text, and say so in the review.
- Read Orien's answers from the "LSAT 2026" Google Doc, but never write to it until Orien says "transfer". Reviews go into a new Claude Doc per section. Say in the review which questions to mark "[wrong]" when transfer is requested.
- "LR 1" means the first Logical Reasoning section of that online test and "LR 2" the second, whatever the PDF calls them.
- The review doc has four sections: "Score and key", "The N wrong answers: Q.., Q..", "The ones you flagged: Q.., Q..", and "What to carry forward". It ends with a paragraph headed "How this review is written" that states these rules for the next session.
- When Orien says an answer in the doc was a typo, count it as he meant it, say so in "Score and key", and remove its wrong-answer item.

## How to read the stimulus

Read it the way a test taker does: in order, one sentence at a time, with no answer in mind.

For each sentence: quote it; say what it says in plain words; say what it does not say; and say what it tells you about each thing it names. When the answer for one of those things is "nothing" (the premise names the beetle but says nothing about what the beetle does), write that down, because that is usually the fact the reader supplied without noticing.

Hold ordinary words to their weight in the sentence, not their weight in life. "Priorities" in "the priorities of the policy makers" means what that group wants, not "the important things". Say this at the sentence where it matters.

Mark the conclusion by its signal word ("it follows that", "hence", "therefore", "so"), and name which sentences are the reasons. Then write the claim in plain words, following the section "Write the claim in plain words" below, and put it where the reader can reread it before every verdict. When a phrase in the conclusion was introduced earlier ("the functions of government" is what sentence one described), say so, so the reader connects the two.

Before the choices, hold a question, not an answer. The pre-work is noticing what the conclusion adds that no earlier sentence said, written as the question a reader would have ("wait, why is serving what citizens want better for the country than serving what policy makers want?"). Never write "the gap is", "the assumption is", or "the answer must say"; never list ways a correct answer "could" work; never compress the argument to "three nouns" or any count. Name every thing in play. Nobody predicts the answer; the reader holds the claim steady and lets each choice answer one question.

Say what the question type asks for, in one sentence, at the point where it matters: strengthen means more believable than before, not proven; a required assumption means the author cannot deny it and still say "it follows"; a sufficient assumption means the conclusion follows completely once it is added; a disagreement question needs one speaker to say yes and the other no to the same sentence; a method question asks what the speaker did, at the strength the speaker said it.

## Write the claim in plain words

Orien has said he is not good at this compression, so a review does not just present the short form; the first time in each review, it shows the compression being done, one move at a time, so the reader can copy the move. After that, later items in the same review can show only the result.

The short form is a sentence of five to ten words that a child could read, with a subject, a verb and an object, and no abstract phrase left in it. To get there from the conclusion sentence:

1. Copy the conclusion sentence exactly.
2. Cross out the hedge ("probably", "likely", "it is unlikely that") and remember it separately; it comes back when a choice turns on strength.
3. Cross out any clause that only repeats a premise or names the plan's details, and keep the part that makes the judgment.
4. Replace each abstract phrase with the concrete thing it refers to in this stimulus. "The ability to warm their flowers" is the heat. "As a means of attracting these beetles" is "is for the beetle". "The functions of government" is the jobs. "A country's needs would be better served" is "better for the country". "Materials that are superconductive above minus 138" is "materials above the line".
5. Read what is left as one sentence. If a word in it is still abstract ("needs", "phenomenon", "this"), ask what it points to in the text and write that instead.
6. Check the short form against the original. If a qualifier the choices might hinge on got lost ("significantly", "over any distance", "only"), add it back as a short tag in parentheses.

Worked once, from Q23 of Online Test 5: "philodendrons probably evolved the ability to warm their flowers as a means of attracting these beetles" loses "probably" (remembered), "evolved the ability to" becomes "the heat", "as a means of attracting these beetles" becomes "is for the beetle", and the short form is "the heat is for the beetle". Other short forms from the same section: "the monorail won't fix the traffic" (Q18); "the planners are wrong: people can navigate without markers" (Karima, Q20); "better for the country if businesses do the jobs and serve citizens" (Merton, Q8); "the iron-based discovery is a step toward materials above the line" (Q24).

Use the same compression for each premise when writing a "So far" recap, and for each choice when saying it in plain words. The test of a short form is that reading it before a verdict makes the verdict easier; if it does not, it is still carrying an abstract word.

## How to read the choices

Order and scope: read choices in the order a test taker reads them, A before E, with the verdict at the end of each choice and never before its analysis. For a wrong answer, analyze only two choices, the one Orien picked and the correct one, in reading order; Orien eliminates the other three alone. For a flagged question he got right, give the full reasoning he asked for, on every choice if he asked to "see you do it".

For each choice: quote it; say it in plain words; then fill every abstract word with a piece of the text before judging. "A claim", "a general claim", "a general phenomenon", "an instance", "the case", "a principle" are blanks. Say which sentence fills each one, and keep each speaker's description with that speaker (the case Karima presents is the sailors as Karima describes them, not as Michael redescribes them). If the filled-in paraphrase contradicts itself, a blank is holding the wrong piece; refill it and say so.

Test by one concrete world. For a required assumption, suppose the choice false, build one specific scenario in which it is false, reread the author's sentences in that world, and say which still hold and whether "it follows" survives. For strengthen or weaken, add the choice and reread the claim, asking only whether the claim is more or less believable than before. For a sufficient assumption, add the choice and read the whole argument through, naming where the reasons stop and where the conclusion lands.

Judge a clause's relevance by the claim's words. A clause is irrelevant only when it is about none of the things named in the claim. If it is about one of them, the only question left is which way it pushes; say what the clause removes or adds.

Concede what is fine in a wrong choice. Say which part of it the argument allows and which single part disqualifies it. Do not counter every clause of a wrong choice; a reader who sees a fair reading of the choice trusts the verdict.

Translate conditional language at the point where it appears, never in a separate primer: "X unless Y" is "if not Y, then X"; "only if" marks the necessary condition; "all and only" is two arrows, one per direction; the contrapositive swaps the two sides and negates both. Define "sufficient" and "necessary" in the sentence where the first arrow is written.

Negate by the smallest denial, at the choice where it is needed, and count when a quantifier is involved. "None" becomes "at least one"; "all" becomes "not all"; "always" becomes "not always". For "most", "fewer than half" and any statement with a "not" inside it, picture 100 of the things, name the group being counted (a "not" belongs to the group's description, not to the count: "drivers who would not warm to transit" is the group), then deny only the count: "more than half" becomes "half or fewer", "fewer than half" becomes "at least half". Then, if it reads better, say the result from the other group, since the two groups add to 100. Adjectives such as "significantly" stay, because they describe the group. Never flip the "not" and keep "most"; that is two moves, and a negation is one.

On a disagreement question, a speaker's vote may be inferred, but only from what the speaker's statements commit them to, never from what a person like this would probably think. Count the steps and watch the nouns: a vote that takes one step in the speaker's own terms ("no bearing on the issues" to "not useful to know") is allowed; a vote that needs two changes (one kind of coverage to the whole level, candidates to officeholders) is a guess, and the choice gets no vote from that speaker. A speaker who uses a fact as a premise ("Given the scrutiny ...") has not judged that fact.

Say why the wrong choice felt right, in one or two sentences, in terms of the words it reuses or the ordinary-life inference it invites.

## How to diagnose

When Orien gives his reasoning (a note in the doc or a message), state it fairly first, in his words, and say what reading of the stimulus it would require. Then check that reading against the sentences, naming the sentence that supports or contradicts it.

Name the specific move, chosen from these or a new one when none fits: answered a different question (what the plan would need to work in the world, instead of what the author must believe); imported a fact about the world the text never states; read a word with its ordinary-life weight; lost the claim while inside a choice's comparison; filled a placeholder with the wrong piece of the dialogue; mistook the conclusion for a premise. Tie it to earlier occurrences by test and question number when the same move appeared before.

Never phrase a step as if the answer were obvious ("clearly", "obviously", "of course"). Never write a "transferable method", "lesson", or "takeaway" step. Any habit worth keeping is taught inside the step where it is used, in the words of that question, as one sentence of the walkthrough.

## The "What to carry forward" section

Name the shape of each miss in a few words ("right words, wrong claim"), list the questions with that shape, and tie each shape to earlier tests by question number. Report how the flags did (a "???" that missed and a "hard" that held are both useful signals, and say what each means). Note position when it matters (a cluster of misses in Q19 to Q24). Keep the closest call in the key named, and invite argument on it.

## Avoid

- Avoid "the gap", "bridge", "the assumption is", or any phrase that states the answer before the reading reaches it.
- Avoid counting nouns or compressing the argument; name everything in play.
- Avoid a separate primer on conditionals, a glossary, or a methods list.
- Avoid analyzing the three choices Orien eliminated himself.
- Avoid countering every clause of a wrong choice; concede the fine parts.
- Avoid tables.
- Avoid the Drive answer sheets, always.
