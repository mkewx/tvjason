**Approved preproduction design**

Atari 2600 and Atari Video Computer System

Single player strategic acquisition and arcade defense

NTSC primary with required PAL build

32K stock-compatible F4 bankswitched cartridge

Standalone companion project to NORAD 84 for Commodore 64

**Core directive**

> Make the emergency understandable, make the defense skillful, and let
> the Atari 2600 define the visual language.

# Contents

> 1 Document Purpose
>
> 2 High Concept
>
> 3 The Player Fantasy
>
> 4 Design North Stars
>
> 5 Project Pledges
>
> 6 Inspirations and Boundaries
>
> 7 Story and Presentation
>
> 8 Complete Game Loop
>
> 9 National Warning Display
>
> 10 Air Defense Engagement
>
> 11 Maritime Defense Engagement
>
> 12 Regional Content System
>
> 13 Campaign Structure
>
> 14 Difficulty Modes
>
> 15 Scoring
>
> 16 Damage and Persistence
>
> 17 Controls and Interaction Rules
>
> 18 Visual Direction
>
> 19 Audio Direction
>
> 20 Technical Direction
>
> 21 Accessibility Specification
>
> 22 Content Matrix
>
> 23 Development Plan and Gates
>
> 24 First Playable Prototype Specification
>
> 25 Test Scenarios
>
> 26 Risk Register
>
> 27 Deliberate Exclusions
>
> 28 Relationship to NORAD 84 for Commodore 64
>
> 29 Definition of Done
>
> 30 Final Creative Direction
>
> Appendix A Developer Start Checklist
>
> Appendix B Reference Materials

# 1 Document Purpose

This document defines a complete, focused Atari 2600 game called **NORAD
84**. It is written to let a developer begin prototyping without having
to invent the core game, visual language, control scheme, progression,
or technical target.

The project is not a literal port of the Commodore 64 game and is not a
replacement for it. The two games are separate productions that share a
fictional premise, aesthetic ideals, and a deliberate exchange of design
lessons. The Atari version concentrates the larger NORAD fantasy into
two equally important arcade defense systems connected by a national
warning map. Its restrictions are part of the design.

The central decision is final:

> *NORAD 84 on Atari 2600 is a defense-only game in which the player
> acquires incoming contacts on a national command display, then
> resolves each threat through either an air-defense engagement inspired
> by Missile Command or a maritime-defense engagement inspired by Pong.*

The game must feel understandable within seconds, tense within one
minute, and worth replaying after both victory and defeat.

# 2 High Concept

An obsolete 1984 national defense cartridge has come online. Its warning
computer, ARGUS, is receiving apparently genuine attack telemetry. The
player is placed in control of the last functioning defensive terminal.

The national display shows the United States as a dark geographic
silhouette carved out of bands of phosphor amber. Bright contacts
approach defended sites at different speeds. The player moves an
acquisition reticle, chooses the most urgent contact, and presses the
button to enter a local engagement.

Airborne contacts lead to regional missile-defense screens. The player
places interceptor bursts in the paths of descending weapons and
protects the terrain below.

Maritime contacts lead to underwater defense screens. The player moves a
vertical defense craft or barrier through the water column and activates
a short-range interception field to stop torpedoes before they cross the
coastal defense line.

Meanwhile, unresolved contacts continue advancing at reduced strategic
speed. Quick, accurate local play creates time to handle the next
emergency. Slow or failed play allows pressure to accumulate. The
campaign ends in national survival, damaged survival, or catastrophe.

# 3 The Player Fantasy

The player should feel that they have discovered a cartridge or terminal
program that was never meant for public use. It is austere, old, and
alarming, but it is never deliberately confusing.

The player is not a general issuing broad political orders. The player
is the human judgment and reflex component inside an automated defense
network. ARGUS detects and classifies. The player decides what to engage
first and performs the actual defense.

The fantasy rests on four sensations:

> 1\. **I can see the whole emergency.** The national map makes the
> country, defended sites, and incoming contacts readable at a glance.
>
> 2\. **My priority matters.** Choosing one contact means allowing
> others to continue moving.
>
> 3\. **My skill matters.** Local defense is not an automatic percentage
> calculation. Timing and positioning determine survival.
>
> 4\. **The system remembers consequences.** Damage, lost sites, DEFCON,
> remaining sessions, and score change because of what the player did.

# 4 Design North Stars

Every feature, visual effect, and technical compromise must be judged
against these rules.

## 4.1 Accessibility before density

The game must communicate its current problem before it asks for an
answer. The most urgent threat, the player-controlled object, the
defended target, and the immediate consequence of failure must be
visually unmistakable.

## 4.2 Fun before simulation

The game borrows the emotional language of a strategic defense system,
but it is an arcade game. It should create meaningful choices and
pressure without asking the player to interpret a spreadsheet or
memorize military terminology.

## 4.3 Defense only

The player never selects enemy cities, launches retaliatory nuclear
weapons, or wins through destruction abroad. All actions protect the
United States, its population, its bases, its coastal waters, and its
command network.

## 4.4 One joystick and one button must be enough

No essential action depends on an undocumented console-switch trick,
button chord, long press, or ambiguous mode. The same mental grammar
applies throughout the game: move to align, press to commit.

## 4.5 Geography must be recognizable

The United States is a game object, not decorative noise. A player
viewing the national display from normal television distance should
recognize the mainland quickly. Alaska, Hawaii, and Puerto Rico are
represented by clear inset indicators rather than false geographic
scale.

## 4.6 Water defense and air defense are equal pillars

The maritime game is not a rare bonus round. It receives its own threat
class, escalation curve, terrain families, scoring, audio language,
failure consequences, and campaign requirements. A complete campaign
deliberately alternates and combines air and maritime crises.

## 4.7 The hardware should inspire the look

The game should exploit playfield rewriting, horizontal color bands,
luminance changes, sprite reuse, missiles, the ball object, controlled
flicker, scanline timing, and the two TIA sound channels. It should not
imitate a framebuffer badly. The target is a visual language that could
only have been created by someone who understood the Atari 2600.

## 4.8 Difficulty must come from pressure rather than obscurity

Faster threats, overlapping priorities, limited ammunition, shorter
interception windows, environmental motion, and accumulated damage are
fair. Unclear symbols, invisible rules, sluggish controls, and
surprising mode changes are not.

