###### Class com.google.android.gms.common.internal.ClientSettings (com.google.android.gms.common.internal.ClientSettings)
.class public final Lcom/google/android/gms/common/internal/ClientSettings;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/ClientSettings$Builder;,
        Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;
    }
.end annotation


# static fields
.field public static final KEY_CLIENT_SESSION_ID:Ljava/lang/String; = "com.google.android.gms.common.internal.ClientSettings.sessionId"


# instance fields
.field private final zabr:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field private final zabt:I

.field private final zabu:Landroid/view/View;

.field private final zabv:Ljava/lang/String;

.field private final zabw:Ljava/lang/String;

.field private final zaoa:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field private final zaob:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;",
            "Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;",
            ">;"
        }
    .end annotation
.end field

.field private final zaoc:Lcom/google/android/gms/signin/SignInOptions;

.field private zaod:Ljava/lang/Integer;

.field private final zax:Landroid/accounts/Account;


# direct methods
.method public constructor <init>(Landroid/accounts/Account;Ljava/util/Set;Ljava/util/Map;ILandroid/view/View;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/SignInOptions;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;",
            "Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;",
            ">;I",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/signin/SignInOptions;",
            ")V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zax:Landroid/accounts/Account;

    if-nez p2, :cond_a

    .line 4
    sget-object p1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    goto :goto_e

    :cond_a
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    :goto_e
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabr:Ljava/util/Set;

    if-nez p3, :cond_14

    .line 6
    sget-object p3, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    :cond_14
    iput-object p3, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaob:Ljava/util/Map;

    .line 7
    iput-object p5, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabu:Landroid/view/View;

    .line 8
    iput p4, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabt:I

    .line 9
    iput-object p6, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabv:Ljava/lang/String;

    .line 10
    iput-object p7, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabw:Ljava/lang/String;

    .line 11
    iput-object p8, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaoc:Lcom/google/android/gms/signin/SignInOptions;

    .line 12
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 13
    invoke-interface {p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_3f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;

    .line 14
    iget-object p3, p3, Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;->mScopes:Ljava/util/Set;

    invoke-interface {p2, p3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_2d

    .line 16
    :cond_3f
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaoa:Ljava/util/Set;

    return-void
.end method

.method public static createDefault(Landroid/content/Context;)Lcom/google/android/gms/common/internal/ClientSettings;
    .registers 2

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->buildClientSettings()Lcom/google/android/gms/common/internal/ClientSettings;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final getAccount()Landroid/accounts/Account;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zax:Landroid/accounts/Account;

    return-object v0
.end method

.method public final getAccountName()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zax:Landroid/accounts/Account;

    if-eqz v0, :cond_7

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    return-object v0

    :cond_7
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getAccountOrDefault()Landroid/accounts/Account;
    .registers 4

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zax:Landroid/accounts/Account;

    if-eqz v0, :cond_5

    return-object v0

    .line 22
    :cond_5
    new-instance v0, Landroid/accounts/Account;

    const-string v1, "<<default account>>"

    const-string v2, "com.google"

    invoke-direct {v0, v1, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final getAllRequestedScopes()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaoa:Ljava/util/Set;

    return-object v0
.end method

.method public final getApplicableScopes(Lcom/google/android/gms/common/api/Api;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;)",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaob:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;

    if-eqz p1, :cond_20

    .line 36
    iget-object v0, p1, Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;->mScopes:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_20

    .line 38
    :cond_13
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabr:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 39
    iget-object p1, p1, Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;->mScopes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-object v0

    .line 37
    :cond_20
    :goto_20
    iget-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabr:Ljava/util/Set;

    return-object p1
.end method

.method public final getClientSessionId()Ljava/lang/Integer;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaod:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getGravityForPopups()I
    .registers 2

    .line 24
    iget v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabt:I

    return v0
.end method

.method public final getOptionalApiSettings()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;",
            "Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;",
            ">;"
        }
    .end annotation

    .line 27
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaob:Ljava/util/Map;

    return-object v0
.end method

.method public final getRealClientClassName()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 29
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabw:Ljava/lang/String;

    return-object v0
.end method

.method public final getRealClientPackageName()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabv:Ljava/lang/String;

    return-object v0
.end method

.method public final getRequiredScopes()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    .line 25
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabr:Ljava/util/Set;

    return-object v0
.end method

.method public final getSignInOptions()Lcom/google/android/gms/signin/SignInOptions;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaoc:Lcom/google/android/gms/signin/SignInOptions;

    return-object v0
.end method

.method public final getViewForPopups()Landroid/view/View;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zabu:Landroid/view/View;

    return-object v0
.end method

.method public final setClientSessionId(Ljava/lang/Integer;)V
    .registers 2

    .line 33
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings;->zaod:Ljava/lang/Integer;

    return-void
.end method

###### Class com.google.android.gms.common.internal.ClientSettings.Builder (com.google.android.gms.common.internal.ClientSettings$Builder)
.class public final Lcom/google/android/gms/common/internal/ClientSettings$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/ClientSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private zabt:I

.field private zabu:Landroid/view/View;

.field private zabv:Ljava/lang/String;

.field private zabw:Ljava/lang/String;

.field private zaob:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;",
            "Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;",
            ">;"
        }
    .end annotation
.end field

.field private zaoc:Lcom/google/android/gms/signin/SignInOptions;

.field private zaoe:Landroidx/collection/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArraySet<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field private zax:Landroid/accounts/Account;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabt:I

    .line 3
    sget-object v0, Lcom/google/android/gms/signin/SignInOptions;->DEFAULT:Lcom/google/android/gms/signin/SignInOptions;

    iput-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoc:Lcom/google/android/gms/signin/SignInOptions;

    return-void
.end method


# virtual methods
.method public final addAllRequiredScopes(Ljava/util/Collection;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)",
            "Lcom/google/android/gms/common/internal/ClientSettings$Builder;"
        }
    .end annotation

    .line 10
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    if-nez v0, :cond_b

    .line 11
    new-instance v0, Landroidx/collection/ArraySet;

    invoke-direct {v0}, Landroidx/collection/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    .line 12
    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    invoke-virtual {v0, p1}, Landroidx/collection/ArraySet;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public final addRequiredScope(Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 3

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    if-nez v0, :cond_b

    .line 7
    new-instance v0, Landroidx/collection/ArraySet;

    invoke-direct {v0}, Landroidx/collection/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    .line 8
    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    invoke-virtual {v0, p1}, Landroidx/collection/ArraySet;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public final build()Lcom/google/android/gms/common/internal/ClientSettings;
    .registers 11

    .line 26
    new-instance v9, Lcom/google/android/gms/common/internal/ClientSettings;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zax:Landroid/accounts/Account;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoe:Landroidx/collection/ArraySet;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaob:Ljava/util/Map;

    iget v4, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabt:I

    iget-object v5, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabu:Landroid/view/View;

    iget-object v6, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabv:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabw:Ljava/lang/String;

    iget-object v8, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoc:Lcom/google/android/gms/signin/SignInOptions;

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/common/internal/ClientSettings;-><init>(Landroid/accounts/Account;Ljava/util/Set;Ljava/util/Map;ILandroid/view/View;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/SignInOptions;)V

    return-object v9
.end method

.method public final setAccount(Landroid/accounts/Account;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2

    .line 4
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zax:Landroid/accounts/Account;

    return-object p0
.end method

.method public final setGravityForPopups(I)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2

    .line 16
    iput p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabt:I

    return-object p0
.end method

.method public final setOptionalApiSettingsMap(Ljava/util/Map;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;",
            "Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;",
            ">;)",
            "Lcom/google/android/gms/common/internal/ClientSettings$Builder;"
        }
    .end annotation

    .line 14
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaob:Ljava/util/Map;

    return-object p0
.end method

.method public final setRealClientClassName(Ljava/lang/String;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2

    .line 22
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabw:Ljava/lang/String;

    return-object p0
.end method

.method public final setRealClientPackageName(Ljava/lang/String;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2

    .line 20
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabv:Ljava/lang/String;

    return-object p0
.end method

.method public final setSignInOptions(Lcom/google/android/gms/signin/SignInOptions;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2

    .line 24
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zaoc:Lcom/google/android/gms/signin/SignInOptions;

    return-object p0
.end method

.method public final setViewForPopups(Landroid/view/View;)Lcom/google/android/gms/common/internal/ClientSettings$Builder;
    .registers 2

    .line 18
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$Builder;->zabu:Landroid/view/View;

    return-object p0
.end method

###### Class com.google.android.gms.common.internal.ClientSettings.OptionalApiSettings (com.google.android.gms.common.internal.ClientSettings$OptionalApiSettings)
.class public final Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/ClientSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OptionalApiSettings"
.end annotation


# instance fields
.field public final mScopes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/internal/ClientSettings$OptionalApiSettings;->mScopes:Ljava/util/Set;

    return-void
.end method
