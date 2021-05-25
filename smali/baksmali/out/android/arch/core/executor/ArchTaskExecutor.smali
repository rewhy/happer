.class public Landroid/arch/core/executor/ArchTaskExecutor;
.super Landroid/arch/core/executor/TaskExecutor;
.source "ArchTaskExecutor.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final sIOThreadExecutor:Ljava/util/concurrent/Executor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private static volatile sInstance:Landroid/arch/core/executor/ArchTaskExecutor;

.field private static final sMainThreadExecutor:Ljava/util/concurrent/Executor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# instance fields
.field private mDefaultTaskExecutor:Landroid/arch/core/executor/TaskExecutor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mDelegate:Landroid/arch/core/executor/TaskExecutor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/arch/core/executor/ArchTaskExecutor$1;

    invoke-direct {v0}, Landroid/arch/core/executor/ArchTaskExecutor$1;-><init>()V

    sput-object v0, Landroid/arch/core/executor/ArchTaskExecutor;->sMainThreadExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Landroid/arch/core/executor/ArchTaskExecutor$2;

    invoke-direct {v0}, Landroid/arch/core/executor/ArchTaskExecutor$2;-><init>()V

    sput-object v0, Landroid/arch/core/executor/ArchTaskExecutor;->sIOThreadExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

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
.end method

.method public static getIOThreadExecutor()Ljava/util/concurrent/Executor;
    .registers 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public static getInstance()Landroid/arch/core/executor/ArchTaskExecutor;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    :try_start_a
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
    :try_end_16
    .catchall {:try_start_a .. :try_end_16} :catchall_19

    nop

    nop

    nop

    :catchall_19
    nop

    :try_start_1a
    nop
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    nop
.end method

.method public static getMainThreadExecutor()Ljava/util/concurrent/Executor;
    .registers 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method


# virtual methods
.method public executeOnDiskIO(Ljava/lang/Runnable;)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public isMainThread()Z
    .registers 2

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop
.end method

.method public postToMainThread(Ljava/lang/Runnable;)V
    .registers 3

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public setDelegate(Landroid/arch/core/executor/TaskExecutor;)V
    .registers 2
    .param p1    # Landroid/arch/core/executor/TaskExecutor;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method
