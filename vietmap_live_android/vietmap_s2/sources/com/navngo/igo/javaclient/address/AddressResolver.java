package com.navngo.igo.javaclient.address;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AddressResolver {
    static final int DELAY = 100;
    private static final String logname = "AddressResolver";
    private static AddressResolver mResolver;
    private Timer mTimer;

    private AddressResolver() {
        DebugLogger.D5(logname, "AddressResolver::AddressResolver()");
    }

    public static AddressResolver getResolver() {
        if (mResolver == null) {
            mResolver = new AddressResolver();
        }
        return mResolver;
    }

    public void jumpToPosition(GCoor gCoor) {
        DebugLogger.D5(logname, "AddressResolver::jumpToPosition()");
        calculateRouteToPosition(gCoor, false);
    }

    public void calculateRouteToPosition(GCoor gCoor, boolean z) {
        scheduleCommand(new JumpToPositionCommand(gCoor, z), 100);
    }

    public void jumpToAddressSelective(StructuredAddress structuredAddress, String str) {
        DebugLogger.D5(logname, "AddressResolver::jumpToAddressSelective()");
        if (structuredAddress == null || structuredAddress.city.length() <= 0 || structuredAddress.street.length() <= 0) {
            if (str != null) {
                scheduleCommand(new UnstructuredSearchCommand(str), 100);
                return;
            } else {
                DebugLogger.D2(logname, "AddressResolver::jumpToAddressSelective() - uncompleted structured address");
                return;
            }
        }
        if (Config.getBool("android", "old_view_contact_address", false)) {
            DebugLogger.D3(logname, "AddressResolver::jumpToAddressSelective() - using old view contact method");
            scheduleCommand(new UnstructuredSearchCommand(str), 100);
        } else {
            DebugLogger.D3(logname, "AddressResolver::jumpToAddressSelective() - using structured address");
            scheduleCommand(new StructuredSearchCommand(structuredAddress, str), 100);
        }
    }

    public void showErrorMessage() {
        scheduleCommand(new ShowErrorMessageCommand(), 100);
    }

    public boolean jumpToAddress(StructuredAddress structuredAddress) {
        DebugLogger.D5(logname, "AddressResolver::jumpToAddress()");
        if (structuredAddress != null && structuredAddress.city.length() > 0 && structuredAddress.street.length() > 0) {
            if (Config.getBool("android", "old_view_contact_address", false)) {
                DebugLogger.D3(logname, "AddressResolver::jumpToAddress() - using old view contact method");
                scheduleCommand(new UnstructuredSearchCommand(structuredAddress.toString()), 100);
            } else {
                DebugLogger.D3(logname, "AddressResolver::jumpToAddress() - using structured address");
                scheduleCommand(new StructuredSearchCommand(structuredAddress, structuredAddress.toString()), 100);
            }
            return true;
        }
        DebugLogger.D2(logname, "AddressResolver::jumpToAddress() - uncompleted structured address");
        return false;
    }

    public boolean jumpToAddressOrPosition(StructuredAddress structuredAddress, GCoor gCoor) {
        DebugLogger.D5(logname, "AddressResolver::jumpToAddressOrPosition()");
        if (structuredAddress != null && structuredAddress.city.length() > 0 && structuredAddress.street.length() > 0) {
            DebugLogger.D3(logname, "AddressResolver::jumpToAddressOrPosition() - looking up the address, the position will be used if the address cannot be found");
            scheduleCommand(new JumpToAddressOrPositionCommand(structuredAddress, gCoor), 100);
            return true;
        }
        if (gCoor.isValid()) {
            DebugLogger.D3(logname, "AddressResolver::jumpToAddressOrPosition() - address is incomplete, jumping to position");
            scheduleCommand(new JumpToPositionCommand(gCoor, false), 100);
            return true;
        }
        DebugLogger.D2(logname, "AddressResolver::jumpToAddress() - invalid address and no position found, there's nothing to do");
        return false;
    }

    private void scheduleCommand(Runnable runnable, int i) {
        CommandRunnerTask commandRunnerTask = new CommandRunnerTask(runnable);
        if (this.mTimer == null) {
            this.mTimer = new Timer();
        }
        this.mTimer.schedule(commandRunnerTask, i);
    }

    private static class CommandRunnerTask extends TimerTask {
        private Runnable mCommand;

        public CommandRunnerTask(Runnable runnable) {
            this.mCommand = runnable;
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            this.mCommand.run();
        }
    }

    private static class UnstructuredSearchCommand implements Runnable {
        private String mAddress;

        public UnstructuredSearchCommand(String str) {
            this.mAddress = str;
        }

        @Override // java.lang.Runnable
        public void run() {
            doUnstructuredSearch(this.mAddress);
        }

        private void doUnstructuredSearch(String str) {
            DebugLogger.D5(AddressResolver.logname, "UnstructuredSearchCommand::doUnstructuredSearch()");
            AndroidGo.getInstance().callIgo("other.android.goto_location", new AndroidGo.IActionSucceeded() { // from class: com.navngo.igo.javaclient.address.AddressResolver.UnstructuredSearchCommand.1
                @Override // com.navngo.igo.javaclient.androidgo.AndroidGo.IActionSucceeded
                public void actionSucceeded(String str2, boolean z) {
                    if (z) {
                        return;
                    }
                    AndroidGo.getInstance().callUI("sc_ShowNoGcoorMessageBox", null, new Object[0]);
                }
            }, str);
        }
    }

    private static class StructuredSearchCommand implements Runnable {
        private StructuredAddress mAddr;
        private String mAddressStr;

        public StructuredSearchCommand(StructuredAddress structuredAddress, String str) {
            this.mAddr = structuredAddress;
            this.mAddressStr = str;
        }

        @Override // java.lang.Runnable
        public void run() {
            doStructuredSearch(this.mAddr, this.mAddressStr);
        }

        private void doStructuredSearch(StructuredAddress structuredAddress, String str) {
            DebugLogger.D5(AddressResolver.logname, "StructuredSearchCommand::doStructuredSearch()");
            AndroidGo.getInstance().callIgo("other.android.start_structured_address_resolving", new AndroidGo.IActionSucceeded() { // from class: com.navngo.igo.javaclient.address.AddressResolver.StructuredSearchCommand.1
                @Override // com.navngo.igo.javaclient.androidgo.AndroidGo.IActionSucceeded
                public void actionSucceeded(String str2, boolean z) {
                    if (z) {
                        return;
                    }
                    AndroidGo.getInstance().callUI("sc_ShowNoGcoorMessageBox", null, new Object[0]);
                }
            }, structuredAddress.country, structuredAddress.state, structuredAddress.city, structuredAddress.street, structuredAddress.zip, str);
        }
    }

    private static class JumpToPositionCommand implements Runnable {
        private int mCalculateRoute;
        private GCoor mPos;

        public JumpToPositionCommand(GCoor gCoor, boolean z) {
            this.mPos = gCoor;
            this.mCalculateRoute = z ? 1 : 0;
        }

        @Override // java.lang.Runnable
        public void run() {
            AndroidGo.getInstance().callIgo("other.android.goto_location_pos", null, this.mPos, Integer.valueOf(this.mCalculateRoute));
        }
    }

    private static class JumpToAddressOrPositionCommand implements Runnable {
        private StructuredAddress mAddr;
        private GCoor mPos;

        public JumpToAddressOrPositionCommand(StructuredAddress structuredAddress, GCoor gCoor) {
            this.mPos = gCoor;
            this.mAddr = structuredAddress;
        }

        @Override // java.lang.Runnable
        public void run() {
            DebugLogger.D5(AddressResolver.logname, "JumpToAddressOrPositionCommand::run()");
            AndroidGo.getInstance().callIgo("other.android.goto_address_or_position", null, this.mAddr.country, this.mAddr.state, this.mAddr.city, this.mAddr.street, this.mAddr.zip, this.mPos);
        }
    }

    private static class ShowErrorMessageCommand implements Runnable {
        private ShowErrorMessageCommand() {
        }

        @Override // java.lang.Runnable
        public void run() {
            AndroidGo.getInstance().callUI("sc_ShowNoGcoorMessageBox", null, new Object[0]);
        }
    }
}