## 4.9 Every input receives feedback

A successful lock, failed lock, launch, empty battery, active maritime
field, exhausted field, interception, impact, and screen transition each
receive distinct visual and audio acknowledgment.

## 4.10 The game must be replayable and winnable

The standard campaign has a finite ending. Victory should be difficult
but realistic. A perfect defense is a separate mastery goal. Randomized
waves and score play continue to provide value after the campaign has
been completed.

# 5 Project Pledges

The production commits to the following promises.

-   The first playable prototype will prove the complete loop rather
    than merely display an attractive map.

-   The project will be tested on a CRT or representative composite
    display, not judged only from enlarged emulator pixels.

-   Cursor movement will feel immediate and responsive from the first
    prototype.

-   No unreadable strategic display will be defended as period
    authenticity.

-   No local weapon will bend toward a target after a visible miss.
    Collision results must agree with what the player sees.

-   Explosions will be functional collision volumes as well as visual
    effects.

-   No important threat type will be represented only by a color
    difference.

-   New content will be created by combining approved terrain families,
    weather layers, target arrangements, and attack tables rather than
    by adding unrelated mechanics.

-   The final cartridge will run on an unmodified stock console using
    conventional bankswitching and no ARM or other computational
    coprocessor.

-   PAL support will be designed from the beginning rather than
    attempted after the NTSC game is complete.

-   The Atari and Commodore 64 projects will remain independently
    buildable and independently finishable.

# 6 Inspirations and Boundaries

## 6.1 Computer War

The strongest structural inspiration is Thorn EMI\'s 1983 **Computer
War**. Its useful lesson is the rhythm of national observation, cursor
acquisition, a focused action sequence, return to the national map, and
escalating DEFCON pressure.

NORAD 84 does not reproduce Computer War\'s code-matching puzzle,
first-person interception sequence, missile-base shutdown objective,
screen composition, artwork, text, or scenario rules. It uses the
broader design principle of moving between a strategic warning display
and short arcade encounters.

## 6.2 Missile Command

Missile Command supplies the air-defense vocabulary: incoming
trajectories, a movable aim point, limited defensive launches, expanding
interception bursts, exposed targets, chain reactions, and visible
consequences.

NORAD 84 must develop its own terrain, projectile behavior, scoring,
wave structure, and interface. It is not a level-for-level or
rule-for-rule copy.

## 6.3 Pong

Pong supplies the maritime game\'s immediate spatial grammar: a threat
approaches across the screen, the player aligns vertically, and contact
at the defense line decides the result. NORAD 84 adds timing, an
activatable interception field, multiple torpedo behaviors,
environmental motion, limited energy, and campaign consequences.

## 6.4 WarGames

The 1983 film supplies mood: command-center diagrams, glowing
trajectories, ominous computer sounds, clinical escalation, and the
unsettling possibility that a simulation has become real. The game must
not copy dialogue, proprietary artwork, character likenesses, or exact
screen layouts.

## 6.5 Coleco WarGames

The Coleco design provides four accessibility standards:

-   The whole defended country can be understood quickly.

-   Sector or target danger is always obvious.

-   A timer and DEFCON produce understandable pressure.

-   Cities, bases, enemies, and defenses use unmistakable symbols.

## 6.6 Asteroids and classic Atari design

Asteroids reinforces the value of simple controls, high-contrast
geometry, immediate movement, and rules learned through response rather
than prose. Classic Atari 2600 games reinforce the discipline of making
every object and sound perform several jobs.

## 6.7 Commercial and legal boundary

All code, maps, sounds, stage data, iconography, prose, and packaging
must be original. Historical and geographic facts may be researched, but
no screenshot should be traced and no protected layout should be
reproduced. Title, trademark, and packaging review must occur before
commercial release.

# 7 Story and Presentation

## 7.1 Premise

ARGUS is the **Automated Response and Global Understanding System**, a
fictional 1984 warning network. A dormant Atari-compatible diagnostic
terminal has established a link and begun receiving crisis data. Whether
the incident is a simulation, a malfunction, or a genuine attack remains
uncertain during play.

The Atari version implies this story rather than explaining it in
paragraphs. The manual may provide the full setup. The cartridge
communicates through a title sequence, warning tones, DEFCON changes,
and the cold behavior of the displays.

## 7.2 ARGUS on Atari 2600

ARGUS is not a conversational text character in this version. Its
presence is expressed through:

-   A short boot pattern and identification tone.

-   The ARGUS shield or eye glyph.

-   Automatic threat classification through shape and sound.

-   Changes in alert cadence.

-   Clinical transitions after success or failure.

-   A restrained final judgment represented by sound, color, and a small
    number of words or symbols.

## 7.3 Title sequence

The title screen displays **NORAD 84**, the ARGUS glyph, and a pulsing
DEFCON ladder. A low two-channel motif establishes tension. After a
short interval, the screen cycles into a pictorial control
demonstration:

> 1\. A contact moves.
>
> 2\. A reticle moves over it.
>
> 3\. The fire glyph flashes.
>
> 4\. The display changes to an air or maritime defense scene.

Pressing Fire begins the selected game. The demonstration must be
skippable immediately.

# 8 Complete Game Loop

The standard game follows this sequence.

> 1\. The cartridge boots to the title and control demonstration.
>
> 2\. The player uses Select to choose Training, Standard, or Crisis.
>
> 3\. Reset or Fire starts the campaign.
>
> 4\. The national display presents defended sites and incoming
> contacts.
>
> 5\. Contacts move toward targets at different rates.
>
> 6\. The player moves the acquisition reticle to a contact.
>
> 7\. Fire attempts a lock.
>
> 8\. A failed lock wastes time and produces a rejection cue.
>
> 9\. A successful lock opens the appropriate local defense system.
>
> 10\. Air contacts open an air-defense engagement.
>
> 11\. Maritime contacts open a maritime-defense engagement.
>
> 12\. Unselected national contacts continue advancing at one-quarter
> strategic speed while the local engagement runs.
>
> 13\. The local engagement ends when all attackers are resolved, the
> defended site is destroyed, or the emergency timer expires.
>
> 14\. The national display returns with updated positions, damage,
> score, DEFCON, and campaign progress.
>
> 15\. After four resolved contacts, the DEFCON stage advances and a
> short accounting screen appears.
>
> 16\. After twenty resolved contacts, the campaign ends.
>
> 17\. The outcome screen reports perfect defense, national survival,
> damaged survival, or catastrophe.

