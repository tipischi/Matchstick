# Matchstick - Product Specification

## 🔥 Core Concept
A mental toughness app that uses fire-as-fuel metaphor. Users light a match on first open and must keep it burning by completing hard challenges. The flame consumes "wood" (measured in kg/lbs) in **real-time**, creating constant gentle urgency. If the flame dies completely, **hard reset** - start from scratch.

---

## 🎯 Target User
Unmotivated people stuck in procrastination/scrolling loops who want to build discipline through daily hard actions.

---

## 🚀 Product Philosophy

### Core Principles
- **Honor System**: Trust users to self-report (no verification needed)
- **Local-First**: No backend, no user accounts, pure local storage
- **Hard Reset**: Flame dies = lose everything, start over
- **Real-Time Pressure**: Visual fuel depletion creates urgency
- **Minimal Interruption**: Only notify when flame is dying
- **Action Over Analysis**: Current streak only, no complex analytics

### Monetization
- **$5 One-Time Purchase** (Android first)
- AI onboarding limited to 10 messages (predictable costs)
- No ongoing API costs after onboarding
- Simple, sustainable model

---

## 💎 Core Features

### 1. AI-Powered Onboarding (DeepSeek Integration)

**First Launch Flow:**
1. Minimal splash → "Welcome to Matchstick"
2. "Let's find your why" → AI chat interface
3. **Up to 10 messages with DeepSeek** (hard limit for cost control)
4. AI asks probing questions:
   - "What made you download this app today?"
   - "What are you avoiding?"
   - "What would your life look like with unshakeable discipline?"
5. Helps user articulate their deep "why"
6. Message counter shows "3/10 messages remaining"
7. Saves as motivational anchor (shown when flame is dying)
8. "Strike Your Match" → Ceremonial swipe animation lights match
9. "First Challenge" → Immediate action required

**AI "Why" Features:**
- Re-read anytime via small icon/button
- Auto-shown when fuel drops below 25%
- Can re-write why anytime (manual editing, not AI)
- Full-screen overlay display

**AI Usage Limits:**
- **Onboarding only**: AI is ONLY used during first-time setup
- **10 message cap**: Prevents cost overruns from chatty users
- **No custom challenge AI**: Users set their own fuel values for custom challenges
- **One-time cost**: ~$0.001 per user, fully covered by $5 purchase

---

### 2. Fuel-Based Fire System

**Core Mechanic Summary:**
- Your flame consumes fuel in real-time (burn rate increases as flame grows)
- Complete challenges to add fuel (bigger challenges unlock as you progress)
- **Fuel hits 0 = DEATH** (hard reset, no second chances, no downgrades)
- Bank the fire before sleep (80% burn reduction for 8-10 hours)
- **Equal difficulty at all stages** - maintaining Bonfire = maintaining Spark, just bigger numbers

#### Visual Progression Stages

| Stage | Fuel Capacity | Active Burn Rate | Banked Burn Rate | Daily Need (Active) | Upgrade At | Challenges Per Day |
|-------|--------------|------------------|------------------|---------------------|------------|-------------------|
| **Spark** | 30kg max | 0.5kg/hour | 0.1kg/hour | ~12kg/day | 60kg → Match | 3-4 small challenges |
| **Match Flame** | 60kg max | 0.75kg/hour | 0.15kg/hour | ~18kg/day | 120kg → Kindling | 3-4 medium challenges |
| **Kindling Fire** | 120kg max | 1kg/hour | 0.2kg/hour | ~24kg/day | 180kg → Small Fire | 2-3 hard challenges |
| **Small Fire** | 180kg max | 1.5kg/hour | 0.3kg/hour | ~36kg/day | 300kg → Campfire | 2-3 very hard challenges |
| **Campfire** | 300kg max | 2kg/hour | 0.4kg/hour | ~48kg/day | 500kg → Bonfire | 2-3 extreme challenges |
| **Bonfire** | 500kg max | 2.5kg/hour | 0.5kg/hour | ~60kg/day | Max level | 2 brutal challenges |

**Realistic Daily Examples (Equal Difficulty at Each Stage):**
- **Spark** (12kg/day): 3min cold shower (3kg) + read 15min (3kg) + meditation 5min (2kg) + make bed (2kg) + journal (2kg) = 12kg ✓ **(4 spark challenges)**
- **Match** (18kg/day): 5min cold shower (5kg) + workout 20min (6kg) + read 30min (5kg) + journal (5kg) = 21kg ✓ **(3-4 match challenges)**
- **Kindling** (24kg/day): 10min cold shower (8kg) + workout 45min (10kg) + read 1hr (8kg) = 26kg ✓ **(2-3 kindling challenges)**
- **Small Fire** (36kg/day): Ice bath 2min (12kg) + intense workout 60min (15kg) + face a fear (15kg) = 42kg ✓ **(2-3 small fire challenges)**
- **Campfire** (48kg/day): Ice bath 5min (18kg) + double workout (20kg) + hardest conversation (18kg) = 56kg ✓ **(2-3 campfire challenges)**
- **Bonfire** (60kg/day): Ice bath 10min (30kg) + ultra endurance 2hrs (35kg) = 65kg ✓ **(2 bonfire challenges - genuinely extreme)**

**Key Insight**: Same number of challenges per day (2-4), but challenge intensity scales with flame size. Maintaining a Bonfire is EQUALLY HARD as maintaining a Spark - you're just doing objectively harder things.

