###### Class com.navngo.igo.javaclient.address.AddressResolver (com.navngo.igo.javaclient.address.AddressResolver)
.class public Lcom/navngo/igo/javaclient/address/AddressResolver;
.super Ljava/lang/Object;
.source "AddressResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/address/AddressResolver$ShowErrorMessageCommand;,
        Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;,
        Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;,
        Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;,
        Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;,
        Lcom/navngo/igo/javaclient/address/AddressResolver$CommandRunnerTask;
    }
.end annotation


# static fields
.field static final DELAY:I = 0x64

.field private static final logname:Ljava/lang/String; = "AddressResolver"

.field private static mResolver:Lcom/navngo/igo/javaclient/address/AddressResolver;


# instance fields
.field private mTimer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "AddressResolver"

    const-string v1, "AddressResolver::AddressResolver()"

    .line 26
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;
    .registers 1

    .line 32
    sget-object v0, Lcom/navngo/igo/javaclient/address/AddressResolver;->mResolver:Lcom/navngo/igo/javaclient/address/AddressResolver;

    if-nez v0, :cond_b

    .line 33
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/address/AddressResolver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/address/AddressResolver;->mResolver:Lcom/navngo/igo/javaclient/address/AddressResolver;

    .line 36
    :cond_b
    sget-object v0, Lcom/navngo/igo/javaclient/address/AddressResolver;->mResolver:Lcom/navngo/igo/javaclient/address/AddressResolver;

    return-object v0
.end method

.method private scheduleCommand(Ljava/lang/Runnable;I)V
    .registers 6

    .line 143
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$CommandRunnerTask;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver$CommandRunnerTask;-><init>(Ljava/lang/Runnable;)V

    .line 144
    iget-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver;->mTimer:Ljava/util/Timer;

    if-nez p1, :cond_10

    .line 145
    new-instance p1, Ljava/util/Timer;

    invoke-direct {p1}, Ljava/util/Timer;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver;->mTimer:Ljava/util/Timer;

    .line 148
    :cond_10
    iget-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver;->mTimer:Ljava/util/Timer;

    int-to-long v1, p2

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    return-void
.end method


