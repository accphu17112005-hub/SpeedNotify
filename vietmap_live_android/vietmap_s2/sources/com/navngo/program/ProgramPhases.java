package com.navngo.program;

import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ServerRunner;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ProgramPhases {
    private static ProgramPhases sInstance;
    private Phase mPhase = Phase.NOT_STARTED;
    private NNGInterface mInterface = new NNGInterface();
    private Map<Phase, List<Task>> mTasks = new HashMap();

    public enum Phase {
        NOT_STARTED(0),
        PREINIT(10),
        FILESYSINIT(20),
        CONFIG_READY(30),
        INTROSCREEN(35),
        STARTUP(40),
        LANGUAGE_READY(50),
        CONTENT_READY(60),
        PREPARE_FOR_UI(70),
        UI_READY(80),
        RUNNING(90),
        CLOSE_SIGNAL(100),
        NO_MORE_INPUT(110);

        private final int mCode;

        Phase(int i) {
            this.mCode = i;
        }

        public int getCode() {
            return this.mCode;
        }

        public static Phase fromCode(int i) {
            for (Phase phase : values()) {
                if (phase.mCode == i) {
                    return phase;
                }
            }
            throw new RuntimeException(String.format("No phase exists for code: %d", Integer.valueOf(i)));
        }
    }

    public static synchronized ProgramPhases getInstance() {
        if (sInstance == null) {
            sInstance = new ProgramPhases();
            ServerRunner.addEngineStoppedCallback(new Runnable() { // from class: com.navngo.program.ProgramPhases.1
                @Override // java.lang.Runnable
                public void run() {
                    ProgramPhases unused = ProgramPhases.sInstance = null;
                }
            });
        }
        return sInstance;
    }

    public synchronized Phase getPhase() {
        return this.mPhase;
    }

    public void waitForPhase(Phase phase, boolean z, Runnable runnable) {
        waitForPhase(phase, z, 100, runnable);
    }

    public void waitForPhase(Phase phase, boolean z, int i, Runnable runnable) {
        boolean z2;
        synchronized (this) {
            z2 = this.mPhase.getCode() >= phase.getCode();
        }
        if (z2) {
            if (z) {
                addTask(phase, runnable, i, z);
            }
            runnable.run();
            return;
        }
        addTask(phase, runnable, i, z);
    }

    public void removeTask(Runnable runnable) {
        removeTask(null, runnable);
    }

    public void removeTask(Phase phase, Runnable runnable) {
        synchronized (this.mTasks) {
            if (phase != null) {
                List<Task> list = this.mTasks.get(phase);
                for (Task task : list) {
                    if (task.task.equals(runnable)) {
                        list.remove(task);
                        return;
                    }
                }
            } else {
                Iterator<Phase> it = this.mTasks.keySet().iterator();
                while (it.hasNext()) {
                    List<Task> list2 = this.mTasks.get(it.next());
                    Iterator<Task> it2 = list2.iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            Task next = it2.next();
                            if (next.task.equals(runnable)) {
                                list2.remove(next);
                                break;
                            }
                        }
                    }
                }
            }
        }
    }

    private void addTask(Phase phase, Runnable runnable, int i, boolean z) {
        synchronized (this.mTasks) {
            this.mTasks.get(phase).add(new Task(runnable, i, z));
        }
    }

    private static class Task implements Comparable<Task> {
        public final boolean callAlways;
        public int order;
        public Runnable task;

        public Task(Runnable runnable, int i, boolean z) {
            this.task = runnable;
            this.order = i;
            this.callAlways = z;
        }

        @Override // java.lang.Comparable
        public int compareTo(Task task) {
            return this.order - task.order;
        }
    }

    private ProgramPhases() {
        for (Phase phase : Phase.values()) {
            this.mTasks.put(phase, new ArrayList());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syncPhase(Phase phase) {
        DebugLogger.D4("ProgramPhases", "Program phase reached: " + phase.toString());
        synchronized (this) {
            this.mPhase = phase;
        }
        ArrayList arrayList = null;
        synchronized (this.mTasks) {
            List<Task> list = this.mTasks.get(phase);
            if (list != null) {
                arrayList = new ArrayList(list);
                for (int size = list.size() - 1; size >= 0; size--) {
                    if (!list.get(size).callAlways) {
                        list.remove(size);
                    }
                }
            }
        }
        if (arrayList != null) {
            Collections.sort(arrayList);
            runTasks(arrayList);
        }
    }

    private void runTasks(List<Task> list) {
        Iterator<Task> it = list.iterator();
        while (it.hasNext()) {
            it.next().task.run();
        }
    }

    private class NNGInterface {
        public NNGInterface() {
            AndroidGo.getInstance().registerFunctor("android.program_phases.sync", this, "syncPhase");
        }

        public void syncPhase(int i) {
            try {
                ProgramPhases.this.syncPhase(Phase.fromCode(i));
            } catch (RuntimeException e) {
                DebugLogger.D1("ProgramPhases", "Exception while synchr5onizing phase.", e);
            }
        }
    }
}