#### Fuel Mechanics
- **Real-time Depletion**: Animated wood pile visibly burning down
- **Time Until Empty**: Prominent countdown "14h 23m of fuel remaining"
- **Storage Capacity**: Scales with flame stage (prevents infinite banking)
- **Increasing Hunger**: Bigger flames consume MORE fuel (harder to maintain)
- **Visual Pressure**: See exact moment you'll run out unless you act
- **Bank the Fire**: Reduces burn rate by 80% during sleep (see below)

#### Flame States
- **Healthy** (>50% fuel): Bright, dancing flames
- **Getting Low** (25-50% fuel): Flame shrinks, color dims to orange
- **Critical** (<25% fuel): Sputtering, dark, warning indicators
- **DEAD** (0% fuel): Hard reset, lose everything, start over
- **Banked** (sleep mode): Covered with ash, slow smolder, reduced burn rate

#### Stage Progression System - NO SECOND CHANCES

**Death is Real:**
- **ANY stage reaches 0kg fuel = DEATH**
- No downgrades, no second chances, no safety nets
- Lose everything: streak, stage, all progress
- Hard reset back to new Spark
- This is the tough-love approach - you either maintain it or you lose it

**Upgrading (Requires Sustainability):**
- Flame upgrades when you reach next stage's fuel threshold
- Example: Spark (30kg max) → Match Flame when you hit 60kg
- Must have enough fuel reserves to handle the increased burn rate
- Upgrade is automatic when threshold is reached
- Celebratory animation: "Your flame grows stronger!"
- **Warning shown**: "Higher burn rate. Can you sustain it?"

**Why This System Works:**
- **Real Stakes**: Fuel hits 0 = you lose everything, period
- **Equal Difficulty**: All stages are equally hard to maintain (see challenge scaling below)
- **Constant Pressure**: No safety net means you can't slack off at any stage
- **Earned Progress**: Getting to Bonfire means something - you proved sustainability
- **Goggins Philosophy**: "Stay hard" - no excuses, no second chances

#### Bank the Fire Mechanic (CRITICAL FEATURE)

**The Problem**: Without this, users wake up to dead flames every morning.

**The Solution**: "Bank the Fire" before sleep - like covering a real campfire with ash.

**How It Works:**
1. **End-of-Day Reflection Required**: User must complete a short reflection to bank the fire
   - "What hard thing did you do today?"
   - "What will you do tomorrow?"
   - Simple 2-question prompt
2. **Burn Rate Reduction**: Active burn rate reduced by 80% for banked period
   - Example: Campfire normally 2kg/hr → 0.4kg/hr when banked
   - 8 hours sleep = only 3.2kg consumed vs. 16kg
3. **Fuel Cost to Bank**: Costs 2kg of fuel to bank (prevents abuse)
4. **Visual Change**: Flame gets covered with ash, glows dimly underneath
5. **Auto-Unbank**: Automatically returns to active burn when user opens app or after 10 hours
6. **One Bank Per Day**: Can only bank once every 20 hours (prevents gaming system)

**Banking UI/UX:**
- "Bank the Fire" button appears after 8pm local time
- Prompts end-of-day reflection (2 questions)
- Shows fuel savings: "Banking will save ~12kg over 8 hours"
- Confirmation: "Your flame is banked. Rest well."
- Morning notification: "Your flame is awake. Keep it burning."

**Why This Matters:**
- Makes the app sustainable for real people with real sleep schedules
- Encourages end-of-day reflection (extra accountability)
- Still creates urgency (must remember to bank, costs fuel)
- Realistic mechanic (real fires are banked overnight)

---

### 3. Challenge System - SCALED BY FLAME LEVEL

**Core Mechanic**: Challenges unlock and scale rewards based on your flame stage. Higher flames = access to higher reward challenges = equal difficulty to maintain.

#### Challenge Tiers (Unlock by Flame Stage)

**🔥 SPARK CHALLENGES** (Available at Spark stage)
- Cold Shower (3 min) - 3kg
- Meditation (5 min) - 2kg
- Read (15 min) - 3kg
- Make your bed - 2kg
- Journal (5 min) - 2kg
- No phone (1 hour) - 3kg
- Walk outside - 2kg
- **Daily Need: ~12kg** (2-4 spark challenges)

**🔥 MATCH CHALLENGES** (Unlock at Match stage)
- Cold Shower (5 min) - 5kg
- Meditation (10 min) - 4kg
- Read (30 min) - 5kg
- Workout (20 min) - 6kg
- Wake up early (6am) - 5kg
- No phone (2 hours) - 6kg
- Journal deep thoughts - 5kg
- **Daily Need: ~18kg** (2-4 match challenges)

**🔥 KINDLING CHALLENGES** (Unlock at Kindling stage)
- Cold Shower (10 min) - 8kg
- Meditation (20 min) - 7kg
- Workout (45 min) - 10kg
- Read (1 hour) - 8kg
- Wake up 5am - 8kg
- No phone (4 hours) - 10kg
- Run when tired - 10kg
- Difficult conversation - 10kg
- **Daily Need: ~24kg** (2-3 kindling challenges)

**🔥 SMALL FIRE CHALLENGES** (Unlock at Small Fire stage)
- Ice bath (2 min) - 12kg
- Intense workout (60 min) - 15kg
- Meditation (30 min) - 10kg
- Learn hard skill (90 min) - 12kg
- Wake up 4:30am - 12kg
- No phone all morning - 15kg
- Face a real fear - 15kg
- Ask for what you need - 12kg
- **Daily Need: ~36kg** (2-3 small fire challenges)

