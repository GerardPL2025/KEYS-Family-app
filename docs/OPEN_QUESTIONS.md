# Open questions for Dorcas — Keys Family PRDs

Prepared 19 November 2026. Answers can be added as comments on this doc or passed to Gerard.

## 1. Decision needed now: Projects funding model (blocks Projects and Payments)

The Payments PRD (16 Nov 2026) and the Projects PRD describe project funding differently. Which model should Keys Family use?

| | Option B — Projects PRD (as agreed so far) | Option A — Payments PRD (pledge model) |
|---|---|---|
| How members give | Donations, charged straight away | Pledges: card saved, charged only if the target is reached |
| Target missed | Every donation refunded | Nothing to refund (no card charged) |
| Monthly giving | One-time or monthly subscription | One-off pledges only, no subscriptions |
| Campaign length | Up to 2 extensions of 3 months each | 90 days at most, up to 3 extensions within that |
| Minimum / fees | Not set | £5 minimum; 6% booking fee added on top (all-in price); project gets the full pledge |
| Backing out | — | Withdraw any time before the charge |
| Change of plan | — | Any change to amount, payee or purpose needs every backer to agree again |
| Funded another way | — | Labelled "Funded outside Keys" |

Already agreed either way: donations/pledges go to the family association's Stripe account; invoices are approved by committee vote and paid by the Treasurer from the association's bank account, then marked "Paid" in Keys.

**Answer: A (pledge model) or B (donation model)?**

## 2. Open questions still in the approved Keys Family PRDs

These were left open in the approved PRDs, mostly for design, engineering or security (SD) follow-up. A few may be outdated by later Keys Family decisions and are marked.

## Onboarding

- **ONB-OQ-01** — What problem statement and success targets apply? §1.2, 1.3; Non-blocking Product
- **ONB-OQ-04** — Must the terms checkbox be ticked before any sign-in option works? BR-005, SCR-004; Blocking Product
- **ONB-OQ-05** — Code expiry and resend timer are both 60 s. Intended? What shows on expiry? BR-007, ERR-004; Non-blocking Product
- **ONB-OQ-09** — On a new device or reinstall with an existing account, does language come from the device or the account? BR-001, BR-004; Non-blocking Product
- **ONB-OQ-10** — Invite link format: does it carry the community code, and does it deep link after install? SCR-033, BR-031, §6.2; Blocking Product, Rise Apps
- **ONB-OQ-11** — "Communication Lead" here, "Communications Lead" in CBM. Which goes in GLB? BR-034; Non-blocking Product
- **ONB-OQ-12** — Events uses a 3-mile radius, but ONB-BR-009 stores no coordinates (and uses km). Does Events need location data, and in which unit? BR-009, EVT; Blocking for EVT Product *(Possibly outdated: Events no longer uses any radius, so this may be moot.)*
- **ONB-OQ-13** — Loading, error, offline and empty copy and behaviour for each screen marked Copy TBC in §5.2 §5.2, ERR-016, ERR-017; Blocking Design
- **ONB-OQ-14** — Back behaviour between steps, including after joining or creating §5.4; Blocking Product, Design
- **ONB-OQ-17** — Profile photo from camera, gallery or both? What happens if access is denied, given the photo is required? SCR-031, BR-029; Blocking Product, Design
- **ONB-OQ-18** — Approve or replace the proposed analytics events §7.4; Non-blocking Product
- **ONB-OQ-20** — SD to share its guardrail list with IDs, and Rise Apps to confirm named routes, gen-l10n with ARB files and Firebase Analytics §5.1, §8.3, §8.6; Blocking SD, Rise Apps
- **ONB-OQ-21** — Should the login screen confirm an account exists and show the holder's name to anyone who types the email? BR-006, SCR-008, §8.6; Blocking Product, SD
- **ONB-OQ-22** — Rate limits and lockout for code entry, login and password reset BR-007, BR-008, §8.6; Blocking Product, SD
- **ONB-OQ-23** — Which Logic PRD or GLB should own the shared rules ONB-BR-009, 011, 012 and 034? §4.1; Non-blocking Product
- **ONB-OQ-25** — Is there a minimum age to create an account, and how is it checked? ONB-FL-01, §8.6

## Payment Methods

- **PMT-OQ-17** — Targets for Payment methods adoption; approve analytics events §1.3, §7.4; Normal
- **PMT-OQ-22** — Loading, error (declined card) and offline states for every screen §9; Blocking for G2
- **PMT-OQ-26** — Planned monthly subscription: which saved card is charged, what happens if a payment fails or a user does not pay, whether any users are exempt, and the screens. BR-027; Blocking before the subscription is built

## Profile & Settings