# virtual methods
.method public calculateRouteToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V
    .registers 4

    .line 49
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;

    invoke-direct {v0, p1, p2}, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;-><init>(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    const/16 p1, 0x64

    invoke-direct {p0, v0, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    return-void
.end method

.method public jumpToAddress(Lcom/navngo/igo/javaclient/address/StructuredAddress;)Z
    .registers 6

    const-string v0, "AddressResolver"

    const-string v1, "AddressResolver::jumpToAddress()"

    .line 94
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    if-eqz p1, :cond_4b

    .line 96
    iget-object v2, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4b

    iget-object v2, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4b

    const-string v2, "android"

    const-string v3, "old_view_contact_address"

    .line 97
    invoke-static {v2, v3, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    const/16 v2, 0x64

    if-eqz v1, :cond_38

    const-string v1, "AddressResolver::jumpToAddress() - using old view contact method"

    .line 98
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v2}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    goto :goto_49

    :cond_38
    const-string v1, "AddressResolver::jumpToAddress() - using structured address"

    .line 101
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;-><init>(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    invoke-direct {p0, v0, v2}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    :goto_49
    const/4 v1, 0x1

    goto :goto_50

    :cond_4b
    const-string p1, "AddressResolver::jumpToAddress() - uncompleted structured address"

    .line 107
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_50
    return v1
.end method

.method public jumpToAddressOrPosition(Lcom/navngo/igo/javaclient/address/StructuredAddress;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)Z
    .registers 8

    const-string v0, "AddressResolver"

    const-string v1, "AddressResolver::jumpToAddressOrPosition()"

    .line 114
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    const/16 v2, 0x64

    const/4 v3, 0x0

    if-eqz p1, :cond_2b

    .line 116
    iget-object v4, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2b

    iget-object v4, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2b

    const-string v3, "AddressResolver::jumpToAddressOrPosition() - looking up the address, the position will be used if the address cannot be found"

    .line 117
    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;

    invoke-direct {v0, p1, p2}, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;-><init>(Lcom/navngo/igo/javaclient/address/StructuredAddress;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V

    invoke-direct {p0, v0, v2}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    goto :goto_45

    .line 120
    :cond_2b
    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result p1

    if-eqz p1, :cond_3f

    const-string p1, "AddressResolver::jumpToAddressOrPosition() - address is incomplete, jumping to position"

    .line 121
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    new-instance p1, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;

    invoke-direct {p1, p2, v3}, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;-><init>(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    invoke-direct {p0, p1, v2}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    goto :goto_45

    :cond_3f
    const-string p1, "AddressResolver::jumpToAddress() - invalid address and no position found, there\'s nothing to do"

    .line 127
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_45
    return v1
.end method

.method public jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V
    .registers 8

    const-string v0, "AddressResolver"

    const-string v1, "AddressResolver::jumpToAddressSelective()"

    .line 62
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v1, 0x64

    if-eqz p1, :cond_42

    .line 63
    iget-object v2, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_42

    iget-object v2, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_42

    const/4 v2, 0x0

    const-string v3, "android"

    const-string v4, "old_view_contact_address"

    .line 68
    invoke-static {v3, v4, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_34

    const-string p1, "AddressResolver::jumpToAddressSelective() - using old view contact method"

    .line 69
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    new-instance p1, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;

    invoke-direct {p1, p2}, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    goto :goto_52

    :cond_34
    const-string v2, "AddressResolver::jumpToAddressSelective() - using structured address"

    .line 72
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;

    invoke-direct {v0, p1, p2}, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;-><init>(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    goto :goto_52

    :cond_42
    if-eqz p2, :cond_4d

    .line 77
    new-instance p1, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;

    invoke-direct {p1, p2}, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    goto :goto_52

    :cond_4d
    const-string p1, "AddressResolver::jumpToAddressSelective() - uncompleted structured address"

    .line 79
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_52
    return-void
.end method

.method public jumpToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V
    .registers 4

    const-string v0, "AddressResolver"

    const-string v1, "AddressResolver::jumpToPosition()"

    .line 44
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/address/AddressResolver;->calculateRouteToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    return-void
.end method

.method public showErrorMessage()V
    .registers 3

    .line 84
    new-instance v0, Lcom/navngo/igo/javaclient/address/AddressResolver$ShowErrorMessageCommand;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver$ShowErrorMessageCommand;-><init>(Lcom/navngo/igo/javaclient/address/AddressResolver$1;)V

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->scheduleCommand(Ljava/lang/Runnable;I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.AnonymousClass1 (com.navngo.igo.javaclient.address.AddressResolver$1)
.class synthetic Lcom/navngo/igo/javaclient/address/AddressResolver$1;
.super Ljava/lang/Object;
.source "AddressResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation

###### Class com.navngo.igo.javaclient.address.AddressResolver.CommandRunnerTask (com.navngo.igo.javaclient.address.AddressResolver$CommandRunnerTask)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$CommandRunnerTask;
.super Ljava/util/TimerTask;
.source "AddressResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CommandRunnerTask"
.end annotation


# instance fields
.field private mCommand:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 157
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 158
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$CommandRunnerTask;->mCommand:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 163
    iget-object v0, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$CommandRunnerTask;->mCommand:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.JumpToAddressOrPositionCommand (com.navngo.igo.javaclient.address.AddressResolver$JumpToAddressOrPositionCommand)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JumpToAddressOrPositionCommand"
.end annotation


# instance fields
.field private mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

.field private mPos:Lcom/navngo/igo/javaclient/androidgo/types/GCoor;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/address/StructuredAddress;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V
    .registers 3

    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    iput-object p2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mPos:Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    .line 256
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    const-string v0, "AddressResolver"

    const-string v1, "JumpToAddressOrPositionCommand::run()"

    .line 260
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    const/4 v3, 0x4

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToAddressOrPositionCommand;->mPos:Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    const/4 v3, 0x5

    aput-object v2, v1, v3

    const-string v2, "other.android.goto_address_or_position"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.JumpToPositionCommand (com.navngo.igo.javaclient.address.AddressResolver$JumpToPositionCommand)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JumpToPositionCommand"
.end annotation


# instance fields
.field private mCalculateRoute:I

.field private mPos:Lcom/navngo/igo/javaclient/androidgo/types/GCoor;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V
    .registers 3

    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;->mPos:Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    .line 241
    iput p2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;->mCalculateRoute:I

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 245
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;->mPos:Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$JumpToPositionCommand;->mCalculateRoute:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "other.android.goto_location_pos"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.ShowErrorMessageCommand (com.navngo.igo.javaclient.address.AddressResolver$ShowErrorMessageCommand)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$ShowErrorMessageCommand;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ShowErrorMessageCommand"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/address/AddressResolver$1;)V
    .registers 2

    .line 266
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/address/AddressResolver$ShowErrorMessageCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 268
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "sc_ShowNoGcoorMessageBox"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.StructuredSearchCommand (com.navngo.igo.javaclient.address.AddressResolver$StructuredSearchCommand)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StructuredSearchCommand"
.end annotation


# instance fields
.field private mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

.field private mAddressStr:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V
    .registers 3

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    .line 212
    iput-object p2, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;->mAddressStr:Ljava/lang/String;

    return-void
.end method

.method private doStructuredSearch(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V
    .registers 8

    const-string v0, "AddressResolver"

    const-string v1, "StructuredSearchCommand::doStructuredSearch()"

    .line 220
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    .line 222
    new-instance v1, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand$1;-><init>(Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;)V

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-object v3, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget-object v3, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    const/4 v4, 0x3

    aput-object v3, v2, v4

    iget-object p1, p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    const/4 v3, 0x4

    aput-object p1, v2, v3

    const/4 p1, 0x5

    aput-object p2, v2, p1

    const-string p1, "other.android.start_structured_address_resolving"

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 216
    iget-object v0, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;->mAddr:Lcom/navngo/igo/javaclient/address/StructuredAddress;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;->mAddressStr:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;->doStructuredSearch(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.StructuredSearchCommand.AnonymousClass1 (com.navngo.igo.javaclient.address.AddressResolver$StructuredSearchCommand$1)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand$1;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;->doStructuredSearch(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;)V
    .registers 2

    .line 223
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand$1;->this$0:Lcom/navngo/igo/javaclient/address/AddressResolver$StructuredSearchCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionSucceeded(Ljava/lang/String;Z)V
    .registers 5

    if-nez p2, :cond_f

    .line 226
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const/4 p2, 0x0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "sc_ShowNoGcoorMessageBox"

    invoke-virtual {p1, v1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :cond_f
    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.UnstructuredSearchCommand (com.navngo.igo.javaclient.address.AddressResolver$UnstructuredSearchCommand)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UnstructuredSearchCommand"
.end annotation


# instance fields
.field private mAddress:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;->mAddress:Ljava/lang/String;

    return-void
.end method

.method private doUnstructuredSearch(Ljava/lang/String;)V
    .registers 6

    const-string v0, "AddressResolver"

    const-string v1, "UnstructuredSearchCommand::doUnstructuredSearch()"

    .line 187
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    .line 189
    new-instance v1, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand$1;-><init>(Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string p1, "other.android.goto_location"

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 179
    iget-object v0, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;->mAddress:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;->doUnstructuredSearch(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.address.AddressResolver.UnstructuredSearchCommand.AnonymousClass1 (com.navngo.igo.javaclient.address.AddressResolver$UnstructuredSearchCommand$1)
.class Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand$1;
.super Ljava/lang/Object;
.source "AddressResolver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;->doUnstructuredSearch(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;)V
    .registers 2

    .line 190
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand$1;->this$0:Lcom/navngo/igo/javaclient/address/AddressResolver$UnstructuredSearchCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionSucceeded(Ljava/lang/String;Z)V
    .registers 5

    if-nez p2, :cond_f

    .line 193
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const/4 p2, 0x0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "sc_ShowNoGcoorMessageBox"

    invoke-virtual {p1, v1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :cond_f
    return-void
.end method