**🔥 CAMPFIRE CHALLENGES** (Unlock at Campfire stage)
- Ice bath (5 min) - 18kg
- Double workout day - 20kg
- 24hr phone fast - 25kg
- Meditation (60 min) - 15kg
- Public vulnerability post - 20kg
- Extreme physical challenge - 20kg
- Have the hardest conversation - 18kg
- **Daily Need: ~48kg** (2-3 campfire challenges)

**🔥 BONFIRE CHALLENGES** (Unlock at Bonfire stage)
- Ice bath (10 min) - 30kg
- Ultra endurance (2+ hrs) - 35kg
- 48hr phone fast - 40kg
- Extreme discomfort challenge - 35kg
- Do the thing you're most avoiding - 40kg
- Major public commitment - 30kg
- **Daily Need: ~60kg** (2 bonfire challenges)

**Custom Challenges:**
- User creates with title + description
- **Fuel value limited by current flame stage:**
  - Spark: 1-5kg max
  - Match: 1-8kg max
  - Kindling: 1-12kg max
  - Small Fire: 1-18kg max
  - Campfire: 1-25kg max
  - Bonfire: 1-40kg max
- Prevents gaming the system (can't create fake 40kg challenges at Spark level)
- Stored locally for reuse

**Why Scaling Works:**
- **Equal Difficulty**: 2-4 challenges per day regardless of stage
- **Meaningful Progress**: Unlocking higher tiers feels rewarding
- **Can't Rush**: Must prove you can sustain each level before moving up
- **Natural Ceiling**: Bonfire requires GENUINELY hard daily commitments
- **Prevents Stagnation**: Always chasing bigger challenges as you grow

#### Challenge Completion Flow
1. User taps "Add Fuel" button
2. Challenge list opens, organized by tier:
   - **Unlocked tiers** (current stage and below): Fully visible, colored
   - **Locked tiers** (above current stage): Grayed out with lock icon
   - Example at Match stage: Can see Spark + Match challenges, Kindling+ are locked
3. User can preview locked challenges (see what they're working towards)
4. Select unlocked challenge
5. Tap "I Did It" button (honor system)
6. Optional: Add note about how it felt
7. Instant fuel added with satisfying animation
8. Wood logs drop onto pile visually
9. If near upgrade threshold, show progress: "32kg until Match Flame unlocks!"

---

### 4. Home Screen Widget (CRITICAL FOR RETENTION)

**The Problem**: If users can't see their flame without opening the app, they forget about it and it dies.

**The Solution**: Android home screen widget showing live flame status.

**Widget Features:**
- **Live Flame Visual**: Miniature animated flame showing current stage
- **Fuel Remaining**: "47kg / 2h 15m left"
- **Burn Rate Indicator**: Visual bar showing how fast fuel is depleting
- **Quick Action**: Tap to open app to full flame screen
- **Warning States**: Widget changes color/appearance when fuel is low
  - Healthy: Bright colors
  - Low (<25%): Orange tones
  - Critical (<10%): Red, pulsing
- **Updates**: Refreshes every 15 minutes to show current state

**Widget Sizes:**
- **Small (2x2)**: Just flame icon + fuel remaining
- **Medium (4x2)**: Flame + fuel + time remaining + quick "Add Fuel" button
- **Large (4x3)**: Full stats + recent challenge + flame visual

**Why This Matters:**
- Constant visual reminder on home screen
- Creates urgency without opening app
- Users check their phone 100+ times/day - each time they see their flame
- Key retention driver - "out of sight, out of mind" prevented
- Shows commitment (user puts widget on prime home screen real estate)

---

### 5. Main UI Screen

**Visual Elements:**
- **Top Bar**:
  - Current streak in days: "Day 12 🔥"
  - Current flame stage badge: "Campfire" with icon
- **Center**: Animated flame (visual style changes with each stage)
- **Below Flame**: Wood pile showing current fuel (visual bars/logs burning down)
- **Fuel Stats Panel**:
  - Fuel gauge: "142kg / 300kg" with visual progress bar
  - Burn rate: "Consuming 2kg/hour" (or "Banked: 0.4kg/hour")
  - Time remaining: "7h 52m until death" (in red if <25%)
  - Next upgrade progress: "158kg until Bonfire" (if not at max stage)
- **Action Buttons**:
  - Primary: "Add Fuel" (big, prominent, opens challenge list)
  - Secondary: "Bank the Fire" (appears after 8pm, if not banked)
  - Tertiary: Small "why" icon to re-read your motivation
- **Challenge Tier Indicators** (optional): Small badges showing unlocked tiers

**Screen States:**
- **Healthy State**: Bright, warm colors, dancing flame
- **Low Fuel State**: Dimmer, orange tones, warning indicators
- **Critical State**: Dark screen, red warnings, sputtering flame
- **Death State**: Black screen, cold embers, restart prompt
- **Banked State**: Ash-covered flame, dim glow, peaceful

---

### 6. Notifications

**Notification Strategy:**
- **Only When Dying**: Minimal interruption philosophy
- **2 Hour Warning**: "Your flame is flickering... 2 hours of fuel left"
- **1 Hour Warning**: "Emergency! Flame dying in 1 hour"
- **Death Notification**: "Your flame went out. Ready to start again?"
- **Banking Reminder** (9pm): "Don't forget to bank your fire before sleep" (only if not banked and >5kg fuel)
- **Morning Unbank** (when auto-unbanked): "Your flame is awake. Keep it burning."
- **No Daily Reminders**: User-driven, not app-driven

---

### 7. Stats & Tracking

**Visible Stats:**
- **Current Streak**: Days flame has been alive
- **Current Fuel**: kg remaining
- **Time Until Death**: Countdown timer
- **Fuel Capacity**: Based on current stage

**Hard Reset Philosophy:**
- Lose everything when flame dies
- No visible lifetime stats
- Pure current-moment focus

**Secret Feature (Optional):**
- Hidden lifetime stats stored but not shown
- Could unlock after certain milestones
- Total flames lit, total challenges, longest streak

---

## 🏗️ Technical Architecture

### Platform & Stack
- **Flutter** (Android first, iOS future)
- **Local Storage**: SharedPreferences + Hive for all data
- **No Backend**: Completely offline except API calls
- **DeepSeek API**: For onboarding chat + custom challenge fuel suggestions
- **State Management**: Riverpod or Bloc (TBD)
- **Animations**: Custom with Flutter AnimationController
- **Payment**: Google Play In-App Billing ($5 one-time)

### Data Models

```dart
// Flame state
class FlameData {
  double currentFuel; // kg
  DateTime lastUpdate; // for calculating burn
  int streakDays;
  FlameStage stage; // enum: spark, match, kindling, small, campfire, bonfire
  String userWhy;
  double maxCapacity; // based on stage
  double activeBurnRate; // kg/hour when active
  double bankedBurnRate; // kg/hour when banked (80% reduction)
  bool isBanked; // whether fire is currently banked
  DateTime? lastBankedTime; // when fire was last banked
  int aiMessagesUsed; // track AI usage during onboarding (max 10)

  // Calculated properties
  double get fuelPercentage => currentFuel / maxCapacity;
  double get currentBurnRate => isBanked ? bankedBurnRate : activeBurnRate;
  Duration get timeUntilDeath => Duration(hours: (currentFuel / currentBurnRate).floor());

  // Update fuel based on time elapsed
  void updateFuel() {
    final now = DateTime.now();
    final hoursPassed = now.difference(lastUpdate).inMinutes / 60.0;
    final burnRate = isBanked ? bankedBurnRate : activeBurnRate;
    currentFuel = max(0, currentFuel - (burnRate * hoursPassed));
    lastUpdate = now;

    // Auto-unbank after 10 hours
    if (isBanked && lastBankedTime != null) {
      final bankedHours = now.difference(lastBankedTime!).inHours;
      if (bankedHours >= 10) {
        isBanked = false;
      }
    }

    _updateStage();
  }

  // Bank the fire (returns false if already banked recently)
  bool bankFire() {
    if (currentFuel < 2) return false; // Need fuel to bank
    if (lastBankedTime != null &&
        DateTime.now().difference(lastBankedTime!).inHours < 20) {
      return false; // Can only bank once per 20 hours
    }

    currentFuel -= 2; // Cost to bank
    isBanked = true;
    lastBankedTime = DateTime.now();
    return true;
  }

  void _updateStage() {
    // DEATH: If fuel hits 0 at ANY stage = GAME OVER
    if (currentFuel <= 0) {
      _triggerDeath();
      return;
    }

    // UPGRADE: Automatically upgrade when reaching next stage threshold
    if (stage == FlameStage.spark && currentFuel >= 60) {
      stage = FlameStage.match;
      // Show "Your flame grows stronger!" + warning notification
    } else if (stage == FlameStage.match && currentFuel >= 120) {
      stage = FlameStage.kindling;
    } else if (stage == FlameStage.kindling && currentFuel >= 180) {
      stage = FlameStage.smallFire;
    } else if (stage == FlameStage.smallFire && currentFuel >= 300) {
      stage = FlameStage.campfire;
    } else if (stage == FlameStage.campfire && currentFuel >= 500) {
      stage = FlameStage.bonfire;
    }

    // Update capacity and burn rates based on current stage
    _setStageParameters();
  }

  void _triggerDeath() {
    // HARD RESET - NO SECOND CHANCES
    currentFuel = 0;
    streakDays = 0;
    stage = FlameStage.spark;
    maxCapacity = 30;
    activeBurnRate = 0.5;
    bankedBurnRate = 0.1;
    isBanked = false;
    lastBankedTime = null;
    // Trigger death animation, show "why", offer restart
  }

  void _setStageParameters() {
    switch (stage) {
      case FlameStage.spark:
        maxCapacity = 30;
        activeBurnRate = 0.5;
        bankedBurnRate = 0.1;
        break;
      case FlameStage.match:
        maxCapacity = 60;
        activeBurnRate = 0.75;
        bankedBurnRate = 0.15;
        break;
      case FlameStage.kindling:
        maxCapacity = 120;
        activeBurnRate = 1.0;
        bankedBurnRate = 0.2;
        break;
      case FlameStage.smallFire:
        maxCapacity = 180;
        activeBurnRate = 1.5;
        bankedBurnRate = 0.3;
        break;
      case FlameStage.campfire:
        maxCapacity = 300;
        activeBurnRate = 2.0;
        bankedBurnRate = 0.4;
        break;
      case FlameStage.bonfire:
        maxCapacity = 500;
        activeBurnRate = 2.5;
        bankedBurnRate = 0.5;
        break;
    }
  }

  double _getNextStageBurnRate() {
    switch (stage) {
      case FlameStage.spark: return 0.75;
      case FlameStage.match: return 1.0;
      case FlameStage.kindling: return 1.5;
      case FlameStage.smallFire: return 2.0;
      case FlameStage.campfire: return 2.5;
      case FlameStage.bonfire: return 2.5; // already max
      default: return 0.5;
    }
  }
}

// Challenge
class Challenge {
  String id;
  String title;
  String? description;
  double fuelValue; // kg
  ChallengeCategory category; // physical, mental, social
  FlameStage requiredStage; // minimum flame stage to unlock this challenge
  bool isCustom;
  bool isPredefined;

  // Helper to check if challenge is unlocked for current flame
  bool isUnlockedFor(FlameStage currentStage) {
    return currentStage.index >= requiredStage.index;
  }
}

enum ChallengeCategory {
  physical,
  mental,
  social,
  custom
}

enum FlameStage {
  spark,      // 0-20kg capacity
  match,      // 20-50kg
  kindling,   // 50-100kg
  smallFire,  // 100-200kg
  campfire,   // 200-400kg
  bonfire     // 400kg+
}

// Completion log
class CompletionLog {
  String challengeId;
  DateTime completedAt;
  double fuelAdded;
  String? note;
  String challengeTitle;
}

// Hidden lifetime stats (optional future feature)
class LifetimeStats {
  int totalFlamesLit;
  int totalChallengesCompleted;
  int longestStreak;
  Map<ChallengeCategory, int> challengesByCategory;
}
```

### Background Processing
- **Fuel Consumption**: Calculate time-based fuel depletion when app opens
- **Local Notifications**: Schedule critical fuel notifications
- **Persistence**: Auto-save every state change to local storage
- **Foreground Service** (Android): Update notifications even when app closed

### Storage Strategy
```dart
// Using Hive for structured data
Box<FlameData> flameBox;
Box<Challenge> challengeBox;
Box<CompletionLog> completionBox;

// Using SharedPreferences for simple values
- user_why: String
- onboarding_completed: bool
- total_flames_lit: int (hidden)
```

---

## 🎨 UI/UX Flow

### First Launch Journey
1. Splash screen → "Welcome to Matchstick"
2. "Let's find your why" button
3. AI chat interface with DeepSeek
   - Conversational, probing questions
   - 5-10 message exchange
   - Helps articulate deep motivation
4. "Your why" displayed for confirmation
5. "Strike Your Match" screen
   - Swipe animation to light match
   - Ceremonial moment
6. Flame ignites → "Keep it burning"
7. Challenge list appears
8. Complete first challenge
9. Watch fuel/wood added with animation
10. Main screen with burning flame

### Daily Usage Flow
1. Open app → See flame status immediately
2. Check fuel gauge and time remaining
3. Notice flame health (bright/dim/sputtering)
4. Tap "Add Fuel" → Challenge list
5. Browse or search challenges
6. Select challenge → Tap "I Did It"
7. Optional: Add note about experience
8. Watch wood drop onto pile (animation)
9. See updated fuel gauge and time
10. Close app or browse more challenges

### Flame Death Experience (Fuel Hits 0 at ANY Stage)
1. Fuel gauge hits 0kg
2. Screen flashes red: "Your flame is dying!"
3. 5-second countdown appears (last chance to panic)
4. Flame flickers out animation
5. Screen slowly fades to black
6. Show cold embers
7. Stats displayed:
   - "Your flame died."
   - "Stage reached: Campfire" (or whatever stage they were at)
   - "Streak: 12 days"
   - "Total challenges completed: 47"
8. Display their "why" one final time
9. "Remember why you started?"
10. "This is what you're fighting for."
11. "Light a new match?" button
12. Tap → Hard reset:
    - Back to Spark
    - 0 day streak
    - All progress lost
    - Unlock history remains (hidden stats)

### Flame Upgrade Experience (When Reaching Next Level)
1. User adds fuel that pushes past upgrade threshold (e.g., Spark hits 60kg)
2. Fuel gauge fills and triggers upgrade
3. Screen flashes: "Your flame grows stronger!"
4. Upgrade animation (spark → match flame with particle effects)
5. New stage unlocked screen:
   - "Match Flame"
   - "New challenges unlocked!"
   - Preview of 2-3 new match-tier challenges
   - **WARNING**: "Higher burn rate: 0.75kg/hr"
   - "Can you sustain it?"
6. Show updated stats:
   - New capacity: 60kg max
   - New burn rate
   - New daily need (~18kg)
7. Celebratory moment (confetti, flame roar sound)
8. Return to main screen with bigger, brighter flame
9. Challenge list now shows unlocked match-tier challenges

### Low Fuel Warning Flow
1. Fuel drops below 25%
2. Flame visuals change (dimmer, orange)
3. "Your Why" overlay appears
4. Reminder of motivation
5. Challenge list easily accessible
6. Urgency indicators visible

---

## 🚀 Implementation Phases

### Phase 1: Core MVP (Week 1-2)
- [ ] Flutter project setup (Android)
- [ ] Flame visual system (6 stages with basic animations)
- [ ] Fuel calculation engine
  - [ ] Time-based burn rate
  - [ ] **Death system** (fuel hits 0 = hard reset, any stage)
  - [ ] **Upgrade system** (auto-upgrade at thresholds)
  - [ ] Capacity scaling per stage
- [ ] Local storage setup (Hive + SharedPreferences)
- [ ] **Challenge tier system**
  - [ ] Pre-defined challenges organized by flame stage (6 tiers)
  - [ ] 40-60 total challenges across all tiers
  - [ ] Lock/unlock logic based on current flame stage
  - [ ] Custom challenge creation with stage-limited fuel values
- [ ] Challenge completion logging
- [ ] Basic UI
  - [ ] Main flame screen with stage badge
  - [ ] Challenge list with locked/unlocked tiers
  - [ ] Stats display
  - [ ] Fuel gauge with upgrade progress indicator

### Phase 2: Banking & Widget (Week 2-3)
- [ ] **Bank the Fire mechanic**
  - [ ] End-of-day reflection (2 questions)
  - [ ] Burn rate reduction (80%)
  - [ ] Auto-unbank after 10 hours
  - [ ] One bank per 20 hours limit
  - [ ] Banked flame visual (ash-covered)
- [ ] **Home screen widget** (CRITICAL)
  - [ ] Small widget (2x2): flame + fuel
  - [ ] Medium widget (4x2): flame + fuel + time + button
  - [ ] Live updates every 15 minutes
  - [ ] Warning state visuals
  - [ ] Tap to open app

### Phase 3: AI Integration (Week 3-4)
- [ ] DeepSeek API integration
- [ ] Onboarding chat flow
  - [ ] Conversational interface
  - [ ] **10 message hard limit** with counter
  - [ ] Question prompts
  - [ ] "Why" extraction and storage
- [ ] "Why" display system
  - [ ] Auto-show when fuel < 25%
  - [ ] Manual access button
  - [ ] Manual edit functionality (no AI for edits)
- [ ] Custom challenge creation (user-set fuel values, no AI)

### Phase 3: Polish & Animations (Week 4)
- [ ] Smooth flame animations for all stages
  - [ ] Dancing flames
  - [ ] Transition between stages
  - [ ] Flickering when low
- [ ] Fuel adding animations
  - [ ] Wood logs dropping
  - [ ] Pile building up
- [ ] Flame dying animations
  - [ ] Sputtering
  - [ ] Shrinking
  - [ ] Embers cooling
- [ ] Death sequence
  - [ ] Fade to black
  - [ ] Emotional impact
- [ ] Strike match animation
  - [ ] Swipe to ignite
  - [ ] First spark
- [ ] Sound effects (optional)
  - [ ] Crackling fire
  - [ ] Wood dropping
  - [ ] Match strike

### Phase 4: Notifications & Background (Week 5)
- [ ] Local notification system setup
- [ ] Background fuel calculation
  - [ ] Calculate elapsed time
  - [ ] Update fuel on app open
- [ ] Notification triggers
  - [ ] 2-hour warning
  - [ ] 1-hour critical warning
  - [ ] Death notification
- [ ] Foreground service for accuracy

### Phase 5: Monetization & Release (Week 6)
- [ ] Google Play payment integration
  - [ ] $5 one-time purchase
  - [ ] Payment verification
- [ ] App store listing materials
  - [ ] Screenshots
  - [ ] Description
  - [ ] Icon
  - [ ] Feature graphic
- [ ] Beta testing (friends/family)
- [ ] Final polish and bug fixes
- [ ] Privacy policy (simple, local-only)
- [ ] Android release on Google Play

---

## 💡 Enhancement Ideas (Future Iterations)

### Visual Enhancements
- **Weather Effects**: Wind animation when you skip days (makes flame harder)
- **Night/Day Cycle**: Fire looks different at night (more dramatic)
- **Particle Effects**: Embers floating up when flame is strong
- **Color Variations**: Blue flame for 30+ day streaks (hotter = rarer)
- **Smoke Signals**: Visual feedback based on recent activity

### Motivational Layer
- **Hard Truth Quotes**: Goggins/Jocko quotes when flame low
- **Cookie Jar Feature**: Save reflections on hardest moments conquered
- **Before/After Logging**: How you felt before vs after challenge
- **"What are you avoiding?" Prompt**: Appears when 12+ hours no login
- **Victory Notes**: Quick journal on why you're proud

### Challenge Variations
- **Challenge of the Day**: One rotating high-value challenge
- **Emergency Fuel**: Super-hard challenge (30kg) only available when <1hr fuel
- **Challenge Chains**: Complete 3 in a row for bonus fuel multiplier
- **Seasonal Challenges**: Weather-appropriate challenges
- **Difficulty Tiers**: Easy/Medium/Hard/Extreme

### Unlock System
- **Flame Skins**: New visual styles at milestones (7, 30, 100 days)
- **Hidden Stats Unlock**: After first death, reveal lifetime stats
- **Hard Mode**: After 100-day flame, unlock 2x burn rate mode
- **Achievement Badges**: Secret achievements for specific accomplishments
- **Flame Colors**: Unlock different flame colors (blue, green, purple)

### Quality of Life
- **Challenge Favorites**: Quick access to your go-to challenges
- **Challenge History**: See what you've completed recently
- **Streak Milestones**: Celebrate at 7, 30, 100, 365 days
- **Quick Log**: Widget or shortcut to log challenge without opening app
- **Daily Summary**: End-of-day fuel summary

### Future Platform Support
- **iOS Version**: After Android validation
- **Apple Watch**: Glanceable flame status on wrist
- **Home Screen Widget**: See flame + fuel without opening
- **Wear OS**: Android watch support
- **Offline-first Sync**: Device-to-device transfer (no cloud)

---

## 🎯 Design Questions to Resolve

### Visual Design
**Question**: Realistic fire or stylized/minimalist?
- **Option A**: Photorealistic campfire (immersive, dramatic)
- **Option B**: Stylized geometric flame (clean, modern)
- **Option C**: Hand-drawn/illustrated style (unique, artistic)

### Audio Design
**Question**: Should there be sound?
- Ambient fire crackling sounds?
- Wood dropping sounds?
- Match strike sound?
- Flame dying out sound?
- Optional mute toggle?

### UI Prominence
**Question**: Streak counter prominence?
- Large and prominent (motivation focus)
- Subtle and minimal (fuel focus)
- Hidden until milestone (surprise delight)

### Challenge Organization
**Question**: How to organize challenges?
- Categories (Physical, Mental, Social)
- Single scrolling list
- Searchable with tags
- Custom user folders

### AI Personality
**Question**: DeepSeek onboarding tone?
- **Tough Love**: Goggins-style direct confrontation
- **Supportive Coach**: Encouraging, empathetic
- **Socratic Questioning**: Thoughtful, probing
- **Balanced Mix**: Supportive but honest

---

## 📊 Success Metrics (Local Analytics)

### User Engagement
- Average streak length before flame death
- Challenges completed per day (average)
- Most popular challenge types
- Time of day challenges typically completed
- App opens per week
- Fuel management patterns (banking vs. just-in-time)

### Retention Indicators
- Day 1 retention (return next day)
- Day 7 retention (survive first week)
- Day 30 retention (build habit)
- Average time between flame deaths
- Number of flame restarts (shows persistence)

### Challenge Insights
- Most completed challenges
- Least completed challenges
- Custom challenge creation rate
- Challenge completion time patterns
- Fuel economy balance (too easy/hard?)

*Note: All analytics stored locally, optional anonymous aggregation for improvements*

---

## 🔧 Technical Considerations

### Performance
- Smooth 60fps flame animations
- Minimal battery drain (efficient background calc)
- Fast app launch (<2 seconds to flame screen)
- Responsive challenge logging (instant feedback)

### Data Management
- Local-first architecture (works offline 100%)
- Efficient fuel calculation (only on app open)
- Backup/restore functionality (export/import)
- Migration strategy for app updates

### Edge Cases
- **Phone turned off for days**: Calculate all missed time, flame likely dead
- **Time zone changes**: Handle properly
- **System time manipulation**: Detect and prevent cheating (optional)
- **Low storage**: Graceful handling, minimal data footprint
- **Notification limits**: Work within Android notification policies

### Security & Privacy
- No personal data collected
- Everything local to device
- DeepSeek API: Only send "why" text, no identifying info
- Simple privacy policy (local-only storage)

---

## 📱 App Store Strategy

### Google Play Listing
**Title**: Matchstick - Keep Your Fire Burning

**Short Description**:
Build mental toughness by keeping your flame alive. Do hard things. Stay disciplined. Don't let it die.

**Long Description**:
Your fire is burning. Keep it alive.

Matchstick is not another habit tracker. It's a mental toughness app for people tired of scrolling, procrastinating, and taking the easy path.

Light your match. Do hard things. Feed your flame. If you stop, it dies. Hard reset. Start over.

Inspired by David Goggins' cookie jar philosophy, Matchstick turns discipline into a living, breathing fire you must maintain through daily hard actions.

🔥 CORE CONCEPT
- Your flame consumes fuel (wood) in real-time
- Complete challenges to add fuel
- Bigger flames need MORE fuel (it gets harder)
- Let it die? Lose everything. Start from scratch.

💪 CHALLENGE YOURSELF
- Cold showers when you don't want to
- Early wake-ups
- Workouts on hard days
- Uncomfortable conversations
- Create custom challenges for your journey

🎯 STAY MOTIVATED
- AI helps you find your "why" when you start
- See it when your flame is dying
- No social pressure, no leaderboards
- Just you vs. yourself

⚡ FEATURES
- Real-time fuel depletion (creates urgency)
- Beautiful flame animations (spark → bonfire)
- Honor system (we trust you)
- Local storage (your data stays on your device)
- One-time $5 purchase (no subscriptions, no ads)

This is for people who want to stop being soft. Build discipline. Do hard things.

Your flame is waiting.

**Keywords**: discipline, mental toughness, habits, self improvement, hard things, Goggins, challenges, willpower, motivation

---

## 🎨 Asset Requirements

### App Icon
- Match/flame imagery
- Bold, recognizable
- Works at small sizes
- Android adaptive icon format

### Flame Stages (Animations)
- Spark (tiny, fragile)
- Match flame (small, steady)
- Kindling fire (growing)
- Small fire (stable)
- Campfire (strong)
- Bonfire (massive)

### UI Graphics
- Wood pile/logs
- Fuel gauge elements
- Background textures
- Match strike animation assets
- Death/ember state visuals

### Screenshots for Store
1. Main flame screen (healthy campfire)
2. Challenge list
3. Onboarding "why" screen
4. Flame dying (critical state)
5. Streak milestone celebration
6. Challenge completion animation

---

## 🎯 Pre-Development Checklist

### Design Phase
- [ ] Create mockups for all 5 flame stages
- [ ] Design main UI screen layout
- [ ] Design challenge list screen
- [ ] Design onboarding flow screens
- [ ] Create app icon
- [ ] Choose color palette
- [ ] Select font/typography

### Content Preparation
- [ ] Write 30-50 pre-defined challenges
- [ ] Assign fuel values to each challenge
- [ ] Create challenge categories
- [ ] Draft AI onboarding conversation prompts
- [ ] Write sample "why" statements
- [ ] Write in-app copy and microcopy

### Technical Setup
- [ ] Set up DeepSeek API account
- [ ] Test DeepSeek API for chat
- [ ] Test DeepSeek API for fuel value suggestions
- [ ] Set up Google Play Developer account
- [ ] Set up payment processing
- [ ] Calculate fuel economy balance (test on paper)
- [ ] Verify burn rates feel right

### Documentation
- [ ] README for development setup
- [ ] Privacy policy draft
- [ ] Terms of service (if needed)
- [ ] App store description
- [ ] Beta testing plan

---

## 💰 Cost Breakdown

### Development Costs (DIY)
- Time investment: ~6 weeks
- Learning curve (if new to Flutter)

### Service Costs
- **DeepSeek API**: ~$0.001 per onboarding session (negligible)
- **Google Play Developer**: $25 one-time fee
- **Domain** (optional): ~$12/year for marketing site
- **Testing Devices**: Use emulators + personal phone

### Revenue Projection (Rough)
- **Price**: $5 one-time purchase
- **Break-even**: 5 purchases ($25 Play Store fee)
- **DeepSeek costs**: Covered after ~10 purchases
- **Everything else**: Pure profit

---

## 🎓 Learning Resources

### Flutter
- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Animations](https://docs.flutter.dev/development/ui/animations)
- [Hive Database](https://docs.hivedb.dev/)

### State Management
- [Riverpod](https://riverpod.dev/)
- [Bloc](https://bloclibrary.dev/)

### DeepSeek API
- [DeepSeek API Documentation](https://platform.deepseek.com/docs)

### Monetization
- [Google Play Billing](https://developer.android.com/google/play/billing)

---

## 📝 Notes & Ideas Parking Lot

### Random Ideas to Consider Later
- Shake phone when flame is dying for emergency alert
- Different wood types (oak = slow burn, pine = fast)
- Seasons affect burn rate (winter = harder to maintain)
- Collaborative mode: Two people share one flame (future)
- Legacy mode: Leave notes for your next flame
- Flame photography: Screenshot milestone flames to share
- Integration with fitness apps (auto-log workouts)
- Voice logging: "Hey Matchstick, I did a cold shower"

### Questions to Research
- Optimal fuel values for challenges (user testing needed)
- Best notification timing for retention
- Ideal burn rates (not too easy, not impossible)
- Color psychology for flame states
- Sound design effectiveness

### Deferred Features (v2.0+)
- Accountability partners (backend required)
- Social features (backend required)
- Cloud sync (backend required)
- Multi-flame mode (maintain multiple flames)
- Detailed analytics dashboard
- Export data (CSV, JSON)
- Themes (dark mode variations)

---

## 🏁 Next Steps

1. **Review this spec** - Make sure everything aligns with vision
2. **Answer design questions** - Visual style, sound, UI decisions
3. **Create mockups** - Get visual design locked down
4. **Set up development environment** - Flutter, Android Studio, DeepSeek
5. **Start Phase 1** - Build core flame mechanics and UI
6. **Iterate rapidly** - Test fuel economy early and often
7. **Launch beta** - Get real user feedback
8. **Polish and ship** - Release to Google Play

---

---

## 🔥 Core Philosophy Summary

### Why This System Works

**1. Real Stakes, Real Pressure**
- Fuel hits 0 = You lose EVERYTHING
- No downgrades, no second chances, no safety nets
- Forces daily commitment or face complete reset
- Maintains constant urgency at every stage

**2. Equal Difficulty at All Stages**
- Spark: Do 3-4 small challenges daily (make bed, 3min cold shower)
- Bonfire: Do 2 brutal challenges daily (10min ice bath, ultra endurance)
- Different intensity, same difficulty
- Prevents the "cruise at high level" problem

**3. Challenge Scaling = Fair Progression**
- Small flames unlock small-reward challenges
- Big flames unlock big-reward challenges
- Can't game the system (custom challenges limited by stage)
- Natural ceiling (Bonfire truly requires extreme dedication)

**4. Banking Mechanic = Sustainable**
- Must bank fire before sleep (costs 2kg fuel)
- 80% burn rate reduction during sleep
- Prevents "wake up dead" frustration
- Still requires daily action (must remember to bank)

**5. Unlocking Progression = Motivation**
- Reaching Campfire unlocks new challenges to preview
- Visual goal: "30kg until Bonfire unlocks!"
- Celebration moment when you upgrade
- Loss of higher tiers when you die = painful reset

### What Makes This Different from Other Apps

**Not a habit tracker** - No checkboxes, no streaks alone matter
- It's a living flame you must keep alive

**Not gamified points** - Real-time fuel depletion creates genuine urgency
- You see the exact moment you'll run out

**Not forgiving** - Miss a day or forget to bank = lose everything
- Tough love, Goggins philosophy

**Not one-size-fits-all** - Challenges scale with your commitment level
- Beginners start small, veterans push extremes

**Not complex** - Simple mechanic: do hard things or your flame dies
- But with depth: unlocks, tiers, banking strategy

---

**Last Updated**: 2026-01-09
**Status**: Planning Phase
**Core System**: Hard reset on death, challenge tier unlocking, equal difficulty scaling
**Target Platform**: Android
**Target Launch**: 6-8 weeks from start