The loop should take approximately 10 to 15 minutes in Standard mode.

# 9 National Warning Display

## 9.1 Purpose

The national screen is where the player makes strategic choices. It must
answer five questions without explanation:

-   Where are the threats?

-   Which one will arrive first?

-   What type is each threat?

-   What is each threat approaching?

-   Which object do I control?

## 9.2 Chosen map method

The approved map is a **negative-space terrain map**.

The continental United States appears as a predominantly black shape.
Low- and medium-luminance amber playfield bands define the ocean,
Canada, Mexico, and peripheral command-display structure around it.
Brighter coastline segments emphasize the Pacific, Gulf, Atlantic, Great
Lakes, and selected borders where recognition requires them.

The map is not drawn as a thin continuous vector outline. It creates a
vector-terminal impression through hard geographic edges, bright
coastline accents, moving luminous contacts, the reticle, and sparse
target symbols. This choice gives geographic mass to the country and
uses the TIA playfield naturally.

The display kernel may rewrite the playfield within scanlines and
between bands to avoid a mirrored blob. The exact register schedule is
an implementation concern, but the visual result is mandatory: a
recognizable, asymmetrical mainland silhouette.

## 9.3 Alaska Hawaii and Puerto Rico

The three outlying regions are included as fixed inset indicators:

-   Alaska sits in the upper-left auxiliary area.

-   Hawaii sits in the lower-left auxiliary area.

-   Puerto Rico sits in the lower-right auxiliary area.

They are not represented at geographic scale. Each uses a tiny
silhouette or region glyph plus a target light. An incoming contact can
target any of the three. When an inset is under threat, its border
pulses so the player cannot confuse it with decorative status
information.

## 9.4 Defended sites

Twelve defended-site records exist. Eight are selected for each Standard
campaign, with at least one maritime site and one outlying territory
always present.

The site roster is:

> 1\. Pacific Northwest
>
> 2\. Southern California
>
> 3\. Rocky Mountain Command and NORAD
>
> 4\. Central Plains
>
> 5\. Great Lakes
>
> 6\. Northeast Corridor
>
> 7\. National Capital Region
>
> 8\. Gulf Coast
>
> 9\. South Florida
>
> 10\. Alaska
>
> 11\. Hawaii
>
> 12\. Puerto Rico

The national map uses nodes, not city names. The manual names
representative cities and installations. Local terrain and landmarks
provide regional identity.

NORAD is always active and is always a critical target. Its destruction
ends the campaign.

## 9.5 Contact classes

Only two primary contact classes appear in the first complete release.

**Air contact:** A bright point with a short alternating tail. It moves
inward from the national perimeter toward a land target. A
higher-pitched repeating tone identifies it.

**Maritime contact:** A paired or horizontally segmented point moving
along an ocean corridor toward a coastal, island, or naval target. A
lower double-pulse identifies it.

Color reinforces class but never defines it by itself.

## 9.6 Contact motion and urgency

Each contact has a destination, position, speed, class, threat strength,
and time-to-impact value. The player does not need to read a numeric
ETA.

Urgency is shown through:

-   Distance remaining.

-   Pulse rate.

-   Tail cadence.

-   Target-node flashing.

-   A five-step next-impact meter at the edge of the display.

-   An accelerating warning tone for the nearest impact.

The most urgent contact receives a subtle double-flash, but ARGUS never
selects it for the player.

## 9.7 Acquisition reticle

The reticle is large, hollow, and visually different from every threat.
It accelerates quickly to a capped speed and stops immediately when the
joystick returns to center.

Fire succeeds only when the contact is inside the inner lock area. The
permitted radius is visible. There is no magnetic drift and no hidden
correction.

A successful lock freezes the selected contact, flashes the destination,
plays the lock tone, and changes screens. A failed lock inverts the
reticle briefly and plays a low buzz while all contacts continue moving.

## 9.8 Strategic time during local play

Other contacts continue at exactly 25 percent of national-screen speed
while the player is in a local engagement. Their positions are updated
mathematically rather than rendered.

The local screen displays a three-pip strategic warning meter:

-   Three pips: no unresolved contact is near impact.

-   Two pips: another contact has entered its warning window.

-   One flashing pip: another impact is imminent.

This preserves urgency without asking the player to monitor two
playfields at once.

# 10 Air Defense Engagement

## 10.1 Purpose

The air game is about predicting paths, placing defensive bursts,
conserving limited shots, and protecting regional targets.

## 10.2 Screen structure

Each screen contains:

-   A dark sky occupying most of the playfield.

-   A region-specific terrain silhouette at the bottom.

-   Three to six defended target structures.

-   One to three interceptor batteries represented by a shared
    ammunition reserve.

-   Descending hostile trajectories.

-   A movable aim reticle.

-   A small ammunition meter.

-   The three-pip strategic warning meter.

## 10.3 Controls

-   Joystick: Move the aim reticle in eight directions.

-   Fire: Launch one interceptor toward the reticle.

-   No essential air-defense action uses Select or Reset.

## 10.4 Interceptor behavior

An interceptor travels visibly from the nearest available battery toward
the selected point. It does not home toward a hostile weapon. On
reaching the point, it creates an expanding circular or stepped-radial
blast.

The blast has three phases:

> 1\. Expansion with active collision.
>
> 2\. Brief maximum radius with active collision.
>
> 3\. Contraction with reduced collision.

A hostile weapon is destroyed only if its visible collision point
overlaps the active blast. The result must match the image. The
collision radius may be one or two pixels more forgiving than the
visible core, but never large enough to make a clear miss succeed.

Destroying one hostile can begin a smaller secondary burst. Chain
reactions are encouraged because they reward planning and conserve
ammunition.

## 10.5 Ammunition

Each engagement begins with twelve interceptor shots in Training, ten in
Standard, and eight in Crisis. The reserve is shared across batteries.
Destroyed batteries reduce the remaining launch positions but do not
erase ammunition already fired.

The player cannot fire when the reserve is empty. An empty click and a
brief ammunition-meter inversion provide feedback.

## 10.6 Air threats

The first release uses three air behaviors built from the same object
system.

**Ballistic:** Predictable diagonal or arcing route. Medium speed. The
introductory threat.

**Splitting:** Divides into two warheads at a defined altitude. A high
interception can prevent the split.

