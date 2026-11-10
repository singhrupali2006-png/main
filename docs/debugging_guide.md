# Flutter Debugging & DevTools Comprehensive Guide (Exp 10b)

This guide documents the full workflow for identifying, diagnosing, and resolving UI and runtime issues using Flutter DevTools and debugging utilities.

---

## 1. Launching Flutter DevTools

Run your application with the debug flag:
```bash
flutter run -d chrome
```

Open DevTools directly via CLI or VS Code:
```bash
flutter pub global activate devtools
flutter run --vmservice-out-file
```

---

## 2. Core DevTools Suites

### A. Flutter Widget Inspector
- **Select Widget Mode**: Click any visual UI element on the screen to jump directly to its widget declaration in source code.
- **Layout Explorer**: Visualizes flex layouts (`Row`, `Column`, `Flex`), interactive constraints, main/cross-axis alignments, and flex coefficients.
- **Show Guidelines / Show Baselines**: Renders constraint boundary boxes and typographic baselines.

### B. Performance & CPU Profiler
- **Timeline Events**: Records UI thread and Raster thread frame execution.
- **Frame Rendering Budget**: Targets **16.6ms** per frame (60 FPS) or **8.3ms** (120 FPS). Highlights dropped frames ("jank") in red.
- **Flame Charts**: Inspects call stacks down to microsecond CPU cycles.

### C. Memory Profiler & Leak Detection
- **Heap Snapshots**: Track Dart objects allocated on the managed heap.
- **Allocation Tracing**: Detect unclosed `AnimationController`, uncancelled `StreamSubscription`, and orphan `ChangeNotifier` listeners.

### D. Network Profiler
- Inspect all outbound HTTP/HTTPS requests, status codes (`200 OK`, `404`, `500`), request headers, query parameters, and response latency.

---

## 3. Resolving Common Flutter Bugs

| Issue | Root Cause | Solution |
| :--- | :--- | :--- |
| **`RenderFlex overflowed by ... pixels`** | Unbounded child inside a `Row` or `Column` | Wrap the child with `Expanded` or `Flexible`, or enclose parent in `SingleChildScrollView`. |
| **`Null check operator used on a null value`** | Force unwrapping (`!`) on a null reference | Use null-coalescing fallback: `user?.name ?? 'Guest'`. |
| **`setState() called after dispose()`** | Async callback executed after screen pop | Guard with `if (mounted) setState(...)`. |
| **`Vertical viewport was given unbounded height`** | `ListView` inside `Column` without constraints | Add `shrinkWrap: true` or wrap in `Expanded`. |