- **PRF-OQ-05** — Scheduled polls can be edited here, but HOM-BR-029 says polls cannot be edited (HOM-OQ-05). Scheduled polls in Tier 2 communities also go to a committee vote. Does an edit restart the vote, and can Post now bypass approval? BR-039, 040; Blocking *(Possibly outdated: Mentions Tier 2; there are no tiers in Keys Family.)*
- **PRF-OQ-06** — Editing a scheduled post shows the audience selector, but live posts cannot change audience (HOM-BR-021), and update audience is fixed after creation (HOM-BR-041). Does that apply only once the post is live? BR-039; Normal
- **PRF-OQ-09** — Name is not editable. How does a member correct a typo or a legal name change? BR-012; Normal
- **PRF-OQ-10** — A profile photo can never be removed, only replaced. Users may expect to be able to remove a personal image (data minimisation). Allow removal back to the default avatar? BR-013; Normal
- **PRF-OQ-11** — The email OTP expires after 60 seconds, which is short for email delivery. Align with ONB's OTP rules? How many attempts and resends are allowed? BR-015; Normal
- **PRF-OQ-12** — Passwords are capped at 15 characters, which is weak (current guidance allows at least 64). Align with ONB's sign-up rules? BR-021; Blocking for G3
- **PRF-OQ-13** — Notifications. BR-027; Blocking - No push preferences are listed. - "Committee news" and "Board announcements" overlap, and events, chats, votes and polls are not covered. - Can users turn off HOM-NTF-001 (all members notified of News)?
- **PRF-OQ-17** — Dark mode is offered, but only Display shows dark frames. Is a dark theme designed for the whole app? BR-033; Blocking for G2
- **PRF-OQ-19** — 2FA: how is it turned off or the method changed? Recovery codes or lost-device recovery? Is it asked at every sign-in? SMS cost and region limits? BR-035; Blocking for G3
- **PRF-OQ-20** — Can a user disconnect their only sign-in method (a social account with no password)? Which providers are supported (Google only in design; source mentions Facebook and Apple)? BR-036; Normal
- **PRF-OQ-21** — The 10-second Undo may be too short for screen-reader users. Keep it, or extend it when accessibility services are on? BR-008; Normal
- **PRF-OQ-22** — Who can see another member's profile: same community only, or anyone with the link? Is bio, community or join date ever hidden? BR-001; Normal
- **PRF-OQ-23** — My Activities counts Feed, News and Poll posts. Do Updates count or appear? BR-010; Normal
- **PRF-OQ-24** — Do members (Feed only) and committee members see different Scheduled Posts views (design has both)? What happens to a member's scheduled News or Updates if they leave the committee? (Leaving the community or deactivating cancels them all, BR-037.) BR-037; Normal
- **PRF-OQ-25** — Missing designs: photo too large, email rejected; loading, error and offline states. §5; Blocking for G2
- **PRF-OQ-26** — Copy fixes: Copy; Normal - "log out of our account" should be "your". - "would be permanently discarded" should be "will be". - "made by them.." has a double full stop. - "neighbors" should be "neighbours". - Remove the stray Russian "Назад". - Replace the "Chairman" label with "Chair". - Bio counter: 200 should be 160.
- **PRF-OQ-27** — No success metrics in the source; analytics events need approval. §1, §7; Normal
- **PRF-OQ-28** — Write the shared list of report reasons used across all features (one list was decided on 4 Nov; the content is not written yet). BR-006; Normal
- **PRF-OQ-29** — Profile link format: users have no usernames. What URL is shared? (ONB-OQ-10) BR-007; Normal
- **PRF-OQ-30** — Is a direct "Delete account" (without the 30-day deactivation) needed for App Store rules, and how does it relate to admin data requests (ADM-BR-024)? BR-023; Normal
- **PRF-OQ-31** — Terms & Conditions page (SCR-064): no design for the page itself, and who supplies the text (legal drafts exist)? BR-020; Blocking for G2

## Home (Feed, News, Polls, Updates)