**Low approach:** Enters from a side at a shallow angle and provides
less reaction time. It never uses an invisible or unfair trajectory.

Threat shape, motion, and entry sound distinguish the three behaviors.

## 10.7 Air success and failure

An engagement succeeds when every hostile object has been destroyed or
has resolved.

Individual impacts can:

-   Destroy a noncritical structure.

-   Disable one battery for the remainder of the campaign stage.

-   Damage the defended site.

-   Destroy the site if its damage capacity is exhausted.

Every impact creates a large expanding flash followed by a reduced or
missing structure. A successful interception creates a smaller, sharper
burst. Text is not required to understand the difference.

# 11 Maritime Defense Engagement

## 11.1 Purpose

The maritime game is a complete second discipline. It tests vertical
alignment, anticipation, restraint, and rapid recovery rather than point
placement.

## 11.2 Fictional logic

Maritime contacts are not airborne missiles that magically become
torpedoes. They are identified on the national screen as submerged
launch vehicles, torpedoes, or sea-skimming threats approaching a
coastal, island, submarine, or naval target.

An airborne contact acquired over the ocean still opens the air-defense
game. Contact class---not acquisition location---determines the local
system.

## 11.3 Screen structure

The maritime display is a side-on water column:

-   A narrow sky band sits above the waterline.

-   The water uses horizontal blue-black, brown-orange, or amber
    luminance bands according to the selected palette.

-   A seabed or harbor floor defines the bottom.

-   The defended coast, ship, submarine pen, sonar station, or undersea
    cable terminus sits on the right.

-   Torpedoes enter from the left and travel right.

-   The player\'s defense craft moves vertically near the right side.

-   A short-lived interception field appears when Fire is pressed.

-   An energy meter and the strategic warning pips remain visible.

## 11.4 Controls

-   Joystick Up and Down: Move the defense craft through the water
    column.

-   Joystick Left and Right: Apply a small trim to the interception
    field\'s horizontal reach.

-   Fire: Activate the interception field for a short pulse.

The craft\'s vertical movement is fast and direct. It never drifts after
the joystick is released.

## 11.5 Interception field

The field is the maritime equivalent of the Pong paddle, but it is
active only during a deliberate pulse.

Pressing Fire produces a bright vertical or oval field in front of the
craft for a fixed number of frames. A torpedo crossing the active field
is destroyed. Contact with the inactive craft does not count as a
defense and damages the craft\'s energy reserve.

Each pulse consumes energy. Energy begins recharging after a short
delay. Holding Fire cannot create permanent protection; the system emits
separated pulses at a costly rate. Skilled play aligns first and
activates late.

## 11.6 Maritime threats

**Straight torpedo:** Travels at a constant depth and speed. It teaches
alignment.

**Drifting torpedo:** Moves gradually between depth bands. Its motion is
visible and predictable.

**Fast pair:** Two torpedoes approach at separated depths with a short
interval. The player must reposition rapidly.

**Sea-skimmer:** Travels near the waterline and may require the field\'s
horizontal trim. It is introduced only after the standard torpedo rules
are established.

No projectile changes direction without a visible cue.

## 11.7 Maritime environments

The maritime system uses four authored environment families:

> 1\. Open Pacific approach
>
> 2\. Atlantic shelf
>
> 3\. Gulf and Caribbean shallows
>
> 4\. Arctic and North Pacific water

Environment modifies presentation and mild path behavior:

-   Open Pacific uses deep bands and long approaches.

-   Atlantic shelf uses a rising seabed that compresses lower lanes.

-   Gulf and Caribbean stages use shallow water and faster surface
    threats.

-   Arctic stages use ice silhouettes, muted luminance, and slower but
    less visible drifting threats.

Weather and currents may change appearance and predictable route
curvature. They must never hide a threat or invalidate the core
alignment rule.

## 11.8 Maritime success and failure

Each maritime engagement contains three to ten threats depending on
DEFCON and mode. Up to three torpedoes may be active simultaneously if
their vertical separation remains readable.

A small number of misses damages the defended asset. Standard mode
permits two noncritical penetrations in most stages; the third destroys
the asset. Some critical late-game stages allow only one.

Maritime engagements contribute the same base score and campaign
importance as air engagements. At least eight of the twenty Standard
campaign sessions are maritime. Procedural selection must never generate
more than three consecutive sessions of the same class.

# 12 Regional Content System

## 12.1 Content construction rule

Stages are assembled from approved components:

**Region family + terrain profile + target layout + weather layer +
attack table + palette variant**

This allows visual variety without requiring a separately programmed
kernel for every location.

## 12.2 Air terrain families

> 1\. **Atlantic metropolis:** Low coastline, dense skyline, harbor or
> island landmark.
>
> 2\. **Pacific metropolis:** Coastal ridge, layered skyline, offshore
> approach.
>
> 3\. **Great Lakes industrial:** Water edge, factory stacks, radar
> structures.
>
> 4\. **Gulf installation:** Flat coastline, refinery or launch complex
> silhouettes.
>
> 5\. **Mountain command:** High terrain, hardened command structure,
> radar dome.
>
> 6\. **Central plains:** Low horizon, missile field, widely spaced
> targets.
>
> 7\. **Northern radar:** Snow or ice bands, sparse structures, large
> radar target.
>
> 8\. **Island defense:** Narrow landmass, naval installation, limited
> target spacing.

## 12.3 Weather and atmosphere layers

Weather is an authored overlay or color schedule, not a full simulation.

-   Clear night

-   Rain bands

-   Snow bands

-   Coastal fog pulses

-   Desert haze

-   Electrical storm flashes

-   Rough sea

-   Arctic water

Weather may affect threat visibility slightly or alter speed by a small,
documented amount at higher difficulty. It cannot obscure the player
object, hide collision boundaries, or cause random failure.

## 12.4 Stage identity

A location should feel distinct through silhouette and arrangement
rather than a printed name. Representative landmarks must remain generic
enough to avoid clutter. The manual can identify the regions and
describe which targets are present.

# 13 Campaign Structure

## 13.1 Standard campaign

The Standard campaign contains twenty resolved contact sessions
organized into five DEFCON stages of four sessions each.

-   DEFCON 5: Four introductory sessions; one contact at a time; both
    defense systems introduced.

-   DEFCON 4: Multiple national contacts and first two-threat local
    patterns.

