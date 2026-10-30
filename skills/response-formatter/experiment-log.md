# Experiment log for the experimental response-formatter

Written by: Claude (Fable 5.1), from Orien's results in the conversation of 2026-10-29.

One entry per teaching reply. The hypothesis is written before the reply is sent. The result is written after the reader's next message. The change to `SKILL.md` is made in the same turn as the result, and the entry names the section and says whether a rule was added, replaced, or deleted. A confirmed rule is logged so that a later session does not delete it.

## 2026-10-29

1. Hypothesis: one `def` per machine (backend, console, M-DCIM) reads as a sequence of the Sony sign-in. Result: refuted. The reader lost the chronology, could not finish the reply, and asked whether the console's page open and M-DCIM's page handler were the same event. Change: section 4.2, replaced "one def per machine" with numbered time-ordered steps tagged by machine; added the page open as two consecutive steps; added store before fetch.

2. Hypothesis: the time-ordered timeline with the page open as two halves lets the reader finish. Result: confirmed; the reader checked the piece off. One stumble: at the server half, the reader first took the browser's request step for the terms page itself, then worked out alone that the server answers with HTML. Change: section 4.2, added that the server half's return comment says the answer is the HTML of the page and that the browser draws it in its own next step.

3. Hypothesis: the banned pointer words in section 5.5 cover references to earlier replies. Result: refuted. A prose sentence named `webview.open` and `handle_page` from a block the reader no longer had on screen and called it "my last block"; the reader said a one-word reference to earlier code is pointless and that the lines must be re-pasted or described. Change: section 5.5, added that an identifier from an unseen block is a pointer and that a reference re-shows the lines or says what they did; section 8 scan line added.

4. Hypothesis (reply on piece 1c, Crunchyroll's account stores): the most likely loss is the single-table shape of DynamoDB, where one table holds items of several kinds told apart by a prefix on the key, because the reader said DynamoDB was unfamiliar in an earlier message. Guard: section 4.3 (kind with descriptor, key, writer, evidence marker) and section 2 (a concept taught inside the sentence that first needs it, with the `DVC#` prefix as the one example from the material). Second risk: three services of one company in one reply breaks "one system per reply"; mitigation is one sentence per service with the asks told as moments in Alex's story, and the tables of only the identity service shown. Result: pending.