- **HOM-OQ-05** — Polls cannot be edited, but there are edit-poll designs for scheduled polls (3430:176867), and scheduled posts allow Edit (BR-019). Can a scheduled, not yet live poll be edited? If so, does it need committee approval again? BR-029, 019; Blocking
- **HOM-OQ-06** — Poll option images: what size and file types? BR-030; Normal
- **HOM-OQ-07** — Document file types, and what happens when a link preview fails. (Sizes and video length are set in HOM-BR-007, 008, 014.) BR-007, 008, 009; Blocking for G3
- **HOM-OQ-08** — The source puts scheduled post management here (Profile → Scheduled Posts, Keys Calendar); the estimate gives it to PRF, and Calendar cards to CAL. Confirm PRF owns the list screens and HOM owns the rules. HOM-US-022 says "dedicated calendar", but the body says Profile list and Calendar. BR-018, 019; Normal
- **HOM-OQ-09** — Cancelling the schedule step while editing a scheduled post makes it go live immediately (§6.3). That could publish a post the user meant to keep scheduled. Should it ask first? BR-020; Blocking
- **HOM-OQ-13** — Mute user is fixed at 30 days with Undo. Can users choose a duration (as for chats and updates) or unmute later? BR-022; Normal
- **HOM-OQ-15** — Mentions: is the mentioned person notified? Can people mention members outside the post's audience? BR-010; Normal
- **HOM-OQ-17** — The News empty state shows "Create committee board" when there is no board (3528:87488). This rule is not in the source; confirm it, as in Community Resources. BR-028; Normal
- **HOM-OQ-18** — Report destination: "the admin panel" is not defined anywhere. Who moderates, and what happens to "removed for violating Keys Guidelines" posts? BR-023, 028; Normal
- **HOM-OQ-19** — No design for the shared-comment highlight or the under-30-minutes error. SCR-041, 047; Blocking for G2
- **HOM-OQ-20** — Loading, error, offline and upload-failure states are not designed. §9; Blocking for G2
- **HOM-OQ-21** — Copy fixes: "would be permanently removed", "would no longer see", "would be marked as resolved" (should be "will"); "neighbors" (UK English "neighbours"). Copy; Normal
- **HOM-OQ-22** — Is "Details of the update" required? Is a document's download count shown to everyone? BR-040, 044; Normal
- **HOM-OQ-23** — Two criteria (edit except audience; delete) cover post editing and deletion, but no story does. Add a story? US-001-AC2, AC3; Normal
- **HOM-OQ-24** — Eight stories have no acceptance criteria (US-009, 013, 014, 018, 019, 033, 037, 040). Please supply them. §10; Blocking for G4
- **HOM-OQ-25** — Success metrics: the "verified members" metric is removed (HOM-DCN-17). "Adoption by community admins" uses an undefined role. Analytics approval is also needed. §1.2, §7; Normal

## Audience Management

- **AUD-OQ-12** — News is in scope but has no audience design. Same component as feed? Scope; Normal
- **AUD-OQ-13** — Naming: "All" in the sheet, "Everyone" on the composer chip; poll and update forms show "All members". The sheet title reads "Specify the people who gets to see this post." (grammar). Copy; Normal
- **AUD-OQ-15** — SD guardrails for server-side visibility enforcement §8.6; Blocking
- **AUD-OQ-16** — Success targets and analytics approval §1.2, §7; Normal
- **AUD-OQ-19** — What happens if Filters is chosen with nothing selected, or a member in the audience changes address after posting? §9; Normal
- **AUD-OQ-21** — Redesign the audience frames for All and the Country, City, Town and Street filters (current frames show sub-communities, Radius and Members Only). §5; Blocking for G2

## Community Board Management

- **CBM-OQ-03** — Should a rejected proposal have a cooldown before resubmission? (Source §16) BR-010; Normal
- **CBM-OQ-04** — What are "standard committee member permissions", and what does "manage roles" let the Chair do? BR-005; Blocking
- **CBM-OQ-09** — "Exit" appears as an action on other members when the board has 5 or more. What does exiting someone else mean, and how does it differ from Remove? BR-019; Blocking
- **CBM-OQ-10** — Reason fields: the limit is 500 characters (CBM-BR-025); is there moderation before reasons appear in announcements? BR-025, §8.6; Normal
- **CBM-OQ-11** — Invite links: do they expire, do they carry the community, and what happens when the recipient is in another community? The design includes a link-expired state (3577:677949). BR-020, ERR-008; Normal
- **CBM-OQ-12** — Notification channels and copy for CBM-NTF-001 to 006; are members who are not on the board told about joins and exits? §6.3; Normal
- **CBM-OQ-15** — Loading, empty, error and offline states for every CBM screen §5; Blocking for G2
- **CBM-OQ-17** — Is the board creator the pioneer of the community, or any member? Does creating the board give any authority beyond the chosen role? First part closed 2026-11-18 (CBM-DCN-22): any member can create the board; the second part stays open. BR-006; Normal
- **CBM-OQ-18** — Building and development communities: does each have its own board (ONB-NTF-001 refers to building committees)? BR-001; Blocking *(Possibly outdated: Building/development communities may not apply to Keys Family.)*
- **CBM-OQ-19** — SD guardrail IDs; Rise Apps confirmation of routes, l10n and analytics §8.6; Blocking
- **CBM-OQ-20** — Outcome targets and approval of proposed analytics events §1.3, §7.4; Normal
- **CBM-OQ-22** — Does a proposal cancelled because the member it concerns left the board count toward the three declines that make the Restrict button appear? (Master §16.) BR-031; Normal
- **CBM-OQ-24** — Design follow-ups: no design for the cancellation reason (asked of Adetola on 10 Nov 2026). The design copy still says "Communications Lead" (CBM-DCN-03). BR-031, NTF-009; Blocking for G2
- **CBM-OQ-25** — Design follow-ups for the association's payments: no design for "Set up paid events", the business terms step, the account-state screen, the association Payments screen or the new-representative identity reminder. BR-036 to 038, NTF-010; Normal