-   DEFCON 3: Faster acquisition pressure, splitting air threats,
    drifting torpedoes.

-   DEFCON 2: Damaged defenses persist, multiple simultaneous local
    threats, shorter warning windows.

-   DEFCON 1: Four final crisis sessions drawn from the hardest fair
    patterns.

At least eight sessions are maritime and at least eight are air. The
remaining four are selected from either class while preventing long
repetitions.

## 13.2 Victory conditions

The campaign is won after the twentieth session if:

-   NORAD survives.

-   At least six of the eight active defended sites survive.

-   The national damage meter has not reached catastrophe.

## 13.3 Outcome tiers

**Perfect Defense:** Every national contact was acquired, every local
threat was destroyed, and no target took damage.

**National Survival:** The victory conditions are met with no more than
one lost site.

**Damaged Survival:** The victory conditions are met with two lost sites
or severe infrastructure damage.

**Catastrophe:** NORAD is destroyed, fewer than six active sites
survive, or the national damage meter fills.

## 13.4 Endless continuation

After a victory, the player may press Fire to enter an optional endless
emergency using the completed campaign state. Speed and density increase
gradually. The finite victory remains recorded on the outcome screen
before endless play begins.

# 14 Difficulty Modes

Select cycles three modes on the title screen. A large one-, two-, or
three-bar symbol identifies the selection.

## 14.1 Training

-   Twelve campaign sessions.

-   Slower strategic contacts.

-   One national contact at a time through DEFCON 4.

-   Twelve air interceptors.

-   Faster maritime energy recharge.

-   More durable defended sites.

-   Short pictorial demonstrations precede the first air and water
    engagements.

## 14.2 Standard

-   Twenty sessions.

-   Full strategic time pressure.

-   Ten air interceptors per engagement.

-   Standard maritime recharge.

-   Full outcome tiers.

## 14.3 Crisis

-   Twenty-four sessions.

-   Faster national contacts.

-   Eight air interceptors.

-   Slower maritime recharge.

-   Earlier advanced threats.

-   Greater score multiplier.

-   No pictorial demonstrations.

Difficulty changes several pressures together but never changes the
meaning of controls or collision.

# 15 Scoring

Score is secondary to survival but supports replay.

## 15.1 Base awards

-   Successful national lock: 25 points.

-   Air threat destroyed: 100 points.

-   Maritime threat destroyed: 100 points.

-   Air chain-reaction bonus: 50 points for each additional threat in
    the same blast chain.

-   Unused air interceptor: 10 points at session end.

-   Maritime energy efficiency: up to 100 points per session.

-   Undamaged local target: 50 points each.

-   Defended site survives: 500 points at each DEFCON accounting.

## 15.2 Multipliers

-   Training: 1x

-   Standard: 2x

-   Crisis: 3x

-   Perfect session: additional 2x session bonus

## 15.3 Penalties

Impacts do not subtract score below zero. They remove survival bonuses
and damage the campaign. This keeps the score legible while making
physical consequences more important than arithmetic punishment.

# 16 Damage and Persistence

## 16.1 Site integrity

Each active site has two integrity states plus destruction:

-   Intact

-   Damaged

-   Destroyed

A damaged site changes its national node and local terrain. Destroyed
sites remain dark on the map.

## 16.2 Infrastructure effects

Damage can produce one of four clear effects for the remainder of the
current DEFCON stage:

-   Reduced warning time.

-   Two fewer air interceptors.

-   Slower maritime energy recharge.

-   One disabled local target or battery at session start.

Only one persistent effect may apply to a site at a time. The effect is
shown pictorially when the site is selected.

## 16.3 Recovery

At each DEFCON accounting, one damaged noncritical site may recover if
the preceding four sessions were completed without a destroyed site.
NORAD never recovers after destruction because its loss ends the game.

# 17 Controls and Interaction Rules

## 17.1 Console switches

-   Select: Cycle mode on title screen; otherwise unused during active
    play.

-   Reset: Start or restart the selected mode.

-   Color and Black and White: Optional palette accessibility toggle if
    technically clean; otherwise ignored consistently.

-   Difficulty switches: Reserve for development or optional expert
    settings only if their use is printed in the manual. They must not
    change rules silently.

## 17.2 Joystick response

All cursor and craft movement is evaluated every frame. Movement begins
on the first valid input frame. National and air cursors use brief
acceleration over no more than eight frames. Maritime vertical motion is
immediate at constant speed.

The controls must be tuned on original-style digital joysticks.
Keyboard-emulated joystick behavior in Stella is useful but not
sufficient.

## 17.3 Pause

The initial release does not require a pause function. If pause is
added, it may use the Color and Black and White switch and must produce
an unmistakable frozen-screen indication. Select must never be used for
pause during play because it risks accidental mode changes on reset.

# 18 Visual Direction

## 18.1 Overall image

The default screen resembles a phosphor-amber defense terminal
interpreted through Atari 2600 graphics. Black provides the main
negative space. Color is sparse, functional, and intense when it
appears.

## 18.2 Palette roles

**Black:** Safe negative space, sky, national landmass, deep water.

**Dark burnt amber:** Peripheral terrain, inactive structures,
low-priority display bands.

**Medium orange:** Active terrain edges, water bands, status structure.

**Bright amber:** Map accents, reticle, friendly defense, active target
nodes.

**Yellow-white:** Locks, interception cores, perfect timing, major
flashes.

**Red:** Imminent impact, destroyed site, DEFCON 1 emergency. Red is
rare.

**Optional cyan or green:** Successful system confirmation only. It must
not become a competing base palette.

NTSC and PAL use separate hand-tuned color tables. Numerical TIA color
values are not shared blindly between standards.

## 18.3 Gradients

Gradients are created using horizontal bands of related luminance
values. They are static or slowly stepped. They do not attempt smooth
per-pixel shading.

Approved gradient uses include:

-   Amber perimeter around the national silhouette.

-   Atmospheric banding behind terrain.

-   Water depth bands.

-   Brief explosion illumination.

-   Title-screen phosphor bloom.

## 18.4 Symbols

Every recurring object has a stable silhouette:

-   Air contact: Point plus alternating tail.

-   Maritime contact: Paired horizontal segments.

-   National reticle: Hollow bracketed square.

-   Air reticle: Small cross or diamond.

-   Maritime craft: Vertical capsule or shield carrier.

