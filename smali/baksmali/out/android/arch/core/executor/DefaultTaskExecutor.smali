.class public Landroid/arch/core/executor/DefaultTaskExecutor;
.super Landroid/arch/core/executor/TaskExecutor;
.source "DefaultTaskExecutor.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private mDiskIO:Ljava/util/concurrent/ExecutorService;

.field private final mLock:Ljava/lang/Object;

.field private volatile mMainHandler:Landroid/os/Handler;
    .annotation build Landroid/support/annotation/Nullable;
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
    .registers 3

    const/4 v0, 0x0

    return v0

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

.method public postToMainThread(Ljava/lang/Runnable;)V
    .registers 5

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    :try_start_7
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

    :catchall_18
    nop

    nop
    :try_end_1a
    .catchall {:try_start_7 .. :try_end_1a} :catchall_18

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method