## Voting Mechanism

- **VOT-OQ-13** — Notification channel, copy keys, deep-link format, quiet hours and opt-out; is VOT-NTF-002 skipped if a vote closes early? §6; Normal Product
- **VOT-OQ-18** — Loading, empty, error and offline copy for each screen marked Copy TBC in §5.2. §5.2; Blocking for G2 Design
- **VOT-OQ-19** — SD guardrail IDs; Rise Apps to confirm routes, gen-l10n and analytics (as ONB-OQ-20) §5.1, §8.6; Blocking SD, Rise Apps
- **VOT-OQ-21** — Problem evidence, success targets, and approval of the proposed analytics events §1, §7.4; Non-blocking Product
- **VOT-OQ-23** — The No longer applicable status (VOT-BR-011) has no design: colour, vote indicator and where it shows. BR-011, SCR-003; Blocking for G2 Design

## Chat

- **CHT-OQ-21** — Loading, error and offline states and copy for list, conversation, search and profiles. (Failed messages are decided: they are retried automatically when the connection returns and can be deleted, CHT-BR-031, CHT-DCN-41.) BR-031, §9; Blocking for G2
- **CHT-OQ-24** — Success targets and analytics approval §1.2, §7; Normal
- **CHT-OQ-25** — Confirm the Socket.IO event contract for messages, typing, presence and receipts. CHT-API-012; Blocking for G3
- **CHT-OQ-28** — Delete for all (CHT-BR-037) has no design yet; the delete-message dialog in design v1.2 is unchanged (34:173697). Please design both options. BR-037, SCR-037; Blocking for G2

## Events

- **EVT-OQ-25** — No design found for the free "Confirm" sheet and "You're going" success (§9.1). Confirm the frames or design them. SCR-018; Blocking for G2
- **EVT-OQ-26** — Deep-link formats for shared events and tickets; behaviour when the app is not installed. §6.2; Normal
- **EVT-OQ-30** — Success targets; approval of the proposed analytics events. §1.3, §7.4; Normal
- **EVT-OQ-31** — SD guardrail IDs; Rise Apps to confirm routes, gen-l10n, analytics, and the payment provider. §5.1, §8.6; Blocking
- **EVT-OQ-34** — Design gaps: no design for the "event passed to you" notification or the hand-over message; the refund email (old 4031:136584) and the compact Discover variant (4130:292163) are no longer in the file; the My Tickets option behind the ticket button is not specified. Also: the audience sheet designs show options that are not in Keys Family and need a design for everyone or the AUD filters; the four designed emails with no trigger (still_planning, your_event_summary, how_was_rooftop_party, thanks_for_joining_us) need a trigger or removal (moved from EVT-OQ-27). NTF-018, SCR-038; Blocking for G2
- **EVT-OQ-35** — Scanning details still open: offline and camera-permission-denied states. BR-043; Normal

## Calendar

- **CAL-OQ-11** — Which of the two preview frames shows the "today" tag, and how does the preview look for a later day? SCR-001; Normal
- **CAL-OQ-12** — Loading, error and offline states. (Past days are decided: the full calendar can be scrolled back to past days and past items are read-only, CAL-BR-006, CAL-DCN-14.) §9; Blocking for G2
- **CAL-OQ-13** — Colour values: confirm the teal and purple tokens from the design system BR-009; Normal
- **CAL-OQ-14** — Success targets and analytics approval §1.2, §7; Normal

## Community Resources

- **CRS-OQ-09** — "Date created" is the approval date, but in-review folders show a date in the design (3579:835070). BR-011; Normal
- **CRS-OQ-20** — Loading, error, offline and upload-failure states are not designed. §9; Blocking for G2
- **CRS-OQ-21** — Goals, success targets and analytics approval. §1.2, §7; Normal

## Projects (draft, not yet approved)

- **PRJ-OQ-06** — Side panels need a wider layout, but the app is phone-only and no designs exist. Drop them, or show the content as sections on phone?
- **PRJ-OQ-27** — Missing designs: add-deliverable-first modal, board exit blocked, My Deliverables sheet, side panels, Mark invoice Paid, update card after a failed monthly payment, plus loading, error and offline states.
- **PRJ-OQ-29** — No success metrics; analytics events need approval.

## 3. Still to review

- #27 Payments (waiting on the funding-model answer above), #28 Member Exit and Account Deletion, then #16 Admin Panel last.