-   Active maritime field: Bright bar or oval.

-   City or population target: Low block cluster.

-   Base: Bunker or antenna silhouette.

-   NORAD: Star or shield node.

Color must never be the only distinction.

## 18.5 Text budget

Active play uses as little text as possible. Approved text is limited
to:

-   NORAD 84 on the title screen.

-   DEFCON with a single large digit, if the kernel permits.

-   Score digits.

-   Compact outcome words or symbols.

City names, acronyms, weapon explanations, and story paragraphs belong
in the manual, not on the active display.

# 19 Audio Direction

Sound communicates state before it decorates it.

## 19.1 Required cues

-   ARGUS boot tone.

-   National radar pulse.

-   Air contact alert.

-   Maritime double-pulse alert.

-   Nearest-impact acceleration.

-   Reticle movement tick at boundaries only.

-   Failed acquisition buzz.

-   Successful lock tone.

-   Air interceptor launch.

-   Air interception burst.

-   Ground impact.

-   Maritime field activation.

-   Maritime field empty or recharge cue.

-   Torpedo interception.

-   Torpedo penetration.

-   DEFCON transition alarm.

-   Site-loss tone.

-   Victory motif.

-   Catastrophe silence followed by one low terminal tone.

## 19.2 Music

Music appears on the title screen, outcome screen, and very short DEFCON
transitions. Active gameplay prioritizes information-bearing pulses,
engine textures, water tones, launches, and explosions. Continuous
melody must not mask timing cues.

# 20 Technical Direction

## 20.1 Hardware target

The game targets an unmodified Atari 2600 or compatible Video Computer
System with a standard digital joystick.

The final cartridge target is a 32K F4 bankswitched ROM. It uses
ordinary cartridge banking only. It does not require Superchip RAM, ARM
enhancement, CDF, DPC Plus, or another computational coprocessor.

This target provides room for multiple terrain families, attack tables,
title data, and audio while preserving a stock-console identity.

## 20.2 Programming language and toolchain

The game should be written primarily in 6502 assembly. DASM is the
default assembler unless the developer has an established ca65 pipeline
that produces equally deterministic binaries and listings.

The project should include:

-   Reproducible command-line builds.

-   Symbol and listing output.

-   NTSC and PAL build targets.

-   Stella debugger labels.

-   Automated ROM-size checks.

-   Scanline-count assertions or test hooks where practical.

-   Data-generation scripts for playfield rows, terrain tables, and wave
    tables.

## 20.3 Frame structure

Each frame follows the standard Atari structure:

> 1\. Vertical sync
>
> 2\. Vertical blank game logic
>
> 3\. Visible kernel
>
> 4\. Overscan game logic

The visible kernel must maintain a stable scanline count. Expensive
calculations, random generation, and state transitions occur outside the
visible region or are distributed across frames.

## 20.4 Display kernels

The project requires four principal kernels:

> 1\. Title and outcome kernel
>
> 2\. National negative-space map kernel
>
> 3\. Air-defense terrain kernel
>
> 4\. Maritime water-column kernel

Shared object routines are desirable, but visual clarity takes priority
over forcing every screen into one universal kernel.

## 20.5 ROM bank plan

The preliminary F4 bank assignment is:

-   Bank 0: Reset, common services, frame dispatch, shared arithmetic

-   Bank 1: Title, mode selection, outcome, scoring

-   Bank 2: National map kernel and contact logic

-   Bank 3: Air-defense kernel and collision logic

-   Bank 4: Maritime kernel and collision logic

-   Bank 5: Air terrain and target data

-   Bank 6: Maritime environment and wave data

-   Bank 7: Audio, campaign tables, shared graphics, diagnostics

Bank assignments may move during implementation, but the four-screen
architecture and 32K ceiling do not.

## 20.6 RAM discipline

The console provides 128 bytes of RAM, shared with stack usage through
hardware mirroring. The project reserves approximately 32 bytes of safe
stack headroom and limits persistent and working state to approximately
96 bytes.

RAM must be budgeted before feature implementation. Required categories
include:

-   Campaign and score state

-   Active defended sites

-   National contact records

-   Local threat records

-   Player object state

-   Audio sequencer state

-   Random generator state

-   Kernel scratch variables

No feature is accepted without identifying its RAM cost.

## 20.7 National contact budget

The initial supported maximum is four simultaneous national contacts.
The kernel may be expanded to five or six only after hardware testing
shows stable display, readable separation, and sufficient CPU time.

Contacts are compact records containing class, target, path progress,
speed, and behavior flags. Destination coordinates are derived from
target tables.

## 20.8 Local object budget

The initial air target is three simultaneous hostile objects with
controlled multiplexing. The initial maritime target is three
simultaneous torpedoes at distinct vertical lanes.

More objects may be implied through alternating frames, spawn timing,
trails, and chain reactions. Stable perception matters more than an
impressive internal count.

## 20.9 Collision policy

Hardware collision latches may assist but do not define the entire game.
Collision rules must match the rendered shapes. Software range checks
may be required for expanding air bursts and the active maritime field.

All collision routines require deterministic test cases for edge,
center, clear miss, and simultaneous contact.

## 20.10 Randomness

An 8- or 16-bit linear-feedback shift register generates campaign
variation. It is seeded from title-screen dwell time and controller
activity. Wave tables constrain randomness so every combination remains
fair and visually valid.

## 20.11 NTSC and PAL

NTSC and PAL are separate build targets with:

-   Appropriate scanline totals.

-   Separate palette tables.

-   Normalized gameplay timers.

-   Retuned audio where necessary.

-   Equivalent cursor speed and strategic pacing.

The mode is not selected from a menu at runtime. Separate ROM images are
acceptable and preferred if they provide more reliable timing.

# 21 Accessibility Specification

## 21.1 Cold-player test

A player unfamiliar with the project should identify within thirty
seconds:

-   The map represents the United States.

-   Bright moving objects are threats.

-   The hollow reticle is controllable.

-   Fire acquires a threat.

-   The local player object is controllable.

-   The defended structures must survive.

-   DEFCON or the alert ladder represents worsening danger.

## 21.2 No-manual playability

The manual may enrich understanding, but the first Training campaign
must be playable without reading it. Pictorial demonstrations,
consistent controls, object motion, sound, and consequence teach the
game.

## 21.3 Readability rules

