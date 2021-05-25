.class public abstract Landroid/arch/lifecycle/ComputableLiveData;
.super Ljava/lang/Object;
.source "ComputableLiveData.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mComputing:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mInvalid:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final mInvalidationRunnable:Ljava/lang/Runnable;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private final mLiveData:Landroid/arch/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation
.end field

.field final mRefreshRunnable:Ljava/lang/Runnable;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .registers 4
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method static synthetic access$000(Landroid/arch/lifecycle/ComputableLiveData;)Ljava/util/concurrent/Executor;
    .registers 1

    const/4 p0, 0x0

    return-object p0

    nop
.end method

.method static synthetic access$100(Landroid/arch/lifecycle/ComputableLiveData;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .registers 1

    const/4 p0, 0x0

    return-object p0

    nop
.end method

.method static synthetic access$200(Landroid/arch/lifecycle/ComputableLiveData;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .registers 1

    const/4 p0, 0x0

    return-object p0

    nop
.end method

.method static synthetic access$300(Landroid/arch/lifecycle/ComputableLiveData;)Landroid/arch/lifecycle/LiveData;
    .registers 1

    const/4 p0, 0x0

    return-object p0

    nop
.end method


# virtual methods
.method protected abstract compute()Ljava/lang/Object;
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public getLiveData()Landroid/arch/lifecycle/LiveData;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/arch/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public invalidate()V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method