-   No critical information is confined to the screen edge or
    overscan-risk area.

-   No important object is one television pixel wide for its entire
    life.

-   No critical distinction relies only on red versus green.

-   Flashing states use a readable cadence and avoid continuous
    full-screen strobing.

-   Player objects remain visible against every approved gradient band.

-   At least one frame of clear visual confirmation follows every
    intercept.

## 21.4 Fairness rules

-   Threats never spawn too close to impact for the selected difficulty.

-   A newly entered local screen provides a short orientation interval
    before the first possible impact.

-   Strategic contacts cannot destroy a second site during a forced
    transition animation.

-   Weather never hides collision-critical information.

-   A visible miss never becomes a success through homing correction.

-   A visible hit never reports a miss because of a smaller hidden
    collision box.

# 22 Content Matrix

  -----------------------------------------------------------------------
  **Content category**    **Release target**      **Implementation rule**
  ----------------------- ----------------------- -----------------------
  National map            1                       Negative-space mainland
                                                  plus three insets

  Defended-site records   12                      Eight active per
                                                  Standard campaign

  Air terrain families    8                       Parameterized target
                                                  and weather variations

  Maritime environments   4                       Equal campaign weight
                                                  with air defense

  Weather layers          8                       Visual first, mild
                                                  rules only

  Air threat behaviors    3                       Ballistic, splitting,
                                                  low approach

  Maritime threat         4                       Straight, drifting,
  behaviors                                       fast pair, sea-skimmer

  Campaign modes          3                       Training, Standard,
                                                  Crisis

  Outcome tiers           4                       Perfect, survival,
                                                  damaged survival,
                                                  catastrophe

  Principal kernels       4                       Title, national, air,
                                                  maritime
  -----------------------------------------------------------------------

# 23 Development Plan and Gates

The project advances through gates. A later phase does not begin merely
because the previous screen looks attractive.

## Phase 0 Hardware laboratory

Build isolated tests for:

-   Asymmetrical playfield rewriting.

-   Horizontal amber gradients.

-   Reticle movement and collision.

-   Four national contacts.

-   Expanding air burst.

-   Maritime craft and pulsed field.

-   NTSC and PAL stable frames.

**Gate:** Every test holds stable scanlines in Stella and on hardware.
The map experiment identifies a viable negative-space technique.

## Phase 1 National display proof

Create the recognizable mainland, three insets, four moving contacts,
target nodes, acquisition reticle, lock feedback, and DEFCON indicator.

**Gate:** Five cold observers can identify the country, player cursor,
most urgent threat, and threatened target without explanation. Four of
five can acquire a contact within ten seconds.

## Phase 2 Air defense proof

Create one regional terrain, three targets, descending hostiles,
reticle, interceptor travel, honest expanding collision, impacts, chain
reaction, ammunition, and return transition.

**Gate:** The player can explain why a shot hit or missed. No homing
correction exists. The encounter is enjoyable for ten consecutive plays.

## Phase 3 Maritime defense proof

Create one water environment, defense craft, pulsed field, energy
behavior, three torpedo patterns, penetrations, damage, and return
transition.

**Gate:** The player understands that alignment plus timed activation
causes success. Holding Fire is inferior to deliberate pulses. The mode
feels as substantial as the air game.

## Phase 4 Complete vertical slice

Connect title, mode selection, national acquisition, both local games,
one-quarter strategic time, damage persistence, DEFCON accounting,
score, and outcome.

Use a shortened eight-session campaign.

**Gate:** A cold player can complete the loop without verbal coaching
and asks to replay after failure or victory.

## Phase 5 Content production

Add all terrain families, maritime environments, weather layers, target
records, campaign tables, audio cues, and difficulty modes.

**Gate:** Every content combination passes readability and collision
tests. No stage depends on unique code that should have been data.

## Phase 6 Balance and accessibility

Tune strategic speeds, local pressure, ammunition, maritime energy,
damage, scoring, and outcome requirements. Test beginners, experienced
Atari players, Missile Command players, and people who have not seen
WarGames.

**Gate:** Training teaches without text; Standard is winnable with
practice; Crisis challenges expert players without changing rules.

## Phase 7 Hardware and release qualification

Test NTSC and PAL ROMs across Stella, original consoles, common flash
cartridges, CRT displays, and representative modern displays.

**Gate:** Stable scanlines, consistent input, safe overscan placement,
appropriate palettes, no bank faults, no progression locks, and
reproducible release binaries.

# 24 First Playable Prototype Specification

The first integrated prototype is intentionally small but complete.

It contains:

-   Title and immediate start.

-   One negative-space national map.

-   Mainland plus Alaska, Hawaii, and Puerto Rico insets.

-   Two active sites.

-   One air contact and one maritime contact.

-   Acquisition reticle with honest lock radius.

-   One air terrain and a three-threat engagement.

-   One maritime environment and a five-torpedo engagement.

-   Strategic time advancing at 25 percent during local play.

-   Visible local damage.

-   Return to the national display.

-   One DEFCON change.

-   Victory and catastrophe states.

The prototype is successful only if it proves both fun and
comprehension. Attractive screenshots alone do not satisfy the
milestone.

# 25 Test Scenarios

## 25.1 National acquisition tests

-   Contact centered inside reticle: lock.

-   Contact touching inner boundary: lock consistently.

-   Contact visibly outside boundary: reject.

-   Two contacts nearby: lock the one actually inside.

-   Fast cursor release: stop without drift.

-   Four contacts: urgency remains understandable.

## 25.2 Air collision tests

-   Hostile through blast center: destroy.

-   Hostile along visible active rim: destroy.

-   Hostile outside forgiving rim: survive.

-   Hostile reaches terrain first: impact.

-   Two hostiles enter one burst: chain reaction.

-   Empty ammunition: reject with feedback.

## 25.3 Maritime collision tests

-   Torpedo crosses active field: destroy.

-   Torpedo crosses inactive craft: penetrate or damage craft according
    to rule.

-   Field activates too early: expires before contact.

-   Repeated holding: energy depletes and opens a gap.

-   Fast pair at different depths: both remain individually defensible.

-   Torpedo outside visible field: no interception.

## 25.4 Campaign tests

-   Twenty sessions produce a valid class distribution.

-   No campaign produces more than three consecutive sessions of one
    class.

-   NORAD destruction ends immediately after clear feedback.

-   Six surviving active sites permit victory.

-   Five surviving active sites cause catastrophe.

-   Perfect defense is attainable and detected correctly.

# 26 Risk Register

## 26.1 National geography is not recognizable

**Mitigation:** Prototype negative-space, outline, and hybrid versions
before committing content. Judge on CRT at normal distance. Preserve
major continental proportions before adding nodes.

## 26.2 Too many national objects produce flicker or ambiguity

**Mitigation:** Cap the release at four simultaneous contacts unless
testing proves more. Use pulse tails and spawn timing instead of raw
object count.

## 26.3 Water mode feels like a shallow bonus game

**Mitigation:** Give it equal campaign frequency, four behavior types,
energy timing, persistent consequences, four environments, and its own
mastery curve. Do not ship if testers regard it as filler.

## 26.4 Air mode becomes an imprecise Missile Command imitation

**Mitigation:** Prioritize honest blast collisions, distinct terrain,
strategic time pressure, regional persistence, and compact sessions.
Tune on original controls.

## 26.5 The game becomes unreadable in pursuit of atmosphere

**Mitigation:** Apply the cold-player test at every gate. Mood cannot
override object identity, hierarchy, or feedback.

## 26.6 ROM expansion encourages uncontrolled scope

**Mitigation:** Keep the 32K ceiling. New content must use the component
system. No third primary defense mode enters the release plan.

## 26.7 RAM exhaustion appears late

**Mitigation:** Maintain a live RAM map from Phase 0. Require a stated
RAM cost for every new persistent system.

## 26.8 PAL becomes a late rewrite

**Mitigation:** Build PAL from Phase 0, separate color and timing
tables, and test both standards at every gate.

# 27 Deliberate Exclusions

The first release does not include:

-   Strategic offense.

-   Diplomacy.

-   Resource-production menus.

-   Conversational text input.

-   A world map.

-   Free scrolling.

-   A flight-simulator interception sequence.

-   A code-breaking puzzle.

-   A third primary defense mode.

-   Two-player simultaneous play.

-   Save data.

-   Speech synthesis.

-   A coprocessor-enhanced cartridge.

These exclusions protect the central loop. They may be revisited only
for a sequel or clearly separate edition.

# 28 Relationship to NORAD 84 for Commodore 64

The Atari and Commodore games are companion projects, not hierarchical
versions of one product.

## 28.1 Shared values

-   WarGames-era command-center mood.

-   ARGUS fiction.

-   Defense, restraint, and consequence.

-   Recognizable geography.

-   Accessible controls and visible urgency.

-   Missile Command-style explosions and honest skill.

-   Strong audiovisual feedback.

## 28.2 Atari lessons that may inform Commodore 64

-   How little information a player actually needs.

-   Whether national prioritization is fun by itself.

-   Which symbols read instantly.

-   How rapidly a local engagement should begin and end.

-   How to teach through movement and sound instead of text.

-   Whether air and maritime disciplines create useful rhythm.

## 28.3 Commodore 64 lessons that may inform Atari

-   Geographic proportions and target placement.

-   Threat terminology and fiction.

-   ARGUS personality and story framing.

-   Consequence modeling.

-   The pacing of DEFCON escalation.

-   Color hierarchy and command-display composition.

## 28.4 Separation pledge

-   Each project has its own repository, binaries, schedules, and
    acceptance tests.

-   Neither project waits for the other to finish.

-   No code dependency is required.

-   Design lessons are recorded as short cross-project notes, not
    silently copied.

-   Atari limitations do not force features out of the Commodore game.

-   Commodore complexity does not expand the Atari scope.

# 29 Definition of Done

NORAD 84 for Atari 2600 is complete when:

-   The national map is recognizable and readable on CRT hardware.

-   Air and maritime contacts are distinguishable by shape, motion, and
    sound.

-   Both defense modes are fun, fair, and equally important.

-   Training teaches the game without requiring prose.

-   Standard provides a finite 10- to 15-minute campaign.

-   Crisis provides a credible expert challenge.

-   Perfect Defense is possible.

-   Damage and DEFCON consequences remain understandable.

-   Every collision agrees with visible geometry.

-   The title, audio, palette, and transitions create the intended 1984
    terminal fantasy.

-   NTSC and PAL builds are stable.

-   The game runs on a stock console without computational enhancement.

-   No unresolved high-severity accessibility or progression defect
    remains.

-   Release binaries can be reproduced from the documented source and
    toolchain.

# 30 Final Creative Direction

The Atari 2600 should not be treated as a machine that can only
approximate a better computer\'s display. Its playfield, scanline
timing, luminance bands, repeated objects, collision latches, and
distinctive sound can create a defense terminal with its own authority.

The mainland silhouette should look as though it has been cut out of
glowing amber geology. Air contacts should feel like lethal points
entering a protected void. Regional explosions should light crude
terrain with surprising force. Underwater bands should make a handful of
moving torpedoes feel claustrophobic and urgent. The limited controls
should make the player feel responsible rather than restricted.

The game succeeds when a player does not think about how little the
machine is drawing. They see the country, understand the emergency,
choose what to defend, and lean toward the screen because the next few
seconds matter.

# Appendix A Developer Start Checklist

Before building content, confirm the following:

☐ Stable NTSC and PAL frame templates exist.

☐ The chosen assembler and build scripts are reproducible.

☐ F4 bank switching is proven on Stella and hardware.

☐ A live RAM map has been created.

☐ Three national map visual experiments have been compared on CRT.

☐ The negative-space approach is recognizable before target nodes are
added.

☐ Cursor movement meets the response requirement.

☐ Lock collision matches its visible boundary.

☐ Air burst collision matches its visible boundary.

☐ Maritime field collision matches its visible boundary.

☐ Four simultaneous national contacts remain readable.

☐ The three-pip strategic warning meter works in both local kernels.

☐ Both defense modes return cleanly to updated national state.

☐ A complete eight-session vertical slice is fun before full content
production.

# Appendix B Reference Materials

-   Thorn EMI, **Computer War**, Atari 400 800 1200 manual, 1983.

-   Internet Archive, **Computer War** software entry and emulation
    materials.

-   Atari, **Missile Command**, arcade and Atari home-system versions.

-   Atari, **Pong** and **Asteroids**.

-   Coleco, **WarGames**.

-   **WarGames**, motion picture, 1983, used as tonal and visual
    inspiration only.
